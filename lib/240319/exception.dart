void main() {
  final numString = '10å5';

  int num;
  try {
    num = int.parse(numString);
  } catch(e) {
    num = 0;
  }

  print(num);
}