import 'dart:convert';

import 'zekr_model.dart';

class ZekrSectionModel {
  final String category;
  final int id;
  final List<ZekrModel> array;

  ZekrSectionModel({
    required this.category,
    required this.id,
    required this.array,
  });

  ZekrSectionModel copyWith({
    String? category,
    int? id,
    List<ZekrModel>? array,
  }) {
    return ZekrSectionModel(
      category: category ?? this.category,
      id: id ?? this.id,
      array: array ?? this.array,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'category': category,
      'id': id,
      'array': array.map((x) => x.toMap()).toList(),
    };
  }

  factory ZekrSectionModel.fromMap(Map<String, dynamic> map) {
    return ZekrSectionModel(
      category: map['category'] ?? '',
      id: map['id']?.toInt() ?? 0,
      array:
          List<ZekrModel>.from(map['array']?.map((x) => ZekrModel.fromMap(x))),
    );
  }

  String toJson() => json.encode(toMap());

  factory ZekrSectionModel.fromJson(String source) =>
      ZekrSectionModel.fromMap(json.decode(source));
}

