// 연습문제 : 쿼리

class Trader {
  String name;
  String city;

  Trader(this.name, this.city);
}

class Transaction {
  Trader trader;
  int year;
  int value;

  Transaction(this.trader, this.year, this.value);
}

final transactions = [
  Transaction(Trader("Brian", "Cambridge"), 2011, 300),
  Transaction(Trader("Raoul", "Cambridge"), 2012, 1000),
  Transaction(Trader("Raoul", "Cambridge"), 2011, 400),
  Transaction(Trader("Mario", "Milan"), 2012, 710),
  Transaction(Trader("Mario", "Milan"), 2012, 700),
  Transaction(Trader("Alan", "Cambridge"), 2012, 950),
];


void main() {
  // 1. 2011년에 일어난 모든 트랜잭션을 찾아 가격 기준 오름차순으로 정리하여 이름을 나열하시오
  transactions.where((e) => e.year == 2011).toList()
    ..sort((a, b) => a.value.compareTo(b.value))
    ..forEach((e) => print('이름 : ${e.trader.name}: 도시 : ${e.value}'));


  // 2. 거래자가 근무하는 모든 도시를 중복 없이 나열하시오
  final allCity = transactions.map((e) => e.trader.city).toSet();
  print('거래자가 근무하는 모든 도시 : ${allCity}');

  // 3. 케임브리지에서 근무하는 모든 거래자를 찾아서 이름순으로 정렬하여 나열하시오
  transactions.where((e) => e.trader.city == 'Cambridge').map((e) => e.trader.name).toSet().toList()
    ..sort()
    ..forEach((e) => print('케임브리지 근무 거래자 : ${e}'));

  // 4. 모든 거래자의 이름을 알파벳순으로 정렬하여 나열하시오
  final traderNames = transactions.map((e) => e.trader.name).toSet().toList();
  traderNames.sort();
  // forEach 왜 노란불?
  traderNames.forEach((e) => print('알파벳순으로 정렬 ${e}'));

  // 5. 밀라노에 거래자가 있는가?
  final liveTrader = transactions.any((e) => e.trader.city == 'Milan');
  print('밀라노에 거래자 : ${liveTrader}');


  // 6. 케임브리지에 거주하는 거래자의 모든 트랙잭션값을 출력하시오
  transactions.where((e) => e.trader.city == 'Cambridge').forEach((e) => print('케임브리지 트랜잭션값 : ${e.value}'));

  // 7. 전체 트랜잭션 중 최대값은 얼마인가?
  final allBig = transactions.map((e) => e.value).reduce((a, b) => a > b ? a : b);
  print('최대값 : ${allBig}');

  // 8. 전체 트랜잭션 중 최소값은 얼마인가?
  final allSmall = transactions.map((e) => e.value).reduce((a, b) => a < b ? a : b);
  print('최소값 : ${allSmall}');

}