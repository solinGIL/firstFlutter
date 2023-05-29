// 이런 클래스가 선언되어 있다.
// 다음 물음에 답하시오
//
// X obj = A(); 로 A인스턴스를 생성한 후, 변수 obj에서 호출할 수 있는 메소드를 a(), b(), c() 중에 골라보시오
//
//
// Y y1 = A();
// Y y2 = B(); 로 A와 B의 인스턴스를 생성한 후
// y1.a();
// y2.a(); 를 실행했을 때에 화면에 표시되는 내용을 말하시오.


abstract class X {
  void a();
}

abstract class Y implements X {
  void b();
}

class A extends Y {
  @override
  void a() {
    print('Aa');
  }

  @override
  void b() {
    print('Ab');
  }

  void c() {
    print('Ac');
  }
}

class B extends Y {
  @override
  void a() {
    print('Ba');
  }

  @override
  void b() {
    print('Bb');
  }

  void c(){
    print('Bc');
  }
}

void main() {
  X obj = A(); // X타입 변수에 A인스턴스 할당
  obj.a(); // Aa출력


  Y y1 = A(); // A인스턴스가 할당
  Y y2 = B(); // B인스턴스가 할당
  y1.a(); // A인스턴스의 a() = Aa출력
  y2.a(); // B인스턴스의 a() = Ba출력
}