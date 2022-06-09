import 'package:hive/hive.dart';

import 'aquarium.dart';
import 'fish.dart';

void main(List<String> args) {
  Hive.init("./hive_db");
  Hive.registerAdapter(FishAdapter());
  Aquarium().onStart();
}
