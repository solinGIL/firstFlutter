class Vehicle {
  String color; // 필드

  Vehicle(this.color); // 생성자

  void drive() {
    print("드라이브"); // 메서드
  }
}

class Car extends Vehicle { // extends를 사용하여 Vehicle에 있는 기능을 가져와 확장시킬 수 있게됌
  int carNumber;

  Car(String color, this.carNumber) : super(color); // super를 씀으로써 Vehicle을 참조함

  @override // 무조건 오버라이드를 사용해줘야 부모의 기능을 쓸 수 있음 없으면 현재 클래스 단독 함수임
  void drive() {
    print("자동차로 드라이브");
  }
}

void main() {
  Vehicle myVehicle = Vehicle('blue'); // 부모 클래스에 있는 생성자
  myVehicle.drive(); // 부모 클래스에 있는 Vehicle(this.color)에 blue를 전달.

  Car myCar = Car('red', 8282);
  myCar.drive(); // 인스턴스 호출
  print("내 차 넘버는 ${myCar.carNumber}");
}