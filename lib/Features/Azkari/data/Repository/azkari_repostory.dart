import '../models/azkari_model.dart';

abstract class AzkariRepostory {
  Future<List<ZekrSectionModel>> readAzkarCategories({required String path});
}
