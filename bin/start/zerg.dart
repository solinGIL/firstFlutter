import 'auto_heal.dart';
import 'unit.dart';

class ZergUnit extends Unit with ZergHeal {
  ZergUnit(String name, int health, int maxHealth)
      : super(name, health, maxHealth) {
    this.health = 10;
    this.maxHealth = 50;
  }
}

class ZergBuilding extends Unit with ZergHeal {
  ZergBuilding(String name, int health, int maxHealth)
      : super(name, health, maxHealth) {
    this.health = 20;
    this.maxHealth = 100;
  }
}