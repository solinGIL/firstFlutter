import 'unit.dart';
import 'zerg.dart';

// 생물 유닛 클래스
class Marine extends Unit {
  Marine() : super('Marine', 100, 100);
}

class Medic extends Unit {
  Medic() : super('Medic', 100, 100);

  void heal(Unit unit) {
    if (unit is ZergBuilding) {
      print('빌딩은 치료 할 수 없습니다.');
    } else {
      print('치료했음');
    }
  }
}

// 기계 유닛 클래스
class Tank extends Unit {
  Tank() : super('Tank', 100, 100);
}

class Vulture extends Unit {
  Vulture() : super('Vulture', 100, 100);
}

class SCV extends Unit {
  SCV() : super('SCV', 100, 100);

  void mine() {
    print('채취중');
  }

  void repair(Unit unit) {
    if (unit is Tank || unit is Vulture) {
      print('SCV ${unit.name} 수리중');
    } else {
      print('해당 유닛은 수리 불가능');
    }
  }
}
