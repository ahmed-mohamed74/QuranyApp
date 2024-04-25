import 'radio_webservices.dart';

class RadioRepostoryImpl {
  final RadioWebSerices webSerices;

  RadioRepostoryImpl({required this.webSerices});
  Future<List<RadioModel>> getAllRadioStations() async {
    final response = await webSerices.getAllRadioStations() as List<RadioModel>;

    return response.map<RadioModel>((oneSingleRadio) {
      return RadioModel.fromMap(
        oneSingleRadio.toMap(),
      );
    }).toList();
  }
}
