import 'package:flutter/material.dart';
import '../../feature/list/Screens/HomeScreen/Home_screen.dart';
import '../../feature/login/login_ui/Login_screen.dart';
import '../../feature/sign/sign_ui/Sign_screen.dart';

abstract class AppRoutes {
  static const String login = '/LoginScreen';
  static const String signup = '/SignScreen';
  static const String home = '/home';

  static Map<String, WidgetBuilder> getRoutes() {
    return {
      login: (context) => LoginScreen(),
      signup: (context) =>  SignScreen(),
      home: (context) =>  HomeScreen(),

    };
  }
}