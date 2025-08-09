import 'package:flutter/material.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/comparePeriodTab.dart';
import 'package:project/Widgets/CustomHeader.dart';
import 'package:project/Widgets/RevenueDateSearch.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/RevenueDetailsTab.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/RevenueTypeSwitch.dart';
import 'package:project/Widgets/ShowEmptyWidget.dart';
import 'package:project/utils/visibilityHelper.dart';

class DailyRevenueScreen extends StatefulWidget {
  @override
  _DailyRevenueScreenState createState() => _DailyRevenueScreenState();
}

class _DailyRevenueScreenState extends State<DailyRevenueScreen> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();
  bool _showResults = false;
  bool _showRevenuePercentage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(title: 'الايرادات و حركة النشاط اليومية'),
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
                        ? ComparePeriodTab(
                            containerRevenueDetailsText: 'جدول الايرادات والحركات اليومية',
                            searchFieldHintText: 'بحث في جدول الايرادات والحركات اليومية',
                             fromDate: _fromDateController.text,
                              toDate: _toDateController.text,
                          )
                        : RevenuePieDetailsTab(
                            containerRevenueDetailsText: 'جدول الايرادات والحركات اليومية',
                            searchFieldHintText: 'بحث في جدول الايرادات والحركات اليومية', fromDate: _fromDateController.text, toDate: _toDateController.text,
                          ),


                  ]
                  else
                    Showemptywidget(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
