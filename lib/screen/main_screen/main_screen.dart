import 'package:flutter/material.dart';
import 'package:texx/custom/board_list.dart';
import 'package:texx/custom/bottom_navigation.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({super.key});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  final int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    final List<Map<String, dynamic>> posts = [
      {
        'nickname': 'ponz__v2',
        'timeAgo': '9시간',
        'content':
            '11시에 랜딜시즌권 노려봤는데 1구역 통로 잡고 결제하려는 순간 환자 세명 동시에 옴+개종요 한 전화음+원장님 말씀킴 이슈로 자리 날아감... 와 백만원 아깝다!',
        'likeCount': 4,
      }
    ];

    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            BoardList(itemList: posts),
          ],
        ),
      ),
    );
  }
}
