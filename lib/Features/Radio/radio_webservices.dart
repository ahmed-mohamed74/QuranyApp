import '../../core/Api/api_constants.dart';
import '../../core/Api/dio_web_services.dart';

class RadioWebSerices {
  final DioWebServices dioWebServices;

  RadioWebSerices({required this.dioWebServices});

  Future<List<dynamic>> getAllRadioStations() async {
    final response = await dioWebServices.get(ApiConstants.radioUrl);
    return response[ApiConstants.radioKey];
  }
}

class RadioModel {
  final int id;
  final int name;
  final String url;
  final String img;

  RadioModel({
    required this.id,
    required this.name,
    required this.url,
    required this.img,
  });

  RadioModel copyWith({
    int? id,
    int? name,
    String? url,
    String? img,
  }) {
    return RadioModel(
      id: id ?? this.id,
      name: name ?? this.name,
      url: url ?? this.url,
      img: img ?? this.img,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'url': url,
      'img': img,
    };
  }

  factory RadioModel.fromMap(Map<String, dynamic> map) {
    return RadioModel(
      id: map['id']?.toInt() ?? 0,
      name: map['name']?.toInt() ?? 0,
      url: map['url'] ?? '',
      img: map['img'] ?? '',
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is RadioModel &&
        other.id == id &&
        other.name == name &&
        other.url == url &&
        other.img == img;
  }

  @override
  int get hashCode {
    return id.hashCode ^ name.hashCode ^ url.hashCode ^ img.hashCode;
  }
}
