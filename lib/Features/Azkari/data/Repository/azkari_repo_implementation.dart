import 'dart:convert';

import '../local_json_services.dart';
import '../models/azkari_model.dart';
import 'azkari_repostory.dart';

class AzkariRepostoryImplementation extends AzkariRepostory {
  final LocalJsonDataServices localJsonData;

  AzkariRepostoryImplementation({required this.localJsonData});

  @override
  Future<List<ZekrSectionModel>> loadZekrSections(
      {required String path}) async {
    final String undecodedFile =
        await localJsonData.loadFileByRootBundle(path: path);
    final List<dynamic> decodedFile =
        jsonDecode(undecodedFile) as List<dynamic>;

    return decodedFile.map(
      (singleZekrCategory) {
        return ZekrSectionModel.fromMap(
          singleZekrCategory.toMap(),
        );
      },
    ).toList();
  }
}
