import 'package:learn_dart_together/240311/encapsulation/wand.dart';
import 'package:learn_dart_together/240311/encapsulation/wizard.dart';
import 'package:test/test.dart';

void main() {
  test('Wizard Test', () {
    Wand wand = Wand('지팡팡이', 30);
    Wizard wizard = Wizard('박세훈', 30, -2, wand);
    // wizard.name = '짧게';
    // wizard.mp = -3;
  });
}