// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserModelAdapter extends TypeAdapter<UserModel> {
  @override
  final int typeId = 0;

  @override
  UserModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserModel(
      nama: fields[0] as String,
      email: fields[1] as String,
      hieght: fields[2] as String,
      weight: fields[3] as String,
      dob: fields[4] as String,
      pob: fields[5] as String,
      gender: fields[6] as String,
    );
  }

  @override
  void write(BinaryWriter writer, UserModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.nama)
      ..writeByte(1)
      ..write(obj.email)
      ..writeByte(2)
      ..write(obj.hieght)
      ..writeByte(3)
      ..write(obj.weight)
      ..writeByte(4)
      ..write(obj.dob)
      ..writeByte(5)
      ..write(obj.pob)
      ..writeByte(6)
      ..write(obj.gender);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
