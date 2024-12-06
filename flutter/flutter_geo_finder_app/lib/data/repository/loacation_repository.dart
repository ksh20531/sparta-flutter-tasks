import 'package:dio/dio.dart';
import 'package:flutter_geo_finder_app/data/model/location.dart';

class LocationRepository {
  final Dio _client = Dio(BaseOptions(
    headers: {
      'X-Naver-Client-Id': 'iQhVhW_A3TWNdZXYq7hT',
      'X-Naver-Client-Secret': 'WNNtbO0Sr2'
    },
    validateStatus: (status) => true, // 설정 안할시 실패 응답 오면 throw 던져서 에러 발생함
  ));

  Future<List<Location>> searchLocation(String query) async {
    try {
      final response = await _client.get(
          'https://openapi.naver.com/v1/search/local.json',
          queryParameters: {'query': query, 'display': 5});

      if (response.statusCode == 200) {
        final itemList = response.data['items'] as List;

        return itemList.map((item) => Location.fromJson(item)).toList();
      }
      return [];
    } catch (e) {
      print('LocationRepository: $e');
      return [];
    }
  }
}
