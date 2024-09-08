// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'prayer_status_model_enum.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PrayerStatusAdapter extends TypeAdapter<PrayerStatus> {
  @override
  final int typeId = 2;

  @override
  PrayerStatus read(BinaryReader reader) {
    switch (reader.readByte()) {
      case 0:
        return PrayerStatus.none;
      case 1:
        return PrayerStatus.notPrayed;
      case 2:
        return PrayerStatus.late;
      case 3:
        return PrayerStatus.onJamaah;
      case 4:
        return PrayerStatus.onTime;
      default:
        return PrayerStatus.none;
    }
  }

  @override
  void write(BinaryWriter writer, PrayerStatus obj) {
    switch (obj) {
      case PrayerStatus.none:
        writer.writeByte(0);
        break;
      case PrayerStatus.notPrayed:
        writer.writeByte(1);
        break;
      case PrayerStatus.late:
        writer.writeByte(2);
        break;
      case PrayerStatus.onJamaah:
        writer.writeByte(3);
        break;
      case PrayerStatus.onTime:
        writer.writeByte(4);
        break;
    }
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PrayerStatusAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
