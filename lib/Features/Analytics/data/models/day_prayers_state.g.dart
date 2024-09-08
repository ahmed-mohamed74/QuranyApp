// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'day_prayers_state.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class DayPrayerStateModelAdapter extends TypeAdapter<DayPrayerStateModel> {
  @override
  final int typeId = 0;

  @override
  DayPrayerStateModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return DayPrayerStateModel(
      date: fields[0] as DateTime,
      fajrState: fields[1] as PrayerStatus,
      dhuhrState: fields[2] as PrayerStatus,
      asrState: fields[3] as PrayerStatus,
      maghribState: fields[4] as PrayerStatus,
      ishaState: fields[5] as PrayerStatus,
    );
  }

  @override
  void write(BinaryWriter writer, DayPrayerStateModel obj) {
    writer
      ..writeByte(6)
      ..writeByte(0)
      ..write(obj.date)
      ..writeByte(1)
      ..write(obj.fajrState)
      ..writeByte(2)
      ..write(obj.dhuhrState)
      ..writeByte(3)
      ..write(obj.asrState)
      ..writeByte(4)
      ..write(obj.maghribState)
      ..writeByte(5)
      ..write(obj.ishaState);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is DayPrayerStateModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
