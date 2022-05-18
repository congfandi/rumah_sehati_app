// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'kms.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class KmsAdapter extends TypeAdapter<Kms> {
  @override
  final int typeId = 1;

  @override
  Kms read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Kms(
      gender: fields[0] as String?,
      birthDate: fields[1] as String?,
      posyanduDate: fields[2] as String?,
      weight: fields[3] as double?,
      asi: fields[4] as String?,
      createdAt: fields[5] as String?,
      usia: fields[7] as int?,
    )..id = fields[6] as int?;
  }

  @override
  void write(BinaryWriter writer, Kms obj) {
    writer
      ..writeByte(8)
      ..writeByte(0)
      ..write(obj.gender)
      ..writeByte(1)
      ..write(obj.birthDate)
      ..writeByte(2)
      ..write(obj.posyanduDate)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.asi)
      ..writeByte(5)
      ..write(obj.createdAt)
      ..writeByte(6)
      ..write(obj.id)
      ..writeByte(7)
      ..write(obj.usia);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is KmsAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
