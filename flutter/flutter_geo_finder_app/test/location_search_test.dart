import 'dart:convert';

import 'package:flutter_geo_finder_app/data/model/location.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('naver location search test', () {
    String dummyData = """
      {
          "title": "<b>강남</b>구청",
          "link": "http://www.gangnam.go.kr/",
          "category": "공공,사회기관>구청",
          "description": "",
          "telephone": "",
          "address": "서울특별시 강남구 삼성동 16-1 강남구청",
          "roadAddress": "서울특별시 강남구 학동로 426 강남구청",
          "mapx": "1270475020",
          "mapy": "375173050"
      }
    """;

    Map<String, dynamic> map = jsonDecode(dummyData);

    Location loaction = Location.fromJson(map);

    print(loaction.category);
    expect(loaction.category, "공공,사회기관>구청");
  });
}
