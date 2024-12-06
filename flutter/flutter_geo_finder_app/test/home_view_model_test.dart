import 'package:flutter_geo_finder_app/ui/home/home_view_model.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('HomeViewModel Test', () async {
    final providerContainer = ProviderContainer();
    addTearDown(providerContainer.dispose);

    final homevm = providerContainer.read(homeViewModelProvider.notifier);

    final firstState = providerContainer.read(homeViewModelProvider);
    expect(firstState.locations.isEmpty, true);

    await homevm.searchLocation('강남');
    final afterState = providerContainer.read(homeViewModelProvider);
    expect(afterState.locations.isNotEmpty, true);

    for (var location in afterState.locations) {
      print(location.title);
    }
  });
}
