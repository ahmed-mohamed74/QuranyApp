import 'package:hive/hive.dart';

part 'edafet_zekr_model.g.dart';

@HiveType(typeId: 0)
class EdafetZekrModel extends HiveObject {
  @HiveField(0)
  final String title;
  @HiveField(1)
  final String subTitle;
  @HiveField(2)
  final int? count;

  EdafetZekrModel({
    required this.title,
    required this.subTitle,
    this.count = 1,
  });
}
