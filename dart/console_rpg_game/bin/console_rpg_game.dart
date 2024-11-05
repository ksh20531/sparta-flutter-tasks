import 'dart:io';
import 'package:console_rpg_game/character.dart';

void main(List<String> arguments) async {
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
  stdout.write("캐릭터의 이름을 입력하세요: ");
  String characterName = stdin.readLineSync()!;

  try {
    // 한글 및 영어 대소문자 정규식
    RegExp regex = RegExp(r'^[a-zA-Z가-힣]+$');

    if (characterName.isEmpty) throw '이름은 필수에요!';
    if (!regex.hasMatch(characterName)) throw '한글과 영어만 입력 가능해요';
  } catch (e) {
    print(e);
  }

  // 파일 쓰기
  Character character = Character();
  character.name = characterName;

  // 디렉토리가 없을 경우 생성
  final path = 'data/results';

  try {
    final directory = Directory(path);
    if (!await directory.exists()) {
      await directory.create(recursive: true);
    }
  } catch (e) {
    print('경로 생성에 실패했습니다.');
  }

  int time = DateTime.now().microsecondsSinceEpoch;
  String fileName = '$path/result_$time.txt';
  final file = File(fileName);

  try {
    await file.writeAsString(character.name);
  } catch (e) {
    print('파일 생성에 실패했습니다.');
  }
}
