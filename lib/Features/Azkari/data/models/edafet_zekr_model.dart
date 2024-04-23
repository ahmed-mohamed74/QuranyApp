import 'package:flutter/widgets.dart';
import 'package:hive/hive.dart';

part 'edafet_zekr_model.g.dart';

@HiveType(typeId: 0)
class EdafetZekrModel extends HiveObject {
  @HiveField(0)
  String title;
  @HiveField(1)
  String content;
  @HiveField(2)
  int? count;
  @HiveField(3)

  EdafetZekrModel({
    required this.title,
    required this.content,
    this.count = 1,
  });

  EdafetZekrModel copyWith({
    String? title,
    String? content,
    ValueGetter<int?>? count,
    int? id,
  }) {
    return EdafetZekrModel(
      title: title ?? this.title,
      content: content ?? this.content,
      count: count != null ? count() : this.count,
    );
  }

  void updateWith({
    String? title,
    String? content,
    int? count,
  }) {
    this.title = title ?? this.title;
    this.content = content ?? this.content;
    this.count = count ?? this.count;
    // Save the changes to the Hive database
    save();
  }
}
