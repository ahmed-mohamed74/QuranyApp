import '../models/azkari_model.dart';

abstract class AzkariRepostory {
  Future<List<ZekrSectionModel>> loadZekrSections({required String path});
}
