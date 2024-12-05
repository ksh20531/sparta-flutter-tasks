import 'package:flutter/material.dart';
import 'package:flutter_markte_app/ui/pages/home/_tab/home_tab/widgets/home_tab_app_bar.dart';
import 'package:flutter_markte_app/ui/pages/home/_tab/home_tab/widgets/home_tab_list_view.dart';

class HomeTab extends StatelessWidget {
  const HomeTab({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      child: Column(
        children: [
          HomeTabAppBar(),
          HomeTabListView(),
        ],
      ),
    );
  }
}
