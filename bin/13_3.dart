//문제 13-2 에서 이용한 A클래스나 B클래스의 인스턴스를 각각 1개씩 생성하여, List 에 차례로 담는다.
//그 후에 List 의 요소를 차례대로 꺼내 각각의 인스턴스의 b() 메소드를 호출 하여야 한다. 이상을 전제로 다음 물음에 답하시오.
//List 변수의 타입으로 무엇을 사용하여야 하는가
//위에서 설명하고 있는 프로그램을 작성하시오

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
  List<Y> bList = [];

  A a = A();
  B b = B();

  bList.add(a);
  bList.add(b);

  for (var li in bList) {
    li.b(); // 각 인스턴스의 b() 메서드 호출, add한 메서드를 순서대로 출력.
  }
}
