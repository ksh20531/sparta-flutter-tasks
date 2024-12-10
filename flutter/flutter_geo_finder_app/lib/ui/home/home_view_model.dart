import 'package:flutter_geo_finder_app/data/model/location.dart';
import 'package:flutter_geo_finder_app/data/repository/loacation_repository.dart';
import 'package:flutter_geo_finder_app/data/repository/vworld_repository.dart';
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

  final vworldRepository = VworldRepository();

  // 네이버 검색 api
  Future<void> searchLocation(String query) async {
    LocationRepository locationRepository = LocationRepository();
    final location = await locationRepository.searchLocation(query);
    state = HomeState(location);
  }

  // vworld 위,경도 검색 api
  void searchByLatLng(double lat, double lng) async {
    final result = await vworldRepository.findByLatLng(lat, lng);

    if (result != null) {
      searchLocation(result);
    } else {
      state = HomeState([]);
    }
  }
}

// 뷰모델 공급자(관리자)
final homeViewModelProvider =
    NotifierProvider<HomeViewModel, HomeState>(() => HomeViewModel());
