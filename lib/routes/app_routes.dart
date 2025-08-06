import 'package:flutter/material.dart';
import 'package:project/Presentation/HomeScreen/home.dart';
import 'package:project/Presentation/dailyRevenuePage/DailyRevenueScreen.dart';
import 'package:project/Presentation/login/login.dart';
import 'package:project/Presentation/mothlyRevenuePage/monthlyRevenueScreen.dart';

class AppRoutes {
  static const Home = '/home';
  static const MonthlyRevenue = '/monthlyrevenue';
  static const DailyRevenue = '/dailyrevenue';
  static const Login = '/login';

   static Map<String, WidgetBuilder> routes = {
    Home: (context) => HomeScreen(),
    MonthlyRevenue: (context) => MonthlyRevenueScreen(),
    DailyRevenue: (context) => DailyRevenueScreen(),
    Login: (context) => LoginPage(),

  };


}