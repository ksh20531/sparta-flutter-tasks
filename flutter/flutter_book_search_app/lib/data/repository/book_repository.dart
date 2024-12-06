import 'dart:convert';

import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:http/http.dart';

class BookRepository {
  Future<List<Book>> searchBooks(String query) async {
    final String url = 'https://openapi.naver.com/v1/search/book'
        '.json?query=';
    final client = Client();
    final response = await client.get(
      Uri.parse('$url$query'),
      headers: {
        'X-Naver-Client-Id': 'iQhVhW_A3TWNdZXYq7hT',
        'X-Naver-Client-Secret': 'WNNtbO0Sr2',
      },
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> map = jsonDecode(response.body);
      final items = List.from(map['items']);
      final iterable = items.map((e) {
        return Book.fromJson(e);
      });
      final list = iterable.toList();

      return list;
    }
    return [];
  }
}
