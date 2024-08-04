import 'package:equatable/equatable.dart';

import 'zekr_model.dart';

class ZekrSectionModel extends Equatable {
  final String category;
  final int id;
  final List<ZekrModel> array;
  final String image;

  const ZekrSectionModel({
    required this.category,
    required this.id,
    required this.image,
    required this.array,
  });

  ZekrSectionModel copyWith({
    String? category,
    int? id,
    String? image,
    List<ZekrModel>? array,
  }) {
    return ZekrSectionModel(
      category: category ?? this.category,
      id: id ?? this.id,
      image: image ?? this.image,
      array: array ?? this.array,
    );
  }

  @override
  List<Object?> get props => [category, id, image, array];

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'id': id,
      'image': image,
      'array': array.map((x) => x.toMap()).toList(),
    };
  }

  factory ZekrSectionModel.fromMap(Map<String, dynamic> map) {
    return ZekrSectionModel(
      category: map['category'] ?? '',
      id: map['id']?.toInt() ?? 0,
      image: map['image'] ?? '',
      array:
          List<ZekrModel>.from(map['array']?.map((x) => ZekrModel.fromMap(x))),
    );
  }
}
