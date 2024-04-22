// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'edafet_zekr_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class EdafetZekrModelAdapter extends TypeAdapter<EdafetZekrModel> {
  @override
  final int typeId = 0;

  @override
  EdafetZekrModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return EdafetZekrModel(
      title: fields[0] as String,
      subTitle: fields[1] as String,
      count: fields[2] as int?,
    );
  }

  @override
  void write(BinaryWriter writer, EdafetZekrModel obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.title)
      ..writeByte(1)
      ..write(obj.subTitle)
      ..writeByte(2)
      ..write(obj.count);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is EdafetZekrModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
