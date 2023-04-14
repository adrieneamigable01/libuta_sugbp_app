// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class UserInfoModelAdapter extends TypeAdapter<UserInfoModel> {
  @override
  final int typeId = 1;

  @override
  UserInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return UserInfoModel(
      userInfoId: fields[6] as dynamic,
      lastname: fields[1] as dynamic,
      middlename: fields[2] as String?,
      firstname: fields[3] as String?,
      mobile: fields[4] as String?,
      email: fields[5] as String?,
    )..userId = fields[0] as dynamic;
  }

  @override
  void write(BinaryWriter writer, UserInfoModel obj) {
    writer
      ..writeByte(7)
      ..writeByte(0)
      ..write(obj.userId)
      ..writeByte(1)
      ..write(obj.lastname)
      ..writeByte(2)
      ..write(obj.middlename)
      ..writeByte(3)
      ..write(obj.firstname)
      ..writeByte(4)
      ..write(obj.mobile)
      ..writeByte(5)
      ..write(obj.email)
      ..writeByte(6)
      ..write(obj.userInfoId);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is UserInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
