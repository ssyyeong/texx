import 'package:flutter/material.dart';
import 'package:texx/screen/auth_screen/sign_in_screen/sign_in_screen.dart';
import 'package:texx/config/route_generator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const SignInScreen(),
      onGenerateRoute: RouteGenerator.generateRoute,
    );
  }
}
