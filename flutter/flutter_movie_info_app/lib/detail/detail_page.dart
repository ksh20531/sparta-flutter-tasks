import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/detail/widgets/info_bottom.dart';
import 'package:flutter_movie_info_app/detail/widgets/info_category.dart';
import 'package:flutter_movie_info_app/detail/widgets/info_header.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          ClipRRect(
              borderRadius: BorderRadius.circular(12),
              child: Image.asset('assets/images/ToyStory.jpg')),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                InfoHeader(),
                Divider(thickness: 1, height: 1, color: Colors.grey),
                InfoCategory(),
                Divider(thickness: 1, height: 1, color: Colors.grey),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 12),
                  child: Text('asdfasdfasdfasdf' * 30),
                ),
                Divider(thickness: 1, height: 1, color: Colors.grey),
                InfoBottom(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
