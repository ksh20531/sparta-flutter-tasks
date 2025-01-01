import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_movie_info_app/data/repository/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env");

  final repo = MovieRepository();

  test('getNowPlaying test', () async {
    final result = await repo.getNowPlaying();
    if (result != null) {
      print(result[0].originalTitle);
    } else {
      print('is null');
    }
  });

  test('getPopular test', () async {
    final result = await repo.getPopular();
    if (result != null) {
      print(result[0].originalTitle);
    } else {
      print('is null');
    }
  });

  test('getTopRating test', () async {
    final result = await repo.getTopRating();
    if (result != null) {
      print(result[0].originalTitle);
    } else {
      print('is null');
    }
  });

  test('getUpcoming test', () async {
    final result = await repo.getUpcoming();
    if (result != null) {
      print(result[0].originalTitle);
    } else {
      print('is null');
    }
  });

  test('getDetail test', () async {
    final result = await repo.getDetail(558449);
    if (result != null) {
      print(result.originalTitle);
    } else {
      print('is null');
    }
  });
}
