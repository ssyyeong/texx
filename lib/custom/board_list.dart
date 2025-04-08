import 'package:flutter/material.dart';

class BoardList extends StatefulWidget {
  const BoardList({
    super.key,
    required this.itemList,
  });

  final List<Map<String, dynamic>> itemList;

  @override
  State<BoardList> createState() => _BoardListState();
}

class _BoardListState extends State<BoardList> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: widget.itemList.length,
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) {
        final post = widget.itemList[index];
        return Container(
          margin: const EdgeInsets.only(bottom: 15),
          decoration: BoxDecoration(
            color: Colors.black,
            border: Border(
              bottom: BorderSide(color: Colors.grey[800]!, width: 0.5),
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 상단 프로필 영역
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    // 닉네임
                    Text(
                      post['nickname'] ?? '',
                      style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                        color: Colors.white,
                      ),
                    ),
                    const SizedBox(width: 4),
                    // 시간
                    Text(
                      '· ${post['timeAgo'] ?? ''}',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                    const Spacer(),
                    Icon(Icons.more_horiz, color: Colors.grey[500]),
                  ],
                ),
              ),
              // 게시물 내용
              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                child: Text(
                  post['content'] ?? '',
                  style: const TextStyle(
                    fontSize: 14,
                    color: Colors.white,
                    height: 1.4,
                  ),
                ),
              ),
              // 하단 아이콘들
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Icon(Icons.favorite_border,
                        color: Colors.grey[500], size: 22),
                    const SizedBox(width: 16),
                    Icon(Icons.chat_bubble_outline,
                        color: Colors.grey[500], size: 22),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
