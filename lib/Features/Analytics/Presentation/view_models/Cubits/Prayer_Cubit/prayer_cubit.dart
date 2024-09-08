import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:qurany_analytics_app/models/day_prayers_state.dart';

import '../constants.dart';

part 'prayer_state.dart';

class PrayerCubit extends Cubit<PrayerState> {
  PrayerCubit() : super(PrayerState(dateTime: DateTime.now()));

  final fajrCheckBoxState = PrayerCardStateModel(prayerName: PrayerName.Fajr);

  final dhuhrCheckBoxState = PrayerCardStateModel(prayerName: PrayerName.Dhuhr);

  final asrCheckBoxState = PrayerCardStateModel(prayerName: PrayerName.Asr);

  final maghribCheckBoxState =
      PrayerCardStateModel(prayerName: PrayerName.Maghrib);

  final ishaCheckBoxState = PrayerCardStateModel(prayerName: PrayerName.Isha);

  void onDayChanged(selectedDate) {
    emit(state.copyWith(dateTime: selectedDate));
    debugPrint(
      '*** on changed function in cubit: ${state.dateTime.toString()}'
      ' selected date: $selectedDate',
    );
  }

  DayPrayerStateModel? getPrayerDataForSelectedDate(
      DateTime userSelectedDate) {
    var box = Hive.box<DayPrayerStateModel>(kDayPrayerStateBox);
    var data = box.values.where((element) =>
        element.date.month == userSelectedDate.month &&
        element.date.day == userSelectedDate.day);
    if (data.isNotEmpty) {
      return data.first;
    }else{
      return null;
    }
  }

  Future<void> setDayPrayerStatesData() async {
    DayPrayerStateModel dayPrayerStateModel = DayPrayerStateModel(
      date: state.dateTime,
      fajrState: fajrCheckBoxState.prayerStateValue,
      dhuhrState: dhuhrCheckBoxState.prayerStateValue,
      asrState: asrCheckBoxState.prayerStateValue,
      maghribState: maghribCheckBoxState.prayerStateValue,
      ishaState: ishaCheckBoxState.prayerStateValue,
    );
    final box = Hive.box<DayPrayerStateModel>(kDayPrayerStateBox);
    await box.add(dayPrayerStateModel);
  }

  Future<void> updatePrayerState() async {
    final box = Hive.box<DayPrayerStateModel>(kDayPrayerStateBox);
    final existingData = box.values.where((dayPrayerState) {
      return dayPrayerState.date.month == state.dateTime.month &&
          dayPrayerState.date.day == state.dateTime.day;
    }).toList();
    if (existingData.isNotEmpty) {
      final dataToBeUpdated = existingData.first;
      dataToBeUpdated.updateWith(
        fajrState: fajrCheckBoxState.prayerStateValue,
        dhuhrState: dhuhrCheckBoxState.prayerStateValue,
        asrState: asrCheckBoxState.prayerStateValue,
        maghribState: maghribCheckBoxState.prayerStateValue,
        ishaState: ishaCheckBoxState.prayerStateValue,
      );
    } else {
      setDayPrayerStatesData();
    }
  }


}
