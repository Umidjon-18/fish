import 'fish.dart';
import 'fish_type/fishType.dart';
import 'interfaces/aquariumInterface.dart';
import 'shark.dart';
import 'utils/util.dart';

class Aquarium with Util implements AquariumInterface {
  Map<String, Fish> listFish = {};
  List<String> listFishA = [];
  List<String> listFishB = [];
  int countDead = 0;

  onStart() {
    Fish fishA = Fish(
        aquariumInterface: this,
        name: "aaaaaaaaa",
        lifeTime: generateLifeTime(),
        parent: "---------",
        type: FishType.fishA);
    Fish fishB = Fish(
        aquariumInterface: this,
        name: "bbbbbbbbb",
        lifeTime: generateLifeTime(),
        parent: "---------",
        type: FishType.fishB);

    listFish[fishA.name] = fishA;
    listFish[fishB.name] = fishB;

    listFishA.add(fishA.name);
    listFishB.add(fishB.name);

    Shark(this);
  }

  @override
  onChosenFish(FishType type, String name, int time) {
    Map attempt = {};
    attempt["time"] = time;

    try {
      String chosenFishName = randomFish(listFishA);
      if (type == FishType.fishA) {
        randomFish(listFishB);
      }
      printRequest(name, chosenFishName);

      attempt["who"] = chosenFishName;
      Fish chosenFish = listFish[chosenFishName];

      if (chosenFish.onWill()) {
        printAccept(chosenFishName);
        attempt["response"] = "accept";
        FishType babyType = generateType();
        String newFishName = generateName(name, chosenFishName);
        Fish babyFish = Fish(
            aquariumInterface: this,
            type: babyType,
            parent: name + chosenFishName,
            name: newFishName,
            lifeTime: generateLifeTime());

        listFish[newFishName] = babyFish;
        if (babyType == FishType.fishA) {
          listFishA.add(newFishName);
        } else {
          listFishB.add(newFishName);
        }
        printBirth(babyType, newFishName);
        printAll(getSizeFish(), getSizeFishA());
      } else {
        printDecline(chosenFishName);
        attempt["response"] = "decline";
      }
      listFish[name].population.add(attempt);
    } catch (e) {
      printError(e);
    }
  }

  String randomFish(List<String> currentList) {
    return currentList[random.nextInt(currentList.length)];
  }

  @override
  onDead(FishType type, String name, String reason) {
    type == FishType.fishA ? listFishA.remove(name) : listFishB.remove(name);
    if (getSizeFishA() == 0 || getSizeFishB() == 0) {
      printExit();
    }
    listFish[name].reasonDead = reason;
    listFish.remove(name);
    printDead(name, reason);
    printAll(getSizeFish(), getSizeFishA());
  }

  int generateLifeTime() {
    if (listFish.length < 20) {
      return random.nextInt(40) + 20;
    }
    return random.nextInt(30) + 10;
  }

  @override
  getSizeFish() {
    return listFish.length;
  }

  @override
  getSizeFishA() {
    return listFishA.length;
  }

  @override
  List<String> getFishA() {
    return listFishA;
  }

  @override
  List<String> getFishB() {
    return listFishB;
  }

  @override
  Map<String, Fish> getFish() {
    return listFish;
  }

  @override
  getSizeFishB() {
    return listFishB.length;
  }
}
