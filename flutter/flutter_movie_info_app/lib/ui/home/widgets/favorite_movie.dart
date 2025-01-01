import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_info_app/ui/detail/detail_page.dart';
import 'package:flutter_movie_info_app/ui/home/home_view_model.dart';

class FavoriteMovie extends StatefulWidget {
  final HomeViewState movieList;
  const FavoriteMovie({super.key, required this.movieList});

  @override
  State<FavoriteMovie> createState() => _FavoriteMovieState();
}

class _FavoriteMovieState extends State<FavoriteMovie> {
  @override
  Widget build(BuildContext context) {
    final favorite = widget.movieList.popular[0];
    const tagName = 'favorite';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          '가장 인기있는',
          style: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 8),
        GestureDetector(
          onTap: () {
            Navigator.push(
                context,
                CupertinoPageRoute(
                    builder: (context) => DetailPage(
                          movieId: favorite.id!,
                          tag: tagName,
                        )));
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Hero(
              tag: '$tagName-${favorite!.id}',
              child: Image.network(
                'http://image'
                '.tmdb.org/t/p/w500/${favorite!.posterPath}',
                fit: BoxFit.fill,
              ),
            ),
          ),
        )
      ],
    );
  }
}
