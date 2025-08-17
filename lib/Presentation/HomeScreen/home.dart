// lib/Presentation/HomeScreen/HomeScreen.dart
import 'package:flutter/material.dart';
import 'package:project/Presentation/HomeScreen/Widgets/card.dart';
import 'package:project/Presentation/HomeScreen/Widgets/HeaderWidget.dart';
import 'package:project/Presentation/HomeScreen/Widgets/buildSubCard.dart';

class HomeScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          HeaderWidget(),
          SizedBox(height: 60),
          Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 20),
              children: [
                HomeCard(
                  imagePath: "assets/Finance.svg",
                  text: 'الايرادات و حركة النشاط الجاري',
                  subCards: [
                    Buildsubcard(text:"الايراد و حركة النشاط الشهرية", onTap: () {
                      Navigator.pushNamed(context, '/monthlyrevenue');
                    }),
                    Buildsubcard(text:" الايراد و حركة النشاط اليومية", onTap: () {
                      Navigator.pushNamed(context, '/dailyrevenue');
                    }),
                  ],
                ),

                SizedBox(height: 15),

                HomeCard(
                  imagePath: "assets/reports.svg",
                  text: 'النشرات و التقارير',
                  subCards: [
                    Buildsubcard(
                      text: ' الشهرية',
                      onTap: () {
                        Navigator.pushNamed(context, '/monthlyreport');
                      },
                    ),
                    Buildsubcard(
                      text: 'اليومية',
                      onTap: () {
                        Navigator.pushNamed(context, '/dailyreport');
                      },
                    ),
                      Buildsubcard(
                      text: 'ربع سنوية',
                      onTap: () {
                        Navigator.pushNamed(context, '/quartelyreport');
                      },
                    ),
                  SizedBox(height: 1),
                      Buildsubcard(
                      text: 'نصف سنوية',
                      onTap: () {
                        Navigator.pushNamed(context, '/halfyearlyreport');
                      },
                    ),
                     Buildsubcard(
                      text: 'سنوية',
                      onTap: () {
                        Navigator.pushNamed(context, '/yearlyreport');
                      },
                    ),
                  ],
                ),

                SizedBox(height: 15),

                HomeCard(
                  imagePath: 'assets/Frame.svg',
                  text: 'مركز ادارة الازمات',
                  subCards: [
                    Buildsubcard(text: 'تقارير الطوارئ', onTap: () {}),
                    Buildsubcard(text: 'خطة إدارة الأزمات', onTap: () {}),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
