import 'package:flutter/material.dart';
import 'package:texx/screen/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:texx/screen/auth_screen/sign_up_screen/sign_up_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/sign_in':
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case '/sign_up':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      default:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
    }
  }
}
