import 'package:flutter/services.dart';

class LocalJsonDataServices {
  Future<String> loadFileByRootBundle({required String path}) async {
    return await rootBundle.loadString(path);
  }
}
