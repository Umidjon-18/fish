import 'dart:async';
import 'dart:math';
import 'interfaces/aquariumInterface.dart';

class Shark {
  Random random = Random.secure();
  AquariumInterface aquariumInterface;

  Shark(this.aquariumInterface) {
    checking(aquariumInterface.getSizeFish());
  }

  checking(int amount) {
    int timeDuration = 15;
    if (aquariumInterface.getSizeFish() > 20) {
      timeDuration = 5;
      aquariumInterface.victimDead();
    }
    Timer(Duration(seconds: timeDuration), () => checking(aquariumInterface.getSizeFish()));
     
  }
}
