import 'fish.dart';
import 'fish_type/fishType.dart';
import 'interfaces/aquariumInterface.dart';
import 'shark.dart';
import 'utils/util.dart';

class Aquarium with Util, Shark implements AquariumInterface {
  Map<String, Fish> listFish = {};
  List<String> listFishA = [];
  List<String> listFishB = [];
  int countDead = 0;

  onStart() {
    Fish fishA = Fish(FishType.fishA, "aaaaaaaaa", generateLifeTime(), this);
    Fish fishB = Fish(FishType.fishB, "bbbbbbbbb", generateLifeTime(), this);

    listFish[fishA.name] = fishA;
    listFish[fishB.name] = fishB;

    listFishA.add(fishA.name);
    listFishB.add(fishB.name);
  }

  @override
  onChosenFish(FishType type, String name) {
    try {
      String chosenFishName = (type == FishType.fishA)
          ? randomFish(listFishB)
          : randomFish(listFishA);
      printRequest(name, chosenFishName);
      Fish? chosenFish = listFish[chosenFishName];

      if (chosenFish!.onWill()) {
        printAccept(chosenFishName);

        FishType babyType = generateType();
        String newFishName = generateName(name, chosenFishName);
        Fish babyFish = Fish(babyType, newFishName, generateLifeTime(), this);

        listFish[newFishName] = babyFish;
        babyType == FishType.fishA
            ? listFishA.add(newFishName)
            : listFishB.add(newFishName);
        printBirth(babyType, newFishName);
        printAll(getSizeFish(), getSizeFishA());
        checking(getSizeFish());
      } else {
        printDecline(chosenFishName);
      }
    } catch (e) {
      printError(e);
    }
  }

  randomFish(List<String> currentList) {
    return currentList[random.nextInt(currentList.length)];
  }

  @override
  onDead(FishType type, String name, String reason) {
    type == FishType.fishA ? listFishA.remove(name) : listFishB.remove(name);
    listFish.remove(name);
    printDead(name, reason);
    printAll(getSizeFish(), getSizeFishA());
  }

  int generateLifeTime() {
    if (listFish.length < 20) {
      return random.nextInt(40) + 20;
    } else {
      return random.nextInt(30) + 10;
    }
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
  getSizeFishB() {
    return listFishB.length;
  }

  @override
  checking(int amount) {
    if (amount > 21) {
      Fish? victim = listFish[killing(listFishA, listFishB)];
      victim!.onDead("Shark killed 🦈");
    }
  }
}
