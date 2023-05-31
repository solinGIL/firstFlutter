// 연습문제 1번
// 다음 조건을 만족하는 금고인 StrongBox 클래스를 정의하시오.
// 금고 클래스에 담는 인스턴스의 타입은 미정
// 금고에는 1개의 인스턴스를 담을 수 있음
// put() 메서드로 인스턴스를 저장하고 get() 메서드로 인스턴스를 얻을 있음
// get() 으로 얻을 때는 별도의 타입 캐스팅을 사용하지 않아도 됨

// 연습문제 2번
//연습문제 1에서 작성한 StrongBox 클래스에 열쇠의 종류를 나타내는 열거형 KeyType을 정의하고,
//다음 내용을 반영하여 StrongBox 클래스를 수정하시오.

// 단, 열쇠의 종류는 다음 4종류로 한정한다. 각 열쇠는 사용횟수의 한도가 정해져 있다.
//
//
// padlock    (1,024회)
// button      (10,000회)
// dial             (30,000회)
// finger       (1,000,000회)
//
// 금고에서 get() 메서드를 호출할 때 마다 사용횟수를 카운트하고 각 열쇠의 사용횟수에 도달하기 전에는 null을 리턴한다.

enum KeyType {
  padlock,
  button,
  dial,
  finger,
}

class StrongBox<E> {
  E? _item;
  KeyType _keyType;
  int _count = 0;

  StrongBox(this._keyType);

  void put(E item) {
    _item = item;
  }

  E? get() {
    _count++;
    switch (_keyType) {
      case KeyType.padlock:
        if (_count > 1024) {
          return _item;
        }
        break;
      case KeyType.button:
        if (_count > 10000) {
          return _item;
        }
        break;
      case KeyType.dial:
        if (_count > 30000) {
          return _item;
        }
        break;
      case KeyType.finger:
        if (_count > 1000000) {
          return _item;
        }
        break;
    }
    return null;
  }
}

void main() {
  StrongBox<String> box = StrongBox<String>(KeyType.dial);
  box.put('열림');

  int keyCount = 0;
  while (box.get() == null) {
    keyCount++;
    print('$keyCount번 시도했습니다.');
  }

  print('시도횟수 $keyCount. 아이템: ${box.get()}');
}

