import 'dart:math';

mixin Shark {
  Random random = Random.secure();
  checking(int amount) {}

  String killing(List<String> listFishA, List<String> listFishB) {
    if (listFishA.length > listFishB.length) {
      return listFishA[random.nextInt(listFishA.length)];
    } else {
      return listFishB[random.nextInt(listFishB.length)];
    }
  }
}
