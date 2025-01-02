import 'package:flutter_movie_info_app/data/dto/movie_detail_dto.dart';
import 'package:flutter_movie_info_app/data/dto/movie_response_dto.dart';

abstract interface class MovieSource {
  Future<MovieResponseDto?> fetchNowPlayingMovies();

  Future<MovieResponseDto?> fetchPopularMovies();

  Future<MovieResponseDto?> fetchTopRatedMovies();

  Future<MovieResponseDto?> fetchUpcomingMovies();

  Future<MovieDetailDto?> fetchMovieDetail(int id);
}
