import 'unit.dart';
import 'auto_heal.dart';

class Zealot extends Unit with ProtossHeal {
  Zealot(String name, int health, int maxHealth)
      : super(name, health, maxHealth) {
    this.health = 10;
    this.maxHealth = 50;
  }
}

class Dragun extends Unit with ProtossHeal {
  Dragun(String name, int health, int maxHealth)
      : super(name, health, maxHealth) {
    this.health = 20;
    this.maxHealth = 100;
  }
}