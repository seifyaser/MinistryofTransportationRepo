import 'package:flutter/material.dart';
import 'package:project/Presentation/HomeScreen/home.dart';
import 'package:project/routes/app_routes.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        fontFamily: 'FFShamelFamily',
      ),
      debugShowCheckedModeBanner: false, 
      initialRoute: "/home",
      routes: AppRoutes.routes,
    );
  }
}

