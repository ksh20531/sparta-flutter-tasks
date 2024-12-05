import 'package:dio/dio.dart';

class VworldRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true, // 설정 안할시 실패 응답 오면 throw 던져서 에러 발생함
  ));

  // 1. 이름으로 검색하는 기능
  Future<List<String>> findByName(String query) async {
    try {
      final response = await _client
          .get('https://api.vworld.kr/req/search', queryParameters: {
        'request': 'search',
        'key': '4AB634E6-73C7-338D-9EF'
            '0-93A477488445',
        'query': query,
        'type': 'DISTRICT',
        'category': 'L4',
      });

      if (response.statusCode == 200 &&
          response.data['response']['status'] ==
              ''
                  'OK') {
        final itmes = response.data['response']['result']['items'];
        final itemList = List.from(itmes);

        final iterable = itemList.map((item) {
          return '${item['title']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }

  // 2. 위도/경도로 검색하는 기능
  Future<List<String>> findByLatLng(double lat, double lng) async {
    try {
      final response =
          await _client.get('https://api.vworld.kr/req/data', queryParameters: {
        'request': 'GetFeature',
        'key': '4AB634E6-73C7-338D-9EF0-93A477488445',
        'data': 'LT_C_ADEMD_INFO',
        'geomFilter': 'POINT($lng $lat)',
        'geometry': 'false',
        'size': '100',
      });

      if (response.statusCode == 200 &&
          response.data['response']['status'] ==
              ''
                  'OK') {
        final features = response.data['response']['result']
            ['featureCollection']['features'];
        final featureList = List.from(features);

        final iterable = featureList.map((feat) {
          return '${feat['properties']['full_nm']}';
        });
        return iterable.toList();
      }
      return [];
    } catch (e) {
      print(e);
      return [];
    }
  }
}
