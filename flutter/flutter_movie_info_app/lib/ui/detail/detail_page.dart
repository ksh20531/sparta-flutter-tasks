import 'package:flutter/material.dart';
import 'package:flutter_movie_info_app/ui/detail/detail_view_model.dart';
import 'package:flutter_movie_info_app/ui/detail/widgets/info_bottom.dart';
import 'package:flutter_movie_info_app/ui/detail/widgets/info_category.dart';
import 'package:flutter_movie_info_app/ui/detail/widgets/info_header.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailPage extends ConsumerStatefulWidget {
  final int movieId;
  final String tag;
  const DetailPage({super.key, required this.movieId, required this.tag});

  @override
  ConsumerState<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends ConsumerState<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final movie = ref.watch(detailViewModel(widget.movieId));
    final heroTag = '${widget.tag}-${widget.movieId}';

    return movie != null
        ? Scaffold(
            body: ListView(
              children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Hero(
                      tag: heroTag,
                      child: Image.network('http://image'
                          '.tmdb.org/t/p/w500/${movie?.posterPath}'),
                    )),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InfoHeader(movie: movie),
                      const Divider(
                          thickness: 1, height: 1, color: Colors.grey),
                      InfoCategory(movie: movie),
                      const Divider(
                          thickness: 1, height: 1, color: Colors.grey),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 12),
                        child: Text('${movie?.overview}'),
                      ),
                      const Divider(
                          thickness: 1, height: 1, color: Colors.grey),
                      InfoBottom(movie: movie),
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container();
  }
}
