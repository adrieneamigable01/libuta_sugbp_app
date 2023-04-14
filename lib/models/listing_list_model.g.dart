// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'listing_list_model.dart';

// **************************************************************************
// TypeAdapterGenerator
// **************************************************************************

class ListingListModelAdapter extends TypeAdapter<ListingListModel> {
  @override
  final int typeId = 3;

  @override
  ListingListModel read(BinaryReader reader) {
    final numOfFields = reader.readByte();
    final fields = <int, dynamic>{
      for (int i = 0; i < numOfFields; i++) reader.readByte(): reader.read(),
    };
    return ListingListModel(
      listingId: fields[0] as dynamic,
      listingName: fields[1] as dynamic,
      listingType: fields[2] as String?,
      vehicleName: fields[3] as String?,
      accomodation: fields[4] as String?,
      quantity: fields[5] as String?,
      price: fields[6] as String?,
      capacity: fields[7] as String?,
      bookingType: fields[8] as String?,
      description: fields[9] as String?,
      businessId: fields[10] as String?,
      ownerId: fields[11] as String?,
      status: fields[12] as String?,
      dateAdded: fields[13] as String?,
      isActive: fields[14] as String?,
      images: fields[15] as String?,
    );
  }

  @override
  void write(BinaryWriter writer, ListingListModel obj) {
    writer
      ..writeByte(16)
      ..writeByte(0)
      ..write(obj.listingId)
      ..writeByte(1)
      ..write(obj.listingName)
      ..writeByte(2)
      ..write(obj.listingType)
      ..writeByte(3)
      ..write(obj.vehicleName)
      ..writeByte(4)
      ..write(obj.accomodation)
      ..writeByte(5)
      ..write(obj.quantity)
      ..writeByte(6)
      ..write(obj.price)
      ..writeByte(7)
      ..write(obj.capacity)
      ..writeByte(8)
      ..write(obj.bookingType)
      ..writeByte(9)
      ..write(obj.description)
      ..writeByte(10)
      ..write(obj.businessId)
      ..writeByte(11)
      ..write(obj.ownerId)
      ..writeByte(12)
      ..write(obj.status)
      ..writeByte(13)
      ..write(obj.dateAdded)
      ..writeByte(14)
      ..write(obj.isActive)
      ..writeByte(15)
      ..write(obj.images);
  }

  @override
  int get hashCode => typeId.hashCode;

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is ListingListModelAdapter &&
          runtimeType == other.runtimeType &&
          typeId == other.typeId;
}
