import 'package:flutter_book_search_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Home view model test', () async {
    // 테스트 환경에서 Widget을 생성하지 않고 테스트를 할 수 있게 ProviderContainer 제공
    final providerContainer = ProviderContainer();
    addTearDown(providerContainer.dispose);

    final homeVm = providerContainer.read(homeViewModelProvider.notifier);

    // 처음 HomeViewModel의 상테 => 빈 리스트 연결 테스트
    final fistState = providerContainer.read(homeViewModelProvider);
    expect(fistState.books.isEmpty, true);

    // HomeViewModel에서 searchBooks 메서드 호출 후 상태가 변경이 정상적으로 되는지 테스트

    await homeVm.searchBooks('harry');
    final afterSatae = providerContainer.read(homeViewModelProvider);
    expect(afterSatae.books.isEmpty, false);

    afterSatae.books.forEach((e) {
      print(e.toJson());
    });
  });
}
