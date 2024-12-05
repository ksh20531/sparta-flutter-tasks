import 'package:flutter/material.dart';
import 'package:flutter_markte_app/ui/pages/home/_tab/chat_tab/widgets/chat_tab_app_bar.dart';
import 'package:flutter_markte_app/ui/pages/home/_tab/chat_tab/widgets/chat_tab_list_view.dart';

class ChatTab extends StatelessWidget {
  const ChatTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
        child: SizedBox.expand(
      child: Column(
        children: [
          ChatTabAppBar(),
          ChatTabListView(),
        ],
      ),
    ));
  }
}
