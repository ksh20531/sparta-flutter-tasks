import 'package:flutter_movie_info_app/data/model/movie.dart';
import 'package:flutter_movie_info_app/data/repository/movie_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewState {
  List<Movie?> nowPlaying;
  List<Movie?> popular;
  List<Movie?> topRating;
  List<Movie?> upcoming;

  HomeViewState({
    required this.nowPlaying,
    required this.popular,
    required this.topRating,
    required this.upcoming,
  });

  HomeViewState copyWith({
    List<Movie?>? nowPlaying,
    List<Movie?>? popular,
    List<Movie?>? topRating,
    List<Movie?>? upcoming,
  }) {
    return HomeViewState(
      nowPlaying: nowPlaying ?? this.nowPlaying,
      popular: popular ?? this.popular,
      topRating: topRating ?? this.topRating,
      upcoming: upcoming ?? this.upcoming,
    );
  }
}

class HomeViewModel extends Notifier<HomeViewState> {
  @override
  HomeViewState build() {
    _initializeState();

    return HomeViewState(
      nowPlaying: [],
      popular: [],
      topRating: [],
      upcoming: [],
    );
  }

  void _initializeState() {
    fetchNowPlaying();
    fetchPopular();
    fetchTopRating();
    fetchUpcoming();
  }

  final movieRepository = MovieRepository();

  /// 현재 상영중
  Future<void> fetchNowPlaying() async {
    final result = await movieRepository.getNowPlaying();
    state = state.copyWith(nowPlaying: result ?? []);
  }

  /// 인기순
  Future<void> fetchPopular() async {
    final result = await movieRepository.getPopular();
    state = state.copyWith(popular: result ?? []);
  }

  /// 평점 높은순
  Future<void> fetchTopRating() async {
    final result = await movieRepository.getTopRating();
    state = state.copyWith(topRating: result ?? []);
  }

  /// 개봉 예정
  Future<void> fetchUpcoming() async {
    final result = await movieRepository.getUpcoming();
    state = state.copyWith(upcoming: result ?? []);
  }
}

final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeViewState>(() => HomeViewModel());
