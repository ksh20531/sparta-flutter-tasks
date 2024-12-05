import 'dart:convert';
import 'package:flutter_book_search_app/data/model/book.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Book model test', () {
    String dummyData = """
    {
      "title": "The Harry (One Family-Two Centuries)",
      "link": "https://search.shopping.naver.com/book/catalog/34597329624",
      "image": "https://shopping-phinf.pstatic.net/main_3459732/34597329624.20220910201417.jpg",
      "author": "",
      "discount": "23680",
      "publisher": "I2I PUBLISHING",
      "pubdate": "20220630",
      "isbn": "9781914933356",
      "description": "Sequel to Violeta and telling the story of a middle aged man with a young mistress"
    }
    """;
    Map<String, dynamic> map = jsonDecode(dummyData);
    Book book = Book.fromJson(map);
    print(book.toJson());
  });
}
