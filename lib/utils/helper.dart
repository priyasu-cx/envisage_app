import 'dart:math';

// Define a reusable function
String generateIdChar(int length) {
  final _random = Random();
  const _availableChars = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  final randomString = List.generate(length,
          (index) => _availableChars[_random.nextInt(_availableChars.length)])
      .join();

  return randomString;
}

String generateIdInt(int length) {
  final _random = Random();
  const _availableChars = '1234567890';
  final randomString = List.generate(length,
          (index) => _availableChars[_random.nextInt(_availableChars.length)])
      .join();

  return randomString;
}

String getId() {
  return "22EVG" + generateIdChar(3) + generateIdInt(6);
}
