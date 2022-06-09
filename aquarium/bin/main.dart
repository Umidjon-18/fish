import 'package:hive/hive.dart';

import 'aquarium.dart';

void main(List<String> args) {
  Hive.init("./src");
  Aquarium().onStart();
}
