import 'package:dio/dio.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_info_app/data/model/movie.dart';

class MovieRepository {
  final Dio _client = Dio(
    BaseOptions(
      validateStatus: (status) => true,
      headers: {'Authorization': dotenv.get('TMDB_API_TOKEN')},
    ),
  );

  /// 현재 상영중
  Future<List<Movie>?> getNowPlaying() async {
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

  /// 인기순
  Future<List<Movie>?> getPopular() async {
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

  /// 평점 높은순
  Future<List<Movie>?> getTopRating() async {
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

  /// 개봉 예정
  Future<List<Movie>?> getUpcoming() async {
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

  /// 상세 보기
  Future<Movie?> getDetail(int id) async {
    String url = 'https://api.themoviedb.org/3/movie/$id';
    try {
      final response = await _client.get(url);
      if (response.statusCode == 200) {
        Map<String, dynamic> data = response.data;
        return Movie.fromJson(data);
      }
    } catch (e) {
      print('MovieRepository::getDetail : $e');
    }
    return null;
  }
}
