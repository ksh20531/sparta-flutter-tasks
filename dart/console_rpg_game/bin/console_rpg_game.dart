import 'dart:io';

import 'package:console_rpg_game/character.dart';

void main(List<String> arguments) {
  try {
    final characterFile = File('data/csv/character.txt');
    final contents = characterFile.readAsStringSync();
    final stats = contents.split(',');

    // 캐릭터 파일 포맷이 잘못 되었을 경우
    if (stats.length != 3) throw '파일 포맷 오류!';

    int? characterHp = int.tryParse(stats[0]);
    int? characterAtk = int.tryParse(stats[1]);
    int? characterDef = int.tryParse(stats[2]);

    if (characterHp == null) throw 'Hp 초기화 실패';
    if (characterAtk == null) throw 'Atk 초기화 실패';
    if (characterDef == null) throw 'Def 초기화 실패';

    Character character =
        Character('이름', characterHp, characterAtk, characterDef);
  } catch (e) {
    print('캐릭터 생성에 실패했습니다 : $e');
  }
}
