import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/CustomBarChart.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/CustomHeader.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/RevenueDateSearch.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/RevenueTable.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/RevenueTypeSwitch.dart';
import 'package:project/Presentation/mothlyRevenuePage/Widgets/TotalRevenueAuthoritiesCard.dart';

class MonthlyRevenueScreen extends StatefulWidget {
  @override
  _MonthlyRevenueScreenState createState() => _MonthlyRevenueScreenState();
}

class _MonthlyRevenueScreenState extends State<MonthlyRevenueScreen> {
  final TextEditingController _fromDateController = TextEditingController();
  final TextEditingController _toDateController = TextEditingController();

  bool _showRevenuePercentage = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          CustomHeader(title: 'الايرادات و حركة النشاط الشهرية'),
          Expanded(
            child: ListView(
              children: [
                // Search Section
                RevenueDateSearch(
                  fromDateController: _fromDateController,
                  toDateController: _toDateController,
                  onSearchPressed: () {
                    print(
                      'البحث من: ${_fromDateController.text} إلى ${_toDateController.text}',
                    );
                  },
                ),
                const SizedBox(height: 20),

                RevenueTypeSwitch(
                  showRevenuePercentage: _showRevenuePercentage,
                  onChanged: (value) {
                    setState(() {
                      _showRevenuePercentage = value;
                    });
                  },
                ),

                const SizedBox(height: 20),

                if (_showRevenuePercentage)
                  CustomBarChart()
                else
                  RevenueTable(),

                const SizedBox(height: 20),

                // Total Revenue in Authorities Section
                const TotalRevenueInAuthoritiesCard(),

                const SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
