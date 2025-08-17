import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:project/Core/cubits/forign_bi_speific_entity/forign_bi_specific_entity_cubit.dart';
import 'package:project/Core/cubits/forign_bi_speific_entity/forign_bi_specific_entity_state.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/PieChartWithLegend.dart';
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
  final ScrollController _legendScrollController = ScrollController();
  final ScrollController _detailScrollController = ScrollController();

  String _searchText = '';

  @override
  void dispose() {
    _searchController.dispose();
    _legendScrollController.dispose();
    _detailScrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create:
          (_) => ForignBiSpecificEntityCubit(BiSpecificEntity())
            ..fetchRevenues(fromDate: widget.fromDate, toDate: widget.toDate),
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
            final entities = state.data.where(
                      (e) => e.currEntityName.toLowerCase().contains( _searchText.toLowerCase() ),).toList();

            if (entities.isEmpty) {
              return const Center(
                child: Text(
                  'لا يوجد بيانات',
                  style: TextStyle(color: Colors.red),
                ),
              );
            }

            final double totalRevenue = entities.fold(
              0.0,
              (sum, e) => sum + (e.currTotalEgpIncome ?? 0),
            );

            final pieChartSections = List.generate(entities.length, (index) {
              final entity = entities[index];
              return PieChartSectionData(
                radius: 65,
                color: Colors.primaries[index % Colors.primaries.length],
                value: entity.currTotalEgpIncome ?? 0,
                title: '',
                titleStyle: const TextStyle(),
              );
            });

            double totalEuro = 0;
            double totalUsd = 0;
            double totalEgp = 0;
            double totalEgpTotal = 0;

            for (var e in entities) {
              totalEuro += e.currEuroIncome ?? 0;
              totalUsd += e.currUsdIncome ?? 0;
              totalEgp += e.currEgpIncome ?? 0;
              totalEgpTotal += e.currTotalEgpIncome ?? 0;
            }

            return Column(
              children: [
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: boxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Text(
                        'نسبة الايرادات لكل جهة',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF38628B),
                        ),
                        textDirection: TextDirection.rtl,
                      ),
                      Text(
                        'الفترة من ${widget.fromDate} إلى ${widget.toDate}',
                        style: const TextStyle(
                          fontSize: 15,
                          color: Colors.grey,
                        ),
                      ),
                      const SizedBox(height: 20),
                      PieChartWithLegend(
                        entities: entities,
                        totalRevenue: totalRevenue,
                        legendScrollController: _legendScrollController,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10),
                Container(
                  margin: const EdgeInsets.symmetric(horizontal: 20),
                  padding: const EdgeInsets.all(15),
                  decoration: boxDecoration(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      TitleConatinerRevenue(
                        title: widget.containerRevenueDetailsText,
                      ),
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
                        child: Scrollbar(
                          thickness: 10,
                          thumbVisibility: true,
                          scrollbarOrientation: ScrollbarOrientation.left,
                          controller: _detailScrollController,
                          child: ListView.separated(
                            controller: _detailScrollController,
                            itemCount: entities.length,
                            separatorBuilder:
                                (_, __) => const SizedBox(height: 10),
                            itemBuilder: (context, index) {
                              final item = entities[index];
                              return Container(
                                padding: const EdgeInsets.all(12),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                child: RowsrevenueTabdetails(entity: item),
                              );
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                TotalRevenueTabDetailsContainer(
                  euroIncome: totalEuro,
                  usdIncome: totalUsd,
                  egpIncome: totalEgp,
                  totalEgpIncome: totalEgpTotal,
                ),
              ],
            );
          }
          return const SizedBox.shrink();
        },
      ),
    );
  }
}
