import 'package:dio/dio.dart';

class VworldRepository {
  final Dio _client = Dio(BaseOptions(
    validateStatus: (status) => true, // 설정 안할시 실패 응답 오면 throw 던져서 에러 발생함
  ));

  Future<String?> findByLatLng(double lat, double lng) async {
    try {
      final response =
          await _client.get('https://api.vworld.kr/req/data', queryParameters: {
        'request': 'GetFeature',
        'key': '4AB634E6-73C7-338D-9EF0-93A477488445',
        'data': 'LT_C_ADEMD_INFO',
        'geomFilter': 'POINT($lng $lat)',
        'geometry': 'false',
        'size': '1',
      });

      if (response.statusCode == 200 &&
          response.data['response']['status'] ==
              ''
                  'OK') {
        final features = response.data['response']['result']
            ['featureCollection']['features'];
        final featureList = List.from(features);

        String fullName = featureList[0]['properties']['full_nm'];
        return fullName.split(' ').last;
      }
      return null;
    } catch (e) {
      print(e);
      return null;
    }
  }
}
