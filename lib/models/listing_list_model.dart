import 'package:hive/hive.dart';
import 'package:libuta_sugbo_app/models/response_model.dart';
import 'package:libuta_sugbo_app/models/user_model.dart';

import '../helpers/hive_db_helper.dart';

part 'listing_list_model.g.dart';

///HiveDB Annotation
///
/// This annotation is use for the hive_generator plugin to generate an adapter.
/// Type id must be unique and hive field indexes can start from 0-223.
@HiveType(typeId: 3)
class ListingListModel {
  @HiveField(0)
  dynamic listingId;
  @HiveField(1)
  dynamic listingName;
  @HiveField(2)
  String? listingType;
  @HiveField(3)
  String? vehicleName;
  @HiveField(4)
  String? accomodation;
  @HiveField(5)
  String? quantity;
  @HiveField(6)
  String? price;
  @HiveField(7)
  String? capacity;
  @HiveField(8)
  String? bookingType;
  @HiveField(9)
  String? description;
  @HiveField(10)
  String? businessId;
  @HiveField(11)
  String? ownerId;
  @HiveField(12)
  String? status;
  @HiveField(13)
  String? dateAdded;
  @HiveField(14)
  String? isActive;
   @HiveField(15)
  String? images;

  

  ListingListModel({
    this.listingId,
    this.listingName,
    this.listingType,
    this.vehicleName,
    this.accomodation,
    this.quantity,
    this.price,
    this.capacity,
    this.bookingType,
    this.description,
    this.businessId,
    this.ownerId,
    this.status,
    this.dateAdded,
    this.isActive,
    this.images
  });

  ListingListModel.fromJson(Map<String, dynamic> json)
      : listingId         = json['listing_id'],
        listingName       = json['listing_name'],
        listingType       = json['listing_type'],
        vehicleName       = json['vehicle_name'],
        accomodation      = json['accomodation'],
        quantity          = json['quantity'],
        price             = json['price'],
        capacity          = json['capacity'],
        bookingType       = json['booking_type'],
        description       = json['description'],
        businessId        = json['business_id'],
        ownerId           = json['owner_id'],
        status            = json['status'],
        dateAdded         = json['date_added'],
        isActive          = json['is_active'],
        images            = json['images'];

  Map<String, dynamic> toJson() => {
        'listingId':listingId,
        'listingName':listingName,
        'listingType':listingType,
        'vehicleName':vehicleName,
        'accomodation':accomodation,
        'quantity':quantity,
        'price':price,
        'capacity':capacity,
        'booking_type':bookingType,
        'description':description,
        'businessId':businessId,
        'ownerId':ownerId,
        'status':status,
        'dateAdded':dateAdded,
        'isActive':isActive,
        'images':images,
      };
}

///User Box
///
/// This class handles the user data crud operation to box.
class ListingListBox {

  Box get _box {
    return Hive.box(Boxes.listingListBox);
  }

  /// Inserts a list of records to box
  Future<void> insertAll(ResponseModel response) async {
    response.data.forEach((element) async {
      final data = ListingListModel.fromJson(element);
      await _box.put(data.listingId, data);
    });
  }

  Future<void> insert(ResponseModel response) async {
    final data = ListingListModel.fromJson(response.data);
    await _box.put(data.listingId, data);
  }

  Future<void> update(ResponseModel data) async {
    final item = ListingListModel.fromJson(data.data);
    await _box.put(item.listingId, data);
  }

  ListingListModel getSingleItemById(id) {
    return _box.values.where((b) => b.listingId == id).first;
  }

  List<ListingListModel> get recordsByUser {
    dynamic userId = UserBox().userData.userId;
    return _box.values
    .where((element) => element.ownerId.toString() == userId.toString()  )
    .cast<ListingListModel>().toList();
  }

  ListingListModel get data {
    return _box.getAt(0);
  }

  Future<void> clear() async {
    await _box.clear();
  }

  bool get isEmpty {
    return _box.isEmpty;
  }
}
