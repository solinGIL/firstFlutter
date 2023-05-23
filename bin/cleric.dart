import 'dart:math';

class Cleric {
  //필드
  String name;
  int hp;
  int mp;

  static final int maxHp = 50;
  static final int maxMp = 10;



  // 생성자
  Cleric(this.name, this.hp, this.mp) {
    if (name.isEmpty) {
      throw ArgumentError('이름이 없습니다.');
    }
  }

  Cleric.withNameAndHp({required String name, required int hp})
  : hp = hp, name = name, mp = maxMp;

  Cleric.withName({required String name})
  : this(name, maxHp, maxMp);

  Cleric.withNameAndHpAndMp({required String name, required int hp, required int mp})
  : hp = hp, name = name, mp = maxMp;


  // 함수
  void selfAid() {
    if (mp >= 5) {
      mp -= 5;
      hp = maxHp;
      print('성직자가 selfAid 마법을 사용하여 HP를 ${hp}만큼 회복했습니다.');
    } else {
      print('MP가 selfAid 셀프 에이드 마법을 사용할 수 없습니다.');
    }
  }

  int pray(int seconds) {
    int recovery = seconds + Random().nextInt(3);
    int regain = min(maxMp - mp, recovery);
    mp += regain;

    return regain;
  }

}

  // 메인
  void main() {
    Cleric cleric1 = Cleric.withNameAndHpAndMp(name: '아서스', hp: 40, mp: 5);
    Cleric cleric2 = Cleric.withNameAndHp(name: '아서스', hp: 40);
    Cleric cleric3 = Cleric.withName(name: '아서스');
    Cleric cleric = Cleric('아서스', 40, 5);


    cleric.selfAid();
    
    int prayTime = 3;
    int recovery = cleric.pray(prayTime);
    print('성직자가 ${prayTime}초 동안 기도하여 ${recovery}만큼의 MP를 회복 했습니다.');
  }

