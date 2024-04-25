class ZekrModel {
  final int id;
  final String text;
  final int count;

  ZekrModel({
    required this.id,
    required this.text,
    required this.count,
  });

  ZekrModel copyWith({
    int? id,
    String? text,
    int? count,
  }) {
    return ZekrModel(
      id: id ?? this.id,
      text: text ?? this.text,
      count: count ?? this.count,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'text': text,
      'count': count,
    };
  }

  factory ZekrModel.fromMap(Map<String, dynamic> map) {
    return ZekrModel(
      id: map['id']?.toInt() ?? 0,
      text: map['text'] ?? '',
      count: map['count']?.toInt() ?? 0,
    );
  }
}
