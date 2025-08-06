import 'package:flutter/material.dart';
import 'package:project/routes/app_routes.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      initialRoute: "/login",
      routes: AppRoutes.routes,
    );
  }
}

