// 1. 상태 클래스 만들기
import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_firebase_blog_app/data/model/post.dart';
import 'package:flutter_firebase_blog_app/data/repository/post_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';

class WriteState {
  bool isWriting;
  String? imageUrl;
  WriteState(this.isWriting, this.imageUrl);
}

// 2. 뷰모델 만들기
class WriteViewModel extends AutoDisposeFamilyNotifier<WriteState, Post?> {
  @override
  WriteState build(Post? arg) {
    return WriteState(false, arg?.imageUrl);
  }

  Future<bool> insert({
    required String writer,
    required String title,
    required String content,
  }) async {
    if (state.imageUrl == null) {
      return false;
    }
    final postRepository = PostRepository();

    state = WriteState(true, state.imageUrl);

    if (arg == null) {
      // Post 객체가 null이면 새로 작성
      final result = await postRepository.insert(
        title: title,
        content: content,
        writer: writer,
        imageUrl: state.imageUrl!,
      );
      state = WriteState(false, state.imageUrl);
      await Future.delayed(Duration(microseconds: 500));
      return result;
    } else {
      // null이 아니면 수정
      final result = await postRepository.update(
        id: arg!.id,
        writer: writer,
        title: title,
        content: content,
        imageUrl: state.imageUrl!,
      );
      await Future.delayed(Duration(microseconds: 500));
      state = WriteState(false, state.imageUrl);
      return result;
    }
  }

  void uploadImage(XFile xFile) async {
    try {
      // 1. firebase storage 객체 가져오기
      final storage = FirebaseStorage.instance;
      // 2. storage 참조 만들기 -> firebase console에서 만든 storage
      Reference ref = storage.ref();
      // 3. 파일 참조 만들기 -> 중복이 되면 안됨
      Reference fileRef =
          ref.child('${DateTime.now().microsecondsSinceEpoch}_${xFile.name}');
      // 4. 쓰기
      await fileRef.putFile(File(xFile.path));
      // 5. 파일에 접근할 수 있는 url 받기
      String imageUrl = await fileRef.getDownloadURL();
      state = WriteState(state.isWriting, imageUrl);
    } catch (e) {
      print(e);
    }
  }
}

// 3. 뷰모델 관리자 만들기
final writeViewModelProvider =
    NotifierProvider.autoDispose.family<WriteViewModel, WriteState, Post?>(() {
  return WriteViewModel();
});
