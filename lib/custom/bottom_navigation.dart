import 'package:flutter/material.dart';

class CustomBottomNavigation extends StatelessWidget {
  const CustomBottomNavigation({
    super.key,
    required this.currentIndex,
    required this.onIndexChanged,
  });

  final int currentIndex;
  final Function(int) onIndexChanged;

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(context).copyWith(
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
        hoverColor: Colors.transparent,
      ),
      child: BottomNavigationBar(
        backgroundColor: Colors.black,
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.grey,
        type: BottomNavigationBarType.fixed,
        currentIndex: currentIndex,
        elevation: 0,
        onTap: (index) {
          onIndexChanged(index);
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 0 ? Icons.home : Icons.home_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon:
                Icon(currentIndex == 1 ? Icons.search : Icons.search_outlined),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 2
                ? Icons.add_circle
                : Icons.add_circle_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(
                currentIndex == 3 ? Icons.bookmark : Icons.bookmark_outline),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Icon(currentIndex == 4 ? Icons.person : Icons.person_outline),
            label: '',
          ),
        ],
      ),
    );
  }
}
