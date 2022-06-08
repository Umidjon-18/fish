import 'dart:io';
import 'dart:math';

import '../fish_type/fishType.dart';

mixin Util {
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  Random random = Random();

  String getRandomString(int length) => String.fromCharCodes(Iterable.generate(
      length, (_) => _chars.codeUnitAt(random.nextInt(_chars.length))));

  String generateName(String first, String second) {
    String newName = first.substring((first.length ~/ 3) * 2) +
        second.substring((first.length ~/ 3) * 2) +
        getRandomString(first.length ~/ 3);

    return newName.toLowerCase();
  }

  FishType generateType() {
    if (random.nextBool()) {
      return FishType.fishA;
    } else {
      return FishType.fishB;
    }
  }

  printRequest(String first, String second) {
    print("🔺 $first ➡️ $second ga so'rov yubordi.");
  }

  printDecline(String second) {
    print("❌ $second rad qildi.");
  }

  printAccept(String second) {
    print("✅ $second rozi bo'ldi");
  }

  printBirth(FishType type, String name) {
    print("🟢 Yangi baliq. Turi: $type. Nomi: $name");
  }

  printDead(String name, String reason) {
    print("💀 $name o'ldi. Sabab: $reason");
  }

  printAll(int jami, int fishA) {
    print("FishA: $fishA. FishB: ${jami - fishA}. Jami: $jami\n");
  }

  printError(e) {
    print(e);
    exit(0);
  }
}
