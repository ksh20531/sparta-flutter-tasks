import 'dart:io';
import 'package:console_rpg_game/monster.dart';

class Character {
  String name = ''; // 이름
  int hp = 0; // 체력
  int atk = 0; // 공격력
  int def = 0; // 방어력
  bool haveItem = true; // 아이템 소지 여부

  /// 공격
  int attackMonster(Monster monster) {
    int remainedHp = monster.hp;

    if (monster.hp >= atk) {
      remainedHp = (atk > monster.def) ? monster.hp - atk + monster.def : monster.hp - atk;
    } else {
      remainedHp = 0;
    }

    return remainedHp;
  }

  /// 방어
  int defend() {
    return hp + def;
  }

  /// 아이템 사용
  void useItem() {
    atk *= 2;
    haveItem = false;
  }

  /// 캐릭터 상태 출력
  void showStatus() {
    stdout.writeln("$name - 체력:$hp, 공격력:$atk, 방어력:$def");
  }
}
