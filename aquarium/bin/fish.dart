import 'dart:async';
import 'dart:math';

import 'package:hive/hive.dart';

import 'fish_type/fishType.dart';
import 'interfaces/aquariumInterface.dart';
import 'interfaces/fishInterface.dart';

part 'fish.g.dart';

@HiveType(typeId: 1)
class Fish extends HiveObject implements FishInterface {
  late AquariumInterface aquariumInterface;
  final List<Timer> timerList = [];
  Random random = Random.secure();
  late String name;
  @HiveField(0)
  late FishType type;
  @HiveField(1)
  late int lifeTime;
  @HiveField(2)
  late int oportunity;
  @HiveField(3)
  late String reasonDead;
  @HiveField(4)
  late String birthday;
  @HiveField(5)
  late String parent;
  @HiveField(6)
  late List<Map> population;

  Fish(this.type, this.name, this.lifeTime,String parent1, String parent2, this.aquariumInterface, List field) {
    parent = "$parent1 & $parent2";
    birthday = DateTime.now().toString();
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
    if (aquariumInterface.getSizeFish() < 20) {
      oportunity = random.nextInt(3) + 1;
    } else {
      oportunity = random.nextInt(2) + 1;
    }
    int time = 0;
    for (var i = 0; i < oportunity; i++) {
      int currentTime = random.nextInt(lifeTime) + 1;
      if (time != currentTime) {
        Timer t = Timer(Duration(seconds: currentTime),
            (() => aquariumInterface.onChosenFish(type, name, currentTime)));
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
    if (aquariumInterface.getSizeFishA() < 7 ||
        aquariumInterface.getSizeFishB() < 7) {
      return true;
    } else {
      return random.nextBool();
    }
  }
}
