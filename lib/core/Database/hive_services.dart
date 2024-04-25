import 'package:hive_flutter/adapters.dart';

class HiveServices {
  Box? _box;

  Future<void> initHiveFlutter() async {
    await Hive.initFlutter();
  }

  Future<void> openBox(String boxName) async {
    if (_box == null || !_box!.isOpen) {
      _box = await Hive.openBox(boxName);
    }
  }

  Future<void> insertData(String key, dynamic value) async {
    await _checkBox();
    await _box!.put(key, value);
  }

  Future<dynamic> getData(String key) async {
    await _checkBox();
    return _box!.get(key);
  }

  Future<void> updateData(String key, dynamic value) async {
    await _checkBox();
    if (_box!.containsKey(key)) {
      await _box!.put(key, value);
    } else {
      throw Exception('Key $key does not exist.');
    }
  }

  Future<void> deleteData(String key) async {
    await _checkBox();
    await _box!.delete(key);
  }

  Future<void> closeBox() async {
    if (_box != null && _box!.isOpen) {
      await _box!.close();
      _box = null;
    }
  }

  Future<void> _checkBox() async {
    if (_box == null || !_box!.isOpen) {
      throw Exception('Hive box not opened. Call openBox() first.');
    }
  }
}
