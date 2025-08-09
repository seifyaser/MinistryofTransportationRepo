import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart'; 
import 'package:project/Core/specific_entity_income/specific_entity_income_cubit.dart';
import 'package:project/Core/specific_entity_income/specific_entity_income_state.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/BarChart.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';
import 'package:project/Widgets/RowsCompareTabDetails.dart';
import 'package:project/Widgets/TOTALRevenue_CompareTabDetails.dart';

class ComparePeriodTab extends StatefulWidget {
  final String containerRevenueDetailsText;
  final String searchFieldHintText;
  final String fromDate;
  final String toDate;

  const ComparePeriodTab({
    super.key,
    required this.containerRevenueDetailsText,
    required this.searchFieldHintText,
    required this.fromDate,
    required this.toDate,
  });

  @override
  State<ComparePeriodTab> createState() => _ComparePeriodTabState();
}

class _ComparePeriodTabState extends State<ComparePeriodTab> {
  final _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => SpecificEntityCubit()
        ..fetchSpecificEntityData(
          fromDate: widget.fromDate,
          toDate: widget.toDate,
          statementStatus: 1,
        ),
      child: Column(
        children: [
          RevenueBarChartCard(),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(15),
            decoration: boxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TitleConatinerRevenue(title: widget.containerRevenueDetailsText),
                const SizedBox(height: 20),
                Searchfield(
                  text: widget.searchFieldHintText,
                  controller: _searchController,
                  onChanged: (value) {
                    setState(() {
                      _searchText = value;
                    });
                  },
                ),
                const SizedBox(height: 15),
                SizedBox(
                  height: 400,
                  child: BlocBuilder<SpecificEntityCubit, SpecificEntityIncomeState>(
                    builder: (context, state) {
                      if (state is SpecificEntityIncomeLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is SpecificEntityIncomeError) {
                        return Center(child: Text(state.message, style: const TextStyle(color: Colors.red)));
                      } else if (state is SpecificEntityIncomeLoaded) {
                        final entities = state.comparePeriodModel.data
                            .where((e) =>
                                e.currEntityName.contains(_searchText) ||
                                e.currEntityName.toLowerCase().contains(_searchText.toLowerCase()))
                            .toList();

                        if (entities.isEmpty) {
                          return const Center(
                            child: Text(
                              '!!مفيش بيانات من التاريخ ده',
                              style: TextStyle(color: Colors.red),
                            ),
                          );
                        }

                        return ListView.separated(
                          itemCount: entities.length,
                          separatorBuilder: (_, __) => const SizedBox(height: 10),
                          itemBuilder: (context, index) {
                            final item = entities[index];
                            return Container(
                              padding: const EdgeInsets.all(12),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                border: Border.all(color: Colors.grey.shade400),
                              ),
                              child: RowscompareTabdetails(entity: item),
                            );
                          },
                        );
                      }
                      return const SizedBox.shrink();
                    },
                  ),
                ),
              ],
            ),
          ),

          BlocBuilder<SpecificEntityCubit, SpecificEntityIncomeState>(
            builder: (context, state) {
              if (state is SpecificEntityIncomeLoaded) {
                final filteredEntities = state.comparePeriodModel.data
                    .where((e) =>
                        e.currEntityName.toLowerCase().contains(_searchText.toLowerCase()) ||
                        e.currEntityName.contains(_searchText))
                    .toList();

                // حساب الإجماليات
                final double periodTotal = filteredEntities.fold(
                    0, (sum, e) => sum + (e.currTotalEgpIncome ?? 0));
                final double prevPeriodTotal = filteredEntities.fold(
                    0, (sum, e) => sum + (e.prevTotalEgpIncome ?? 0));
                final double diff = periodTotal - prevPeriodTotal;
                final String changePercent = prevPeriodTotal == 0
                    ? '0%'
                    : '${((diff / prevPeriodTotal) * 100).toStringAsFixed(2)}%';

                // تنسيق الأرقام مع الفواصل
                final formatter = NumberFormat('#,###');
                final formattedPeriodTotal = formatter.format(periodTotal);
                final formattedPrevPeriodTotal = formatter.format(prevPeriodTotal);
                final formattedDiff = formatter.format(diff.abs());

                return TOTALRevenueCompareTabDetailsContainer(
                  periodIncome: formattedPeriodTotal,
                  prevPeriodIncome: formattedPrevPeriodTotal,
                  changePercent: changePercent,
                  difference: diff >= 0 ? formattedDiff : '-$formattedDiff',
                );
              }
              return const SizedBox.shrink();
            },
          ),
        ],
      ),
    );
  }
}
