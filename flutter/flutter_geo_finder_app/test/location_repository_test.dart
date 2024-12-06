import 'package:flutter_geo_finder_app/data/repository/loacation_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('LocationRepository Test', () async {
    LocationRepository locationRepository = LocationRepository();
    final books = await locationRepository.searchLocation('강남');

    expect(books.isEmpty, false);

    for (var book in books) {
      print(book.title);
    }
  });
}
