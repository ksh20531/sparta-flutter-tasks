import 'package:flutter_movie_info_app/data/model/movie.dart';
import 'package:flutter_movie_info_app/data/repository/movie_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailViewModel extends AutoDisposeFamilyNotifier<Movie?, int> {
  @override
  Movie? build(int arg) {
    getDetail();
  }

  final movieRepository = MovieRepository();

  Future<void> getDetail() async {
    Movie? result = await movieRepository.getDetail(arg);
    state = result;
  }
}

final detailViewModel =
    NotifierProvider.autoDispose.family<DetailViewModel, Movie?, int>(() {
  return DetailViewModel();
});
