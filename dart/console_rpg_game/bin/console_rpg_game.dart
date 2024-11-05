import 'dart:io';
import 'package:console_rpg_game/character.dart';

void main(List<String> arguments) {
  int? characterHp = 0;
  int? characterAtk = 0;
  int? characterDef = 0;

  // 캐릭터 파일 정보 읽어오기
  try {
    final characterFile = File('data/csv/character.txt');
    final contents = characterFile.readAsStringSync();
    final stats = contents.split(',');

    // 캐릭터 파일 포맷이 잘못 되었을 경우
    if (stats.length != 3) throw '파일 포맷 오류!';

    characterHp = int.tryParse(stats[0]);
    characterAtk = int.tryParse(stats[1]);
    characterDef = int.tryParse(stats[2]);

    if (characterHp == null) throw 'Hp 초기화 실패';
    if (characterAtk == null) throw 'Atk 초기화 실패';
    if (characterDef == null) throw 'Def 초기화 실패';
  } catch (e) {
    print('캐릭터 생성에 실패했습니다 : $e');
  }

  // 캐릭터 이름 입력 받기
  try {
    stdout.write("캐릭터의 이름을 입력하세요: ");
    String characterName = stdin.readLineSync()!;

    // 한글 및 영어 대소문자 정규식
    RegExp regex = RegExp(r'^[a-zA-Z가-힣]+$');

    if (characterName.isEmpty) throw '이름은 필수에요!';
    if (!regex.hasMatch(characterName)) throw '한글과 영어만 입력 가능해요';
  } catch (e) {
    print(e);
  }
}
