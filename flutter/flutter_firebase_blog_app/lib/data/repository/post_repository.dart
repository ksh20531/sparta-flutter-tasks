import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_blog_app/data/model/post.dart';

class PostRepository {
  Future<List<Post>?> getAll() async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3. 값 불러오기
      final result = await collectionRef.get();

      final docs = result.docs;
      print(docs);
      return docs.map((doc) {
        final map = doc.data();
        final newMap = {
          'id': doc.id,
          ...map,
        };
        return Post.fromJson(newMap);
      }).toList();
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 1. Create: 데이터 쓰기
  Future<bool> insert({
    required String title,
    required String content,
    required String writer,
    required String imageUrl,
  }) async {
    try {
      // 1. Firestore 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. collection 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3. 문서 참조 만들기
      final docRef = collectionRef.doc();
      // 4. 값 쓰기
      await docRef.set({
        'title': title,
        'content': content,
        'writer': writer,
        'imageUrl': imageUrl,
        'createdAt': DateTime.now().toIso8601String(),
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 2. Read: 특정 ID로 하나의 도큐먼트 가져오기
  Future<Post?> getOne(String id) async {
    try {
      // 1. 파이어베이스 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3. 문서 참조 만들기
      final docRef = collectionRef.doc(id);
      // 4. 데이터 가지고 오기
      final doc = await docRef.get();
      return Post.fromJson({
        'id': doc.id,
        ...doc.data()!,
      });
    } catch (e) {
      print(e);
      return null;
    }
  }

  // 3. Update: 도큐먼트 수정
  Future<bool> update({
    required String id,
    required String writer,
    required String title,
    required String content,
    required String imageUrl,
  }) async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collectionRef = firestore.collection('posts');
      // 3. 문서 참조 만들기
      final docRef = collectionRef.doc(id);
      // 4. 값을 업데이트 해주기(set메서드)
      await docRef.update({
        'writer': writer,
        'title': title,
        'content': content,
        'imageUrl': imageUrl,
      });
      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  // 4. Delete: 도큐먼트 삭제
  Future<bool> delete(String id) async {
    try {
      // 1. 파이어스토어 인스턴스 가지고 오기
      final firestore = FirebaseFirestore.instance;
      // 2. 컬렉션 참조 만들기
      final collecrionRef = firestore.collection('posts');
      // 3. 문서 참조 만들기
      final docRef = collecrionRef.doc(id);
      // 4. 삭제
      await docRef.delete();

      return true;
    } catch (e) {
      print(e);
      return false;
    }
  }

  Stream<List<Post>> postListStream() {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('posts');
    final stream = collectionRef.snapshots();
    final newStream = stream.map((event) {
      return event.docs.map((e) {
        return Post.fromJson({
          'id': e.id,
          ...e.data(),
        });
      }).toList();
    });

    return newStream;
  }

  Stream<Post?> postStream(String id) {
    final firestore = FirebaseFirestore.instance;
    final collectionRef = firestore.collection('posts');
    final docRef = collectionRef.doc();
    final stream = docRef.snapshots();
    final newStream = stream.map((e) {
      if (e.data() == null) {
        return null;
      } else {
        return Post.fromJson({
          'id': e.id,
          ...e.data()!,
        });
      }
    });
    return newStream;
  }
}
