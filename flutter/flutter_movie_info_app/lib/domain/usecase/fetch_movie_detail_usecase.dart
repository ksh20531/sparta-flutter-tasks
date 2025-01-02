import 'package:flutter_movie_info_app/domain/entity/movie.dart';
import 'package:flutter_movie_info_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_info_app/domain/repository/movie_repository.dart';

class FetchMovieDetailUsecase {
  final MovieRepository _movieRepository;

  FetchMovieDetailUsecase(this._movieRepository);

  Future<MovieDetail?> execute() async {
    return await _movieRepository.fetchMovieDetail(558449);
  }
}
