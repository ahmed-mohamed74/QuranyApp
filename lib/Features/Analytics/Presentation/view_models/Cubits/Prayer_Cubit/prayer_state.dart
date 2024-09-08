part of 'prayer_cubit.dart';

@immutable
class PrayerState {
  final DateTime dateTime;

  const PrayerState({required this.dateTime});

  PrayerState copyWith({
    DateTime? dateTime, // Make dateTime nullable for flexibility
  }) {
    return PrayerState(dateTime: dateTime ?? DateTime.now());
  }
}

class AddPrayerStateSuccess extends PrayerState {
  const AddPrayerStateSuccess({
    required super.dateTime,
    required this.dayPrayerStatesData,
  });

  final List<DayPrayerStateModel> dayPrayerStatesData;
}

class AddPrayerStateFailure extends PrayerState {
  const AddPrayerStateFailure({
    required super.dateTime,
    required this.errMessage,
  });

  final String errMessage;
}
