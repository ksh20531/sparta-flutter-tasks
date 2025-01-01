import 'package:flutter/cupertino.dart';
import 'package:flutter_movie_info_app/ui/detail/detail_page.dart';
import 'package:flutter_movie_info_app/ui/home/home_view_model.dart';

class Popular extends StatelessWidget {
  final HomeViewState movieList;
  const Popular({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    final movie = movieList.popular;
    const tagName = 'popular';

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          '인기순',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        const SizedBox(height: 16),
        SizedBox(
          height: 180,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: (movie.length < 20) ? movie.length : 20,
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context,
                      CupertinoPageRoute(
                          builder: (context) => DetailPage(
                                movieId: movie[index]!.id!,
                                tag: tagName,
                              )));
                },
                child: Stack(
                  children: [
                    Container(
                      width: 160,
                      alignment: Alignment.centerRight,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(12),
                      ),
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
                    ),
                    Positioned(
                      bottom: -20,
                      left: 14,
                      child: Text(
                        '${index + 1}',
                        style: const TextStyle(
                          fontSize: 90,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    )
                  ],
                ),
              );
            },
          ),
        ),
      ],
    );
  }
}
