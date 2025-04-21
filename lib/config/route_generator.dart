import 'package:flutter/material.dart';
import 'package:texx/screen/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:texx/screen/auth_screen/sign_up_screen/sign_up_screen.dart';
import 'package:texx/screen/book_mark_screen/book_mark_screen.dart';
import 'package:texx/screen/main_screen/main_screen.dart';
import 'package:texx/screen/my_page_screen/my_page_screen.dart';
import 'package:texx/screen/search_screen/search_screen.dart';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case '/sign_in':
        return MaterialPageRoute(builder: (context) => const SignInScreen());
      case '/sign_up':
        return MaterialPageRoute(builder: (context) => const SignUpScreen());
      case '/main':
        return MaterialPageRoute(builder: (context) => const MainScreen());
      case '/search':
        return MaterialPageRoute(builder: (context) => const SearchScreen());
      case '/book_mark':
        return MaterialPageRoute(builder: (context) => const BookMarkScreen());
      case '/my_page':
        return MaterialPageRoute(builder: (context) => const MyPageScreen());
      default:
        return MaterialPageRoute(builder: (context) => const SignInScreen());
    }
  }
}
