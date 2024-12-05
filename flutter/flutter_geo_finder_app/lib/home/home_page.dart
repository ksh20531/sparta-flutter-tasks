import 'package:flutter/material.dart';
import 'package:flutter_geo_finder_app/home/widgets/home_page_item.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: TextField(),
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.separated(
              padding: EdgeInsets.only(top: 20, right: 20, left: 20, bottom: 0),
              itemCount: 3,
              separatorBuilder: (context, index) => SizedBox(height: 20),
              itemBuilder: (content, index) => HomePageItem(),
            ),
          ),
        ],
      ),
    );
  }
}
