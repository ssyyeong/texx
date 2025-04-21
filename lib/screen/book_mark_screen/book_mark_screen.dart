import 'package:flutter/material.dart';
import 'package:texx/custom/board_list.dart';

class BookMarkScreen extends StatefulWidget {
  const BookMarkScreen({super.key});

  @override
  State<BookMarkScreen> createState() => _BookMarkScreenState();
}

class _BookMarkScreenState extends State<BookMarkScreen> {
  String _selectedValue = '최신순';

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
            const SizedBox(height: 20),
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 40), // 드롭다운 버튼과 같은 너비로 설정
                  const Text(
                    '북마크',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                    ),
                  ),
                  DropdownButton<String>(
                    value: _selectedValue,
                    dropdownColor: Colors.black,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 14,
                    ),
                    items: ['최신순', '인기순', '댓글순']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedValue = newValue!;
                      });
                    },
                  ),
                ],
              ),
            ),
            BoardList(itemList: posts),
          ],
        ),
      ),
    );
  }
}
