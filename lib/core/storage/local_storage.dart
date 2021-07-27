import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';

const String kUserBoxName = 'userBox';
const String kUser = 'userr';
const String kToken = 'token';

class AppCache {
  static Future<void> init() async {
    await Hive.initFlutter();
    await Hive.openBox<dynamic>(kUserBoxName);
  }

  static Box<dynamic> get _box => Hive.box<dynamic>(kUserBoxName);

  String a = '';

  static void saveTimeZone(String token) {
    if (token == null) {
      return;
    }
    _box.put(kToken, token);
  }

  static String getTimeZone() {
    final String data = _box.get(kToken) as String;
    return data;
  }



  static void clear() {
    _box.clear();
  }

  static void clean(String key) {
    _box.delete(key);
  }
}
