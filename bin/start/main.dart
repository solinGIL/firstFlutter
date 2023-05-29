import 'unit.dart';
import 'terran.dart';
import 'zerg.dart';
import 'protoss.dart';
import 'attack.dart';

void main() {
  // 인스턴스 생성
  UnitGroup unitGroup = UnitGroup();
  Attack attack = Attack();

  // 유닛 생성
  Marine marine = Marine();
  Medic medic = Medic();
  Tank tank = Tank();
  Vulture vulture = Vulture();
  SCV scv = SCV();
  ZergUnit zergUnit = ZergUnit('Zergling', 0, 0);
  ZergBuilding zergBuilding = ZergBuilding('Hatchery', 0, 0);
  Zealot zealot = Zealot('Zealot', 0, 0);
  Dragun dragun = Dragun('Dragun', 0, 0);

  medic.heal(marine); // 메딕 힐
  medic.heal(zergBuilding); // 메딕이 빌딩 힐

  scv.repair(marine); // scv에 마린 유닛 전달 / 결과 : 수리 불가능
  scv.repair(vulture); // scv에 벌쳐 전달 / 결과 : 수리

  attack.deal(zergUnit); // 저그유닛에게 5의 데미지를 입힘
  print('zergUnit 체력 : ${zergUnit.health}'); // 입은 데미지 결과


  // zergBuilding.zergHeal(ZergBuilding('ZergBuilding', 0, 0)); // 저그빌딩 회복
  zergUnit.zergHeal(ZergUnit('zergUnit', 0, 0)); // 저그유닛 회복

  zealot.protossHeal(Zealot('zealot', 0, 0)); // 방어막 회복
  // dragun.protossHeal(Dragun('Dragun', 0, 0)); // 방어막 회복


  // 유닛을 부대에 추가
  // unitGroup.addUnit(marine);
  // unitGroup.addUnit(marine);
  // unitGroup.addUnit(marine);
  // unitGroup.addUnit(marine);
  // unitGroup.addUnit(marine);
  // unitGroup.addUnit(marine);
  // unitGroup.addUnit(marine);
  // unitGroup.addUnit(marine);
  unitGroup.addUnit(marine);
  unitGroup.addUnit(medic);
  unitGroup.addUnit(tank);
  unitGroup.addUnit(vulture);
  unitGroup.addUnit(scv);
  unitGroup.addUnit(zergUnit);
  unitGroup.addUnit(zergBuilding);

  // 부대지정 유닛
  unitGroup.groupUnits();
}
