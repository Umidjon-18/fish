import 'package:hive/hive.dart';

mixin HiveUtil {
  Future<T> addAllToBox<T>(String boxname, List<T> data) async {
    LazyBox<List<T>> box = await checkBox(boxname);
    var future = box.add(data);
    await future;
  }

  Future<LazyBox<T>> checkBox<T>(String boxname) async {
    if (Hive.isBoxOpen(boxname)) {
      return Hive.lazyBox<T>(boxname);
    }
    return Future<LazyBox<T>>.value(Hive.openLazyBox<T>(boxname));
  }

  Future<LazyBox<T>> getAllBox<T>(String boxname) async {
    LazyBox<T> box = await checkBox(boxname);
    return Future<LazyBox<T>>.value(box);
  }

  // closeBox<T>(String boxname) async {
  //   if (Hive.isBoxOpen(boxname)) {
  //     await Hive.lazyBox<T>(boxname).close();
  //   }
  // }
}
