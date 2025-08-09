import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/forign_bi_speific_entity/forign_bi_specific_entity_state.dart';
import 'package:project/Core/forign_bi_speific_entity/forign_bi_specific_entity_cubit.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/PieChart.dart';
import 'package:project/Widgets/RowsRevenueTabDetails.dart';
import 'package:project/Widgets/RevenueDeatailsContainer.dart';
import 'package:project/Widgets/TOTALRevenue_RevenueTabDetails.dart';
import 'package:project/Services/forign_bi_specific_enitity.dart';

class RevenuePieDetailsTab extends StatefulWidget {
  final String containerRevenueDetailsText;
  final String searchFieldHintText;
  final String fromDate;
  final String toDate;

  const RevenuePieDetailsTab({
    super.key,
    required this.containerRevenueDetailsText,
    required this.searchFieldHintText,
    required this.fromDate,
    required this.toDate,
  });

  @override
  State<RevenuePieDetailsTab> createState() => _RevenuePieDetailsTabState();
}

class _RevenuePieDetailsTabState extends State<RevenuePieDetailsTab> {
  final _searchController = TextEditingController();
  String _searchText = '';

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ForignBiSpecificEntityCubit(BiSpecificEntity())
        ..fetchReport(
          fromDate: widget.fromDate,
          toDate: widget.toDate,
        ),
      child: Column(
        children: [
          RevenuePieChart(),
          const SizedBox(height: 10),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 20),
            padding: const EdgeInsets.all(15),
            decoration: boxDecoration(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisSize: MainAxisSize.min,
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
                  child: BlocBuilder<ForignBiSpecificEntityCubit, BiSpecificEntityState>(
                    builder: (context, state) {
                      if (state is BiSpecificEntityLoading) {
                        return const Center(child: CircularProgressIndicator());
                      } else if (state is BiSpecificEntityError) {
                        return Center(
                          child: Text(
                            state.message,
                            style: const TextStyle(color: Colors.red),
                          ),
                        );
                      } else if (state is BiSpecificEntityLoaded) {
                        final entities = state.data
                            .where((e) => e.currEntityName
                                .toLowerCase()
                                .contains(_searchText.toLowerCase()))
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
                              child: RowsrevenueTabdetails(entity: item),
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


          BlocBuilder<ForignBiSpecificEntityCubit, BiSpecificEntityState>(
            builder: (context, state) {
              if (state is BiSpecificEntityLoaded) {
                final entities = state.data
                    .where((e) => e.currEntityName
                        .toLowerCase()
                        .contains(_searchText.toLowerCase()))
                    .toList();

                // حساب الإجماليات
                final totalEuro = entities.fold<double>(0, (sum, e) => sum + (e.currEuroIncome ?? 0));
                final totalUsd = entities.fold<double>(0, (sum, e) => sum + (e.currUsdIncome ?? 0));
                final totalEgp = entities.fold<double>(0, (sum, e) => sum + (e.currEgpIncome ?? 0));
                final totalEgpTotal = entities.fold<double>(0, (sum, e) => sum + (e.currTotalEgpIncome ?? 0));

                return TotalRevenueTabDetailsContainer(
                  euroIncome: totalEuro,
                  usdIncome: totalUsd,
                  egpIncome: totalEgp,
                  totalEgpIncome: totalEgpTotal,
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
