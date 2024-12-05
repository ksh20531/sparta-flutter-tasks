import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// 1. 상태 클래스 만들기

// 2. 뷰모델 만들기
class HomeViewModel extends Notifier<List<Post>> {
  @override
  List<Post> build() {
    getAllPosts();
    return [];
  }

  void getAllPosts() async {
    final postRepo = PostRepository();
    // final posts = await postRepo.getAll();
    // state = posts ?? [];
    final stream = postRepo.postListStream();
    final streamSubscription = stream.listen((posts) {
      state = posts;
    });

    /// 이 뷰모델이 없어질 때 넘겨준 함수 호출
    ref.onDispose(() {
      // 구독하고 있는 Stream의 구독을 끊어주어야 메모리에서 안전하게 제거
      // 구독을 끊어주는 방법은 Stream listen할 때 리턴받는 StreamSubscription 클래스의
      // cancel 메서드 호출
      streamSubscription.cancel();
    });
  }
}

// 3. 뷰모델 관리자 만들기
final homeViewModelProvider = NotifierProvider<HomeViewModel, List<Post>>(() {
  return HomeViewModel();
});
