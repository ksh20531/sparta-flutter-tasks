import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/ui/detail/detail_page.dart';
import 'package:flutter_movie_info_app/ui/home/home_view_model.dart';

class NowOnAir extends StatelessWidget {
  final HomeViewState movieList;
  const NowOnAir({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    final movie = movieList.nowPlaying;
    const String tagName = 'onAir';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '현재 상영중',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView.separated(
            scrollDirection: Axis.horizontal,
            itemCount: (movie.length < 20) ? movie.length : 20,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => DetailPage(
                                movieId: movie[index]!.id!,
                                tag: tagName,
                              )));
                },
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child: Hero(
                    tag: '$tagName-${movie[index]!.id}',
                    child: Image.network(
                      'http://image'
                      '.tmdb.org/t/p/w500/${movie[index]!.posterPath}',
                      fit: BoxFit.fill,
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(width: 16);
            },
          ),
        ),
      ],
    );
  }
}
