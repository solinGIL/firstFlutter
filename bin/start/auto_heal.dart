import 'dart:async';
import 'unit.dart';

class ZergHeal {
  void zergHeal(Unit unit) {
    // 2초 지날 때마다 체력 재생
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (unit.health >= unit.maxHealth) { // 체력 비교 후 각 조건에 맞는 작업함.
        timer.cancel(); // 체력이 가득 차 있으면 흐르는 시간이 멈춤.
        print('${unit.name}의 체력이 가득함');
      } else {
        unit.health += 5; // 체력 5씩 재생
        print('${unit.name} 재생중. 현재 체력: ${unit.health}');
      }
    });
  }
}

class ProtossHeal {
  void protossHeal(Unit unit) {
    // 2초 지날 때마다 방어막 회복
    Timer.periodic(Duration(seconds: 2), (timer) {
      if (unit.health >= unit.maxHealth) {
        timer.cancel();
        print('${unit.name}의 방어막이 가득참');
      } else {
        unit.health += 5;
        print('${unit.name} 방어막 회복중. 현재 방어막: ${unit.health}');
      }
    });
  }
}