class Character {
  String name = ''; // 이름
  int hp = 0; // 체력
  int atk = 0; // 공격력
  int def = 0; // 방어력

  Character(this.name, this.hp, this.atk, this.def);

  /// 공격
  void attackMonster() {}

  /// 방어
  void defend() {}

  /// 캐릭터 상태 출력
  void showStatus() {}
}
