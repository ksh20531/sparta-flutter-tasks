// 1. 상태 클래스 만들기 → 바텀네비게이션바의 index만 관리해주면 되서 상태 클래스는 필요 없음
// 2. 뷰모델 만들기
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeViewModel extends AutoDisposeNotifier<int> {
  @override
  int build() {
    return 0; // 최초 index
  }

  /// 바텀네비게이션의 인덱스가 변경되었을 때 호출 할 함수
  void onIndexChanged(int newIndex) {
    state = newIndex;
  }
}

// 3. 뷰모델 관리자(공급자) 만들기
final homeViewModel = NotifierProvider.autoDispose<HomeViewModel, int>(() {
  return HomeViewModel();
});
