import 'dart:convert';
import 'dart:isolate';

import '../local_json_services.dart';
import '../models/azkari_model.dart';
import 'azkari_repostory.dart';

class AzkariRepostoryImplementation extends AzkariRepostory {
  final LocalJsonDataServices localJsonData;

  AzkariRepostoryImplementation({required this.localJsonData});

  @override
  Future<List<ZekrSectionModel>> readAzkarCategories(
      {required String path}) async {
    final String undecodedFile =
        await localJsonData.loadFileByRootBundle(path: path);
    //* handling decoding and mapping large json files in anew seperate
    //* thread than the ui main isolate thread
    final decodedFile =
            jsonDecode(undecodedFile) as List<dynamic>;
    final List<ZekrSectionModel> data = decodedFile.map<ZekrSectionModel>(
          (singleZekrCategory) {
            return ZekrSectionModel.fromMap(
          singleZekrCategory,
            );
          },
    ).toList();
    return data;
  }
}
