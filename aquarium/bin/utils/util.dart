import 'dart:io';
import 'dart:math';

import '../fish_type/fishType.dart';

mixin Util {
  static const _chars = 'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz';
  Random random = Random();
  List logList = [];

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
    logList.add({ DateTime.now().toString(): "🔺 $first ➡️ $second ga so'rov yubordi."});
    print("🔺 $first ➡️ $second ga so'rov yubordi.");
  }

  printDecline(String second) {
    logList.add({ DateTime.now().toString(): "❌ $second rad qildi."});
    print("❌ $second rad qildi.");
  }

  printAccept(String second) {
    logList.add({ DateTime.now().toString(): "✅ $second rozi bo'ldi"});
    print("✅ $second rozi bo'ldi");
  }

  printBirth(FishType type, String name) {
    logList.add({ DateTime.now().toString(): "🟢 Yangi baliq. Turi: $type. Nomi: $name"});
    print("🟢 Yangi baliq. Turi: $type. Nomi: $name");
  }

  printDead(String name, String reason, int countDead) {
    logList.add({ DateTime.now().toString(): "💀 $name o'ldi. Sabab: $reason.  Jami o'lganlar soni: $countDead"});
    print("💀 $name o'ldi. Sabab: $reason.  Jami o'lganlar soni: $countDead");
    if(logList.length>1000){
      
    }
  }

  printAll(int jami, int fishA) {
    logList.add({ DateTime.now().toString(): "FishA: $fishA. FishB: ${jami - fishA}. Jami: $jami\n"});
    print("FishA: $fishA. FishB: ${jami - fishA}. Jami: $jami\n");
  }

  printExit() {
    clear();
    logList.add({ DateTime.now().toString(): "Bir turdagi baliqlar soni tugadi!"});
    print("Bir turdagi baliqlar soni tugadi!");
    exit(0);
  }

  printError(e) {
    clear();
    print(e);
    exit(0);
  }

  clear() {
    print(Process.runSync("clear", [], runInShell: true).stdout);
  }
}
