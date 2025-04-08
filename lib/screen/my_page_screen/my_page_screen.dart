import 'package:flutter/material.dart';
import 'package:texx/custom/board_list.dart';
import 'package:texx/custom/bottom_navigation.dart';
import '../../config/color_constants.dart';
import '../../widgets/full_width_btn.dart';

class MyPageScreen extends StatefulWidget {
  const MyPageScreen({super.key});

  @override
  State<MyPageScreen> createState() => _MyPageState();
}

class _MyPageState extends State<MyPageScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  final int _currentIndex = 1;
  final List<Map<String, dynamic>> posts = [
    {
      'nickname': 'ponz__v2',
      'timeAgo': '9시간',
      'content':
          '11시에 랜딜시즌권 노려봤는데 1구역 통로 잡고 결제하려는 순간 환자 세명 동시에 옴+개종요 한 전화음+원장님 말씀킴 이슈로 자리 날아감... 와 백만원 아깝다!',
      'likeCount': 4,
    },
    {
      'nickname': 'ponz__v2',
      'timeAgo': '9시간',
      'content':
          '11시에 랜딜시즌권 노려봤는데 1구역 통로 잡고 결제하려는 순간 환자 세명 동시에 옴+개종요 한 전화음+원장님 말씀킴 이슈로 자리 날아감... 와 백만원 아깝다!',
      'likeCount': 4,
    },
    {
      'nickname': 'ponz__v2',
      'timeAgo': '9시간',
      'content':
          '11시에 랜딜시즌권 노려봤는데 1구역 통로 잡고 결제하려는 순간 환자 세명 동시에 옴+개종요 한 전화음+원장님 말씀킴 이슈로 자리 날아감... 와 백만원 아깝다!',
      'likeCount': 4,
    },
    {
      'nickname': 'ponz__v2',
      'timeAgo': '9시간',
      'content':
          '11시에 랜딜시즌권 노려봤는데 1구역 통로 잡고 결제하려는 순간 환자 세명 동시에 옴+개종요 한 전화음+원장님 말씀킴 이슈로 자리 날아감... 와 백만원 아깝다!',
      'likeCount': 4,
    },
    {
      'nickname': 'ponz__v2',
      'timeAgo': '9시간',
      'content':
          '11시에 랜딜시즌권 노려봤는데 1구역 통로 잡고 결제하려는 순간 환자 세명 동시에 옴+개종요 한 전화음+원장님 말씀킴 이슈로 자리 날아감... 와 백만원 아깝다!',
      'likeCount': 4,
    }
  ];

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 40),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    '소개글',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.white,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const Text(
                        '닉네임',
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(width: 8),
                      Text(
                        '팔로워 13명',
                        style: TextStyle(
                          fontSize: 14,
                          color: ColorConstants.lightGray,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 24),
                  FullWidthBtn(
                    type: 'Elevated',
                    title: const Text(
                      '프로필 수정',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    btnPadding: const EdgeInsets.symmetric(vertical: 10),
                    borderRadius: 12,
                    border: 1,
                    margin: EdgeInsets.zero,
                    color: Colors.black,
                    borderColor: ColorConstants.lightGray,
                    onPressed: () {},
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: TabBar(
                controller: _tabController,
                indicatorColor: Colors.white,
                indicatorWeight: 2,
                indicatorSize: TabBarIndicatorSize.tab,
                labelColor: Colors.white,
                unselectedLabelColor: ColorConstants.lightGray,
                tabs: const [
                  Tab(text: '작성한 글'),
                  Tab(text: '저장한 글'),
                ],
              ),
            ),
            Expanded(
              child: TabBarView(
                controller: _tabController,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: posts.map((post) {
                        return Container(
                          margin: const EdgeInsets.symmetric(horizontal: 20),
                          child: BoardList(itemList: [post]),
                        );
                      }).toList(),
                    ),
                  ),
                  const Center(
                    child: Text(
                      '저장한 글이 없습니다',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
