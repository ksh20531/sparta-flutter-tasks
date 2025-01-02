import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_info_app/domain/entity/movie.dart';
import 'package:flutter_movie_info_app/domain/entity/movie_detail.dart';
import 'package:flutter_movie_info_app/domain/repository/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final Dio _client = Dio(
    BaseOptions(
      validateStatus: (status) => true,
      headers: {'Authorization': dotenv.get('TMDB_API_TOKEN')},
    ),
  );

  @override
  Future<MovieDetail?> fetchMovieDetail(int id) async {
    String url = 'https://api.themoviedb.org/3/movie/$id';
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        return MovieDetail.fromJson(data);
      }
    } catch (e) {
      print('MovieRepository::getDetail : $e');
    }
    return null;
  }

  @override
  Future<List<Movie>?> fetchNowPlayingMovies() async {
    String url = 'https://api.themoviedb.org/3/movie/now_playing';
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        List<dynamic>? data = response.data['results'];
        if (data != null) {
          return data.map((d) => Movie.fromJson(d)).toList();
        }
      }
    } catch (e) {
      print('MovieRepository::getNowPlaying : $e');
    }
    return null;
  }

  @override
  Future<List<Movie>?> fetchPopularMovies() async {
    String url = 'https://api.themoviedb.org/3/movie/popular';
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        List<dynamic>? data = response.data['results'];
        if (data != null) {
          return data.map((d) => Movie.fromJson(d)).toList();
        }
      }
    } catch (e) {
      print('MovieRepository::getPopular : $e');
    }
    return null;
  }

  @override
  Future<List<Movie>?> fetchTopRatedMovies() async {
    String url = 'https://api.themoviedb.org/3/movie/top_rated';
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        List<dynamic>? data = response.data['results'];
        if (data != null) {
          return data.map((d) => Movie.fromJson(d)).toList();
        }
      }
    } catch (e) {
      print('MovieRepository::getTopRating : $e');
    }
    return null;
  }

  @override
  Future<List<Movie>?> fetchUpcomingMovies() async {
    String url = 'https://api.themoviedb.org/3/movie/upcoming';
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        List<dynamic>? data = response.data['results'];
        if (data != null) {
          return data.map((d) => Movie.fromJson(d)).toList();
        }
      }
    } catch (e) {
      print('MovieRepository::getUpcoming : $e');
    }
    return null;
  }
}
