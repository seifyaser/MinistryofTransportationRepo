import 'package:flutter/material.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/comparePeriodTab.dart';
import 'package:project/Widgets/CustomHeader.dart';
import 'package:project/Widgets/RevenueDateSearch.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/RevenueDetailsTab.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/RevenueTypeSwitch.dart';
import 'package:project/Widgets/ShowEmptyWidget.dart';
import 'package:project/utils/visibilityHelper.dart';
class MonthlyRevenueScreen extends StatefulWidget {
  @override
  _MonthlyRevenueScreenState createState() => _MonthlyRevenueScreenState();
}

class _MonthlyRevenueScreenState extends State<MonthlyRevenueScreen> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  bool _showResults = false;
  bool _showRevenuePercentage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(title: 'الايرادات و حركة النشاط الشهرية'),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(10),
              child: ListView(
                children: [

                  RevenueDateSearch(
                    fromDateController: _fromDateController,
                    toDateController: _toDateController,
                    onSearchPressed: () {
                      final valid = SearchHelper.validateDates(
                        context: context,
                        from: _fromDateController.text,
                        to: _toDateController.text,
                      );

                      setState(() {
                        _showResults = valid;
                      });
                    },
                  ),

                  const SizedBox(height: 20),

   // ... spread operator
                  if (_showResults) ...[
                    RevenueTypeSwitch(
                      showRevenuePercentage: _showRevenuePercentage,
                      onChanged: (value) {
                        setState(() {
                          _showRevenuePercentage = value;
                        });
                      },
                    ),
                    const SizedBox(height: 20),

                    _showRevenuePercentage
                        ?RevenuePieDetailsTab ( // م تفاصيل الايرادات
                            ContainerRevenueDetailsText: 'جدول الايرادات والحركات الشهرية',
                            SearchFieldHintText: 'بحث في جدول الايرادات والحركات الشهرية',
                          )
                        : ComparePeriodTab ( //قارن مة المدة //
                            containerRevenueDetailsText: 'جدول الايرادات والحركات الشهرية',
                            searchFieldHintText: 'بحث في جدول الايرادات والحركات الشهرية',
                             fromDate: _fromDateController.text,
                              toDate: _toDateController.text,
                          ),


                    const SizedBox(height: 20),
                  ]

                  else
                   Showemptywidget()
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
