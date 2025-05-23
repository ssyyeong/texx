import 'package:flutter/material.dart';
import 'package:texx/custom/bottom_navigation.dart';
import 'package:texx/screen/book_mark_screen/book_mark_screen.dart';
import 'package:texx/screen/main_screen/main_screen.dart';
import 'package:texx/screen/my_page_screen/my_page_screen.dart';
import 'package:texx/screen/search_screen/search_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _currentIndex = 0;
  final List<Widget> _widgetOptions = [
    const MainScreen(),
    const SearchScreen(),
    const MyPageScreen(),
    const BookMarkScreen(),
    const MyPageScreen(),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Center(
        child: _widgetOptions.elementAt(_currentIndex),
      ),
      bottomNavigationBar: CustomBottomNavigation(
        currentIndex: _currentIndex,
        onIndexChanged: (index) {
          _onItemTapped(index);
        },
      ),
    );
  }
}
