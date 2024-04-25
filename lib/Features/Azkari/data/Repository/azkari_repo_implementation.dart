import 'dart:convert';
import 'dart:isolate';

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
    //* handling decoding and mapping large json files in anew seperate
    //* thread than the ui main isolate thread

    final List<ZekrSectionModel> data = await Isolate.run(
      () {
        final List<dynamic> decodedFile =
            jsonDecode(undecodedFile) as List<dynamic>;

        return decodedFile.map(
          (singleZekrCategory) {
            return ZekrSectionModel.fromMap(
              singleZekrCategory.toMap(),
            );
          },
        ).toList();
      },
    );
    return data;
  }
}
