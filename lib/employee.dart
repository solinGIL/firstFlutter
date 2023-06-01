// 다음과 같은 사원 클래스와 부서 클래스가 있습니다.
// 총무부 리더 ‘홍길동(41세)’의 인스턴스를 생성하고 직렬화하여 company.txt 파일에 쓰는 프로그램을 작성하시오.
// 직렬화를 위해 위의 2개 클래스를 일부 수정해도 됩니다.

import 'dart:convert';
import 'dart:io';

class Employee {
  String name;
  int age;

  Employee(this.name, this.age);

  Employee.fromJson(Map<String, dynamic> json)
  : name = json['name'],
    age = json['age'];

  Map<String, dynamic> toJson() => {
    'name' : name,
    'age' : age
  };
}

class Department {
  String name;
  Employee  leader;

  Department(this.name, this.leader);

  Map<String, dynamic> toJson() => {
    'name' : name,
    'leader' : leader.toJson()
  };
}

void fileWrite(Department department) {
  final file = File('company.txt');
  file.writeAsStringSync(jsonEncode(department.toJson()));
}

void main() {
  String employeeStr = '{"name": "홍길동", "age" : 41}';
  Map<String, dynamic> json = jsonDecode(employeeStr);

  print(json['name']);
  print(json['age']);

  Employee leader = Employee.fromJson(json); // 역직렬화

  Department department = Department('총무부', leader); // fileWrite에게 보냄

  fileWrite(department);
}