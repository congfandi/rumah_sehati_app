// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'perkembangan.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class PerkembanganAdapter extends TypeAdapter<Perkembangan> {
  @override
  final int typeId = 3;

  @override
  Perkembangan read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Perkembangan(
      weight: fields[0] as double?,
      height: fields[1] as double?,
      measuringDate: fields[2] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, Perkembangan obj) {
    writer
      ..writeByte(3)
      ..writeByte(0)
      ..write(obj.weight)
      ..writeByte(1)
      ..write(obj.height)
      ..writeByte(2)
      ..write(obj.measuringDate);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PerkembanganAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
