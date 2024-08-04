import 'dart:convert';
import 'dart:isolate';

import '../local_json_services.dart';
import '../models/zekr_section_model.dart';
import 'hsn_muslim_base_repostory.dart';

class HsnMuslimRepostoryImplementation extends BaseHsnMuslimRepostory {
  final LocalJsonDataServices localJsonData;

  HsnMuslimRepostoryImplementation({required this.localJsonData});

  @override
  Future<List<ZekrSectionModel>> readAzkarCategories(
      {required String path}) async {
    final String undecodedFile =
        await localJsonData.loadFileByRootBundle(path: path);

    // Use Isolate.run handling decoding and mapping large json files in a new seperate isolate
    final List<ZekrSectionModel> data = await Isolate.run(
      () {
        final decodedFile = jsonDecode(undecodedFile) as List<dynamic>;
        final List<ZekrSectionModel> mappedData =
            decodedFile.map<ZekrSectionModel>(
          (singleZekrCategory) {
            return ZekrSectionModel.fromMap(singleZekrCategory);
          },
        ).toList();
        return mappedData;
      },
    );

    return data;
    // final decodedFile = jsonDecode(undecodedFile) as List<dynamic>;

    // final List<ZekrSectionModel> data = decodedFile.map<ZekrSectionModel>(
    //   (singleZekrCategory) {
    //     return ZekrSectionModel.fromMap(
    //       singleZekrCategory,
    //     );
    //   },
    // ).toList();
    // return data;
  }
}
