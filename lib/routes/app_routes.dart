import 'package:flutter/material.dart';
import 'package:project/Presentation/HomeScreen/home.dart';
import 'package:project/Presentation/ReportsPage/DailyReportsPage/DailyReportsPage.dart';
import 'package:project/Presentation/ReportsPage/MonthlyReportsPage/monthlyReportsPage.dart';
import 'package:project/Presentation/ReportsPage/halfYearReportsPage/halfyearpage.dart';
import 'package:project/Presentation/ReportsPage/qaurtYearpage/quartReportsPage.dart';
import 'package:project/Presentation/ReportsPage/yearReportsPage/yearReportsPage.dart';
import 'package:project/Presentation/dailyRevenuePage/DailyRevenueScreen.dart';
import 'package:project/Presentation/login/login.dart';
import 'package:project/Presentation/mothlyRevenuePage/monthlyRevenueScreen.dart';

class AppRoutes {
  static const Home = '/home';
  static const MonthlyRevenue = '/monthlyrevenue';
  static const DailyRevenue = '/dailyrevenue';
  static const Login = '/login';
  static const DailyReport = "/dailyreport";
  static const YearlyReport = "/yearlyreport";
  static const HalfYearlyReport = "/halfyearlyreport";
  static const QuartelyReport = "/quartelyreport";
  static const MonthlyReport = "/monthlyreport";

   static Map<String, WidgetBuilder> routes = {
    Home: (context) => HomeScreen(),
    MonthlyRevenue: (context) => MonthlyRevenueScreen(),
    DailyRevenue: (context) => DailyRevenueScreen(),
    Login: (context) => LoginPage(),
    DailyReport: (context) => DailyReportsScreen(),
    YearlyReport: (context) => YearReportsScreen(),
    HalfYearlyReport: (context) => HalfYearReportsScreen(),
    QuartelyReport: (context) => QuartYearReportsScreen(),
    MonthlyReport: (context) => MonthlyReportsScreen(),

  };


}