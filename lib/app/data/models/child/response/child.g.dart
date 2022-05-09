// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'child.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ChildAdapter extends TypeAdapter<Child> {
  @override
  final int typeId = 2;

  @override
  Child read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return Child(
      id: fields[0] as String?,
      fullName: fields[1] as String?,
      birthDate: fields[2] as String?,
      gender: fields[3] as String?,
      motherName: fields[4] as String?,
      fatherName: fields[5] as String?,
      fatherBirthday: fields[6] as String?,
      motherBirthday: fields[7] as String?,
      photo: fields[8] as String?,
      perkembangan: (fields[9] as List?)?.cast<Perkembangan>(),
    );
  }

  @override
  void write(BinaryWriter writer, Child obj) {
    writer
      ..writeByte(10)
      ..writeByte(0)
      ..write(obj.id)
      ..writeByte(1)
      ..write(obj.fullName)
      ..writeByte(2)
      ..write(obj.birthDate)
      ..writeByte(3)
      ..write(obj.gender)
      ..writeByte(4)
      ..write(obj.motherName)
      ..writeByte(5)
      ..write(obj.fatherName)
      ..writeByte(6)
      ..write(obj.fatherBirthday)
      ..writeByte(7)
      ..write(obj.motherBirthday)
      ..writeByte(8)
      ..write(obj.photo)
      ..writeByte(9)
      ..write(obj.perkembangan);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ChildAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
