import 'dart:io';
import 'dart:math';
import 'monster.dart';
import 'character.dart';

class Game {
  Character character = Character();
  List<Monster> monster = []; // 몬스터 리스트
  int monsterKillCount = 0; // 죽인 몬스터 수

  /// 게임 시작
  String startGame(Character character) {
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

        // 몬스터의 공격력 설정
        int monsterAtk = Random().nextInt(atk + 1); // 몬스터 공격력 랜덤하게 설정
        monsterAtk = (monsterAtk < character.def) ? character.def : monsterAtk; // 몬스터의 공격력이 캐릭터의 방어력 보다 낮을 경우 캐릭터 방어력과 같게 설정

        Monster mon = Monster();
        mon.name = name;
        mon.hp = hp;
        mon.atk = monsterAtk;

        this.monster.add(mon);
      }
    } catch (e) {
      print('몬스터를 생성하던 중 오류가 생겼습니다 : $e');
    }

    stdout.writeln("게임을 시작합니다!");

    bool isContinue = true; // 다음 전투 여부
    bool isWin = false; // 전투 결과

    // 몬스터 소환 및 전투 시작
    while (isContinue) {
      Monster newMonster = getRandomMonster(); // 새로운 몬스터 소환

      // 현재 내 캐릭터 상태 출력
      stdout.writeln("----------현재 내 캐릭터 상태----------");
      character.showStatus();
      stdout.writeln("---------------------------------------");

      // 새로운 몬스터 상태 출력
      stdout.writeln("\n새로운 몬스터가 나타났습니다!");
      newMonster.showStatus();

      isWin = battle(character, newMonster); // 전투 진행

      if (isWin == true) {
        // 몬스터가 없을 경우 종료
        if (monster.isEmpty) {
          stdout.writeln("축하합니다! 모든 몬스터를 물리쳤습니다.");
          isContinue = false; // 전투 중지
          break;
        }

        // 다음 경기 진행 여부 결정
        while (true) {
          stdout.write("다음 몬스터와 싸우시겠습니까? (y/n): ");
          String? isYes = stdin.readLineSync()!;

          if (isYes.toLowerCase() == "n") {
            isContinue = false; // 전투 중지
          } else if (isYes.toLowerCase() == "y") {
            break; // 다음 전투 진행
          } else {
            stdout.writeln("y 혹은 n만 입력이 가능합니다.");
          }
        }
      } else {
        break;
      }
    }
    return "${character.name} - 체력: ${character.hp}, 결과: ${isWin ? '승리' : '패배'}, 물리친 몬스터: $monsterKillCount";
  }

  /// 전투 진행
  bool battle(character, monster) {
    while (true) {
      // 캐릭터 턴
      stdout.write("\n${character.name}의 턴\n행동을 선택하세요 (1: 공격, 2: 방어): ");
      String control = stdin.readLineSync()!;

      if (control == "1") {
        monster.hp = character.attackMonster(monster);
        stdout.writeln("${character.name}이(가) ${monster.name}에게 ${character.atk}의 데미지를 입혔습니다.");

        // 몬스터의 체력이 0 이하일 경우 승리
        if (monster.hp <= 0) {
          stdout.writeln("${monster.name}을(를) 물리쳤습니다!\n");
          monsterKillCount++; // 킬 카운트 증가
          break; // 전투 종료
        }
      } else if (control == "2") {
        character.hp = character.defend();
        stdout.writeln("${character.name}이(가) 방어 태세를 취하여 ${character.def}만큼 체력을 얻었습니다.");
      } else {
        stdout.writeln("1 혹은 2만 입력할 수 있습니다. 다시 입력해 주세요.");
        battle(character, monster); // 1,2외의 문자 입력할 경우 재입력
      }

      // 몬스터 턴
      stdout.writeln("\n${monster.name}의 턴");
      character.hp = monster.attackCharacter(character);
      stdout.writeln("${monster.name}이(가) ${character.name}에게 ${monster.atk}의 데미지를 입혔습니다.\n");

      // 캐릭터와 몬스터 상태 출력
      character.showStatus();
      monster.showStatus();

      // 캐릭터의 체력이 0 이하일 경우 패배
      if (character.hp <= 0) {
        stdout.writeln("${character.name}이(가) 패배했습니다.");
        return false;
      }
    }
    return true;
  }

  /// 랜덤 몬스터 소환
  Monster getRandomMonster() {
    // 랜덤 몬스터 생성
    final random = Random();
    int idx = random.nextInt(monster.length);
    Monster newMonster = monster[idx];

    // // 몬스터 리스트에서 몬스터 삭제
    monster.removeAt(idx);

    return newMonster;
  }
}
