import 'dart:math';

String generateCode() {
  const alphabet = 'ABCDEFGHIJKLMNOPQRSTUVWXYZ';
  const codeLength = 10;
  final random = Random();
  final code = StringBuffer();
  for (var i = 0; i < codeLength; i++) {
    code.write(alphabet[random.nextInt(alphabet.length)]);
  }
  return code.toString();
}
