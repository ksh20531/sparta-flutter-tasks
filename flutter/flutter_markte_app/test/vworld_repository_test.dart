import 'package:flutter_markte_app/data/repository/vworld_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  final vworldRepo = VworldRepository();

  test('VworldRepository: findByNmae test', () async {
    final result = await vworldRepo.findByName('용산동');
    expect(result.isEmpty, false);

    final result2 = await vworldRepo.findByName('asdf');
    expect(result2.isEmpty, true);
  });
  test('VworldRepository: findByLatLng test', () async {
    final result = await vworldRepo.findByLatLng(37.5512, 126.9882);
    print(result);
    expect(result.isEmpty, false);

    final result2 = await vworldRepo.findByLatLng(32.5512, 126.9882);
    expect(result2.isEmpty, true);
  });
}
