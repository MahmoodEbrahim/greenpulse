import 'package:flutter/material.dart';
import 'package:greenpulse/config/routes_manager/app.route.dart';
import 'package:greenpulse/config/theme/theme.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppRoutes.login,
      theme: AppTheme.lightTheme,
    );
  }
}
