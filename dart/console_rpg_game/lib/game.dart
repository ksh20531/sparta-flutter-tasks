import 'dart:io';
import 'dart:math';
import 'monster.dart';
import 'character.dart';

class Game {
  Character character = Character();
  List<Monster> monster = []; // 몬스터 리스트
  int monsterKillCount = 0; // 죽인 몬스터 수

  /// 게임 시작
  bool startGame() {
    return true;
  }

  /// 전투 진행
  void battle() {}

  /// 랜덤 몬스터 소환
  Monster getRandomMonster() {
    try {
      // 몬스터 파일 읽어오기
      final monsterFile = File('data/csv/monsters.txt');
      final contents = monsterFile.readAsStringSync();

      if (contents.isEmpty) throw '몬스터 정보 로드 실패';

      // Monster 객체화
      List<String> monsters = contents.split('\n');
      for (var monster in monsters) {
        List<String> monsterData = monster.split(',');

        if (monsterData.length != 3) throw '몬스터 포맷 오류';

        String name = monsterData[0];
        int? hp = int.tryParse(monsterData[1]);
        int? atk = int.tryParse(monsterData[2]);

        if (name.isEmpty) throw '이름 초기화 실패';
        if (hp == null) throw '체력 초기화 실패';
        if (atk == null) throw '공격력 초기화 실패';

        Monster mon = Monster();
        mon.name = name;
        mon.hp = hp;
        mon.maxAtk = atk;

        this.monster.add(mon);
      }
    } catch (e) {
      print('몬스터를 소환하는 중 오류가 생겼습니다 : $e');
    }

    // 몬스터 랜덤 소환
    final random = Random();
    Monster newMonster = monster[random.nextInt(monster.length)];

    return newMonster;
  }
}
