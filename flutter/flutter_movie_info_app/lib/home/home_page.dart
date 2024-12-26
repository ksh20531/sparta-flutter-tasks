import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/home/widgets/favorite_movie.dart';
import 'package:flutter_movie_info_app/home/widgets/now_on_air.dart';
import 'package:flutter_movie_info_app/home/widgets/popular.dart';
import 'package:flutter_movie_info_app/home/widgets/rating.dart';
import 'package:flutter_movie_info_app/home/widgets/upcoming.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: ListView(
          padding: const EdgeInsets.all(20),
          children: [
            FavoriteMovie(),
            SizedBox(height: 16),
            NowOnAir(),
            SizedBox(height: 16),
            Popular(),
            SizedBox(height: 16),
            Rating(),
            SizedBox(height: 16),
            Upcoming()
          ],
        ),
      ),
    );
  }
}
