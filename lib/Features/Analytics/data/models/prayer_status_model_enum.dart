import 'package:hive/hive.dart';
part 'prayer_status_model_enum.g.dart';

@HiveType(typeId: 2)
enum PrayerStatus {
  @HiveField(0)
  none,
  @HiveField(1)
  notPrayed,
  @HiveField(2)
  late,
  @HiveField(3)
  onJamaah,
  @HiveField(4)
  onTime, // The prayer was performed on time.
}