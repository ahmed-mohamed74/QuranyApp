import '../models/zekr_section_model.dart';

abstract class BaseHsnMuslimRepostory {
  Future<List<ZekrSectionModel>> readAzkarCategories({required String path});
}
