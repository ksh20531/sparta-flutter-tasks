import 'package:flutter_geo_finder_app/data/model/location.dart';
import 'package:flutter_geo_finder_app/data/repository/loacation_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// 상태 클래스
class HomeState {
  List<Location> locations;

  HomeState(this.locations);
}

// 뷰모델
class HomeViewModel extends Notifier<HomeState> {
  @override
  build() {
    return HomeState([]);
  }

  Future<void> searchLocation(String query) async {
    LocationRepository locationRepository = LocationRepository();
    final location = await locationRepository.searchLocation(query);
    state = HomeState(location);
  }
}

// 뷰모델 공급자(관리자)
final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() => HomeViewModel());
