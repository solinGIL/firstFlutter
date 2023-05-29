import 'unit.dart';

class Attack {
  void deal(Unit unit) {
    unit.health -= 5;
    print('${unit.name} 5의 데미지를 입음');
  }
}