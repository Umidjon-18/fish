import 'dart:async';
import 'dart:math';

import 'fish_type/fishType.dart';
import 'interfaces/aquariumInterface.dart';
import 'interfaces/fishInterface.dart';

class Fish implements FishInterface {
  late AquariumInterface aquariumInterface;
  final List<Timer> timerList = [];
  Random random = Random.secure();
  late FishType type;
  late int lifeTime;
  late String name;

  Fish(this.type, this.name, this.lifeTime, this.aquariumInterface) {
    onLive();
  }

  @override
  onLive() {
    Timer t = Timer(Duration(seconds: lifeTime), (() => onDead("Umri tugadi")));
    timerList.add(t);
    onChose();
  }

  @override
  onChose() {
    int oportunity;
    if (aquariumInterface.getSizeFish() < 20) {
      oportunity = random.nextInt(3) + 1;
    } else {
      oportunity = random.nextInt(2) + 1;
    }
    int time = 0;
    for (var i = 0; i < oportunity; i++) {
      int currentTime = random.nextInt(lifeTime)+1;
      if(time != currentTime){
        Timer t = Timer(Duration(seconds: currentTime), (() => aquariumInterface.onChosenFish(type, name)));
        time = currentTime;
        timerList.add(t);
      } else {
        i--;
        continue;
      }
    }
  }

  @override
  onDead(String reason) {
    for (var time in timerList) {
      time.cancel();
    }
    aquariumInterface.onDead(type, name, reason);
  }

  @override
  onWill() {
    if(aquariumInterface.getSizeFishA()<7 || aquariumInterface.getSizeFishB()<7){
      return true;
    } else {
      return random.nextBool();
    }
  }
}
