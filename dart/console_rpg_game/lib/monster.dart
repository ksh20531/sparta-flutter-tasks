import 'dart:io';
import 'package:console_rpg_game/character.dart';

class Monster {
  String name = ''; // 몬스터 이름
  int hp = 0; // 몬스터 체력
  int atk = 0; // 몬스터 최대 공격력, 방어력보다 낮을 수 없고 랜덤
  int def = 0; // 몬스터 방어력

  /// 캐릭터 공격
  int attackCharacter(Character character) {
    int remainedHp = character.hp;

    if (character.hp >= atk) {
      remainedHp = character.hp - atk;
    } else {
      remainedHp = 0;
    }

    return remainedHp;
  }

  /// 몬스터 상태 출력
  void showStatus() {
    stdout.writeln("$name - 체력: $hp, 공격력: $atk");
  }
}
