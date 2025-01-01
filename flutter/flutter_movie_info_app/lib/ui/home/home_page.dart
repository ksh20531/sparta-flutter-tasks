import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/ui/home/home_view_model.dart';
import 'package:flutter_movie_info_app/ui/home/widgets/favorite_movie.dart';
import 'package:flutter_movie_info_app/ui/home/widgets/now_on_air.dart';
import 'package:flutter_movie_info_app/ui/home/widgets/popular.dart';
import 'package:flutter_movie_info_app/ui/home/widgets/rating.dart';
import 'package:flutter_movie_info_app/ui/home/widgets/upcoming.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Consumer(builder: (context, ref, child) {
          final vm = ref.watch(homeViewModelProvider);

          return vm.upcoming.isNotEmpty
              ? ListView(
                  padding: const EdgeInsets.all(20),
                  children: [
                    FavoriteMovie(movieList: vm),
                    const SizedBox(height: 16),
                    NowOnAir(movieList: vm),
                    const SizedBox(height: 16),
                    Popular(movieList: vm),
                    const SizedBox(height: 16),
                    Rating(movieList: vm),
                    const SizedBox(height: 16),
                    Upcoming(movieList: vm),
                  ],
                )
              : const Center(child: CircularProgressIndicator());
        }),
      ),
    );
  }
}
