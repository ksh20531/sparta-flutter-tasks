import 'package:flutter/material.dart';
import 'package:flutter_markte_app/ui/pages/chat_detail/widgets/chat_detail_receive_item.dart';
import 'package:flutter_markte_app/ui/pages/chat_detail/widgets/chat_detail_send_item.dart';

class ChatDetailListView extends StatelessWidget {
  final children = [
    ChatDetailReceiveItem(
      imgUrl: 'https://picsum.photos/200/300',
      showProfile: true,
      content: '안녕하세요',
      dateTime: DateTime.now(),
    ),
    ChatDetailReceiveItem(
      imgUrl: 'https://picsum.photos/200/300',
      showProfile: true,
      content: '네고 가능한가요?',
      dateTime: DateTime.now(),
    ),
    ChatDetailSendItem(content: '네 안녕하세요', dateTime: DateTime.now()),
    ChatDetailSendItem(content: '네고 안돼요!', dateTime: DateTime.now()),
  ];
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
        itemCount: children.length,
        itemBuilder: (context, index) => children[index],
        separatorBuilder: (context, index) => SizedBox(height: 4),
      ),
    );
  }
}
