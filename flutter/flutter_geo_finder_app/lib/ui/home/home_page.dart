import 'package:flutter/material.dart';
import 'package:flutter_geo_finder_app/core/geolocator_helper.dart';
import 'package:flutter_geo_finder_app/data/model/location.dart';
import 'package:flutter_geo_finder_app/ui/home/home_view_model.dart';
import 'package:flutter_geo_finder_app/ui/home/widgets/home_page_app_bar.dart';
import 'package:flutter_geo_finder_app/ui/home/widgets/home_page_item.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomePage extends ConsumerStatefulWidget {
  const HomePage({super.key});

  @override
  ConsumerState<HomePage> createState() => _HomePageState();
}

class _HomePageState extends ConsumerState<HomePage> {
  @override
  Widget build(BuildContext context) {
    final homeState = ref.watch(homeViewModelProvider);

    /// 키워드 검색
    void onSearch(String text) {
      ref.read(homeViewModelProvider.notifier).searchLocation(text);
    }

    /// 기기 좌표 획득
    void getGeolocation() async {
      final position = await GeolocatorHelper.getPosition();

      if (position != null) {
        ref.read(homeViewModelProvider.notifier).searchByLatLng(
              position.latitude,
              position.longitude,
            );
      }
    }

    if (homeState.locations.isNotEmpty) {
      return Scaffold(
        appBar:
            HomePageAppBar(onSearch: onSearch, getGeolocation: getGeolocation),
        body: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  padding: const EdgeInsets.only(
                      top: 20, right: 20, left: 20, bottom: 0),
                  itemCount: homeState.locations.length,
                  separatorBuilder: (context, index) =>
                      const SizedBox(height: 20),
                  itemBuilder: (content, index) {
                    Location location = homeState.locations[index];
                    return HomePageItem(
                      title: location.title,
                      link: location.link,
                      category: location.category,
                      roadAddress: location.roadAddress,
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar:
            HomePageAppBar(onSearch: onSearch, getGeolocation: getGeolocation),
        body: Center(
          child: Text('검색된 결과가 없슶니다.'),
        ),
      );
    }
  }
}
