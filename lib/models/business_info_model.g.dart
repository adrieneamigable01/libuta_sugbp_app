// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_info_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class BusinessInfoModelAdapter extends TypeAdapter<BusinessInfoModel> {
  @override
  final int typeId = 2;

  @override
  BusinessInfoModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return BusinessInfoModel(
      businessId: fields[0] as dynamic,
      businessType: fields[1] as dynamic,
      businessName: fields[2] as String?,
      businessAddress: fields[3] as String?,
      businessEmail: fields[4] as String?,
      businessPhone: fields[5] as String?,
      businessImage: fields[6] as String?,
      ownerId: fields[7] as String?,
      status: fields[8] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, BusinessInfoModel obj) {
    writer
      ..writeByte(9)
      ..writeByte(0)
      ..write(obj.businessId)
      ..writeByte(1)
      ..write(obj.businessType)
      ..writeByte(2)
      ..write(obj.businessName)
      ..writeByte(3)
      ..write(obj.businessAddress)
      ..writeByte(4)
      ..write(obj.businessEmail)
      ..writeByte(5)
      ..write(obj.businessPhone)
      ..writeByte(6)
      ..write(obj.businessImage)
      ..writeByte(7)
      ..write(obj.ownerId)
      ..writeByte(8)
      ..write(obj.status);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is BusinessInfoModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
