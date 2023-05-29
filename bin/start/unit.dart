import 'terran.dart';

abstract class Unit {
  String name;
  int health;
  int maxHealth;

  Unit(this.name, this.health, this.maxHealth);
}

// 부대지정
class UnitGroup {
  // 유닛 리스트 생성
  List<Unit> units = [];

  // 최대 12명까지만 add함
  void addUnit(Unit unit) {
    if (units.length >= 12) {
      print('최대 12유닛');
      return;
    }
    units.add(unit);
    print('${unit.name} 그룹에 추가 되었음.');
  }

  // 부대지정한 유닛들 확인
  void groupUnits() {
    for (var unit in units) {
      print('${unit.name} 부대지정');
    }
  }
}