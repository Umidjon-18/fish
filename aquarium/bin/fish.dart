import 'dart:async';
import 'dart:math';

import 'package:hive/hive.dart';

import 'fish_type/fishType.dart';
import 'interfaces/aquariumInterface.dart';
import 'interfaces/fishInterface.dart';

part 'fish.g.dart';

@HiveType(typeId: 1)
class Fish extends HiveObject implements FishInterface {
  AquariumInterface aquariumInterface;
  final List<Timer> timerList = [];
  Random random = Random.secure();
  String name;

  @HiveField(0)
  FishType type;
  @HiveField(1)
  int lifeTime;
  @HiveField(2)
  int oportunity;
  @HiveField(3)
  String reasonDead;
  @HiveField(4)
  String birthday;
  @HiveField(5)
  String parent;
  @HiveField(6)
  List<Map> population;

  Fish(
      {this.aquariumInterface,
      this.name,
      this.type,
      this.lifeTime,
      this.parent}) {
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
    int time = 0;
    oportunity = random.nextInt(2) + 1;

    if (aquariumInterface.getSizeFish() < 20) {
      oportunity = random.nextInt(3) + 1;
    }

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
    }
    return random.nextBool();
  }
}
