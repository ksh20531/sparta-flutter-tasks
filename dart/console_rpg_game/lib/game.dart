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
  void getRandomMonster() {}
}
