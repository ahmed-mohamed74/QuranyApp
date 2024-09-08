import 'package:hive/hive.dart';

import 'prayer_status_model_enum.dart';
part 'day_prayers_state.g.dart';



enum PrayerName {
  Fajr, // Fajr: The dawn prayer
  Dhuhr, // Dhuhr: The midday prayer
  Asr, // Asr: The afternoon prayer
  Maghrib, // Maghrib: The evening prayer
  Isha, // Isha: The night prayer
}

@HiveType(typeId: 0)
class DayPrayerStateModel extends HiveObject {
  @HiveField(0)
  DateTime date;

  @HiveField(1)
  PrayerStatus fajrState;

  @HiveField(2)
  PrayerStatus dhuhrState;

  @HiveField(3)
  PrayerStatus asrState;

  @HiveField(4)
  PrayerStatus maghribState;

  @HiveField(5)
  PrayerStatus ishaState;

  DayPrayerStateModel({
    required this.date,
    this.fajrState = PrayerStatus.none,
    this.dhuhrState = PrayerStatus.none,
    this.asrState = PrayerStatus.none,
    this.maghribState = PrayerStatus.none,
    this.ishaState = PrayerStatus.none,
  });

  // Method to update fields
  void updateWith({
    DateTime? date,
    PrayerStatus? fajrState,
    PrayerStatus? dhuhrState,
    PrayerStatus? asrState,
    PrayerStatus? maghribState,
    PrayerStatus? ishaState,
  }) {
    this.date = date ?? this.date;
    this.fajrState = fajrState ?? this.fajrState;
    this.dhuhrState = dhuhrState ?? this.dhuhrState;
    this.asrState = asrState ?? this.asrState;
    this.maghribState = maghribState ?? this.maghribState;
    this.ishaState = ishaState ?? this.ishaState;

    // Save the changes to the Hive database
    save();
  }
}

class PrayerCardStateModel {
  final PrayerName prayerName;
  PrayerStatus prayerStateValue;

  PrayerCardStateModel(
      {required this.prayerName, this.prayerStateValue = PrayerStatus.none});
}