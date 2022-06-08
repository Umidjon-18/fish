import 'dart:async';
import 'dart:math';

import 'fish.dart';
import 'interfaces/aquariumInterface.dart';

class Shark {
  Random random = Random.secure();
  late AquariumInterface aquariumInterface;

  Shark(this.aquariumInterface){
    checking(aquariumInterface.getSizeFish());
  }

  checking(int amount) {
    if (aquariumInterface.getSizeFish() > 20) {
      Fish victim = aquariumInterface.getFish()[killing(aquariumInterface.getFishA(), aquariumInterface.getFishB())];
      victim.onDead("Shark killed 🦈");
    }
    Timer(Duration(seconds: 5), ()=> checking(aquariumInterface.getSizeFish()));
  }

  String killing(List<String> listFishA, List<String> listFishB) {
    if (listFishA.length > listFishB.length) {
      return listFishA[random.nextInt(listFishA.length)];
    } else {
      return listFishB[random.nextInt(listFishB.length)];
    }
  }

}
