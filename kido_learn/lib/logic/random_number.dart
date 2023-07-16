import 'dart:math';

List<int> generateRandomTwoNumbers(int min, int max) {
  Random random = Random();

  int randomNumber1 = random.nextInt(max - min + 1) + min;
  int randomNumber2 = random.nextInt(max - min + 1) + min;

  return [randomNumber1, randomNumber2];
}
