import 'package:learn_dart_together/240318/word.dart';
import 'package:test/test.dart';

void main() {
  test('Word Test', () {
    Word a = Word('Hello world');
    expect(a.isVowel(1) == false, true); // 1번째 글자인 H는 모음이 아님
    expect(a.isVowel(2) == true, true); // 2번째 글자인 e는 모음이 맞음
  });
}
