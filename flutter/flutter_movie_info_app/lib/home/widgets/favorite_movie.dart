import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/detail/detail_page.dart';

class FavoriteMovie extends StatelessWidget {
  const FavoriteMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '가장 인기있는',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(context,
                CupertinoPageRoute(builder: (context) => DetailPage()));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Hero(
              tag: 'test',
              child: Image.asset(
                'assets/images/ToyStory.jpg',
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ],
    );
  }
}
