import 'package:hive/hive.dart';
import 'package:libuta_sugbo_app/models/response_model.dart';

import '../helpers/hive_db_helper.dart';

part 'business_info_model.g.dart';

///HiveDB Annotation
///
/// This annotation is use for the hive_generator plugin to generate an adapter.
/// Type id must be unique and hive field indexes can start from 0-223.
@HiveType(typeId: 2)
class BusinessInfoModel {
  @HiveField(0)
  dynamic businessId;
  @HiveField(1)
  dynamic businessType;
  @HiveField(2)
  String? businessName;
  @HiveField(3)
  String? businessAddress;
  @HiveField(4)
  String? businessEmail;
  @HiveField(5)
  String? businessPhone;
  @HiveField(6)
  String? businessImage;
  @HiveField(7)
  String? ownerId;
  @HiveField(8)
  String? status;
  

  BusinessInfoModel({
    this.businessId,
    this.businessType,
    this.businessName,
    this.businessAddress,
    this.businessEmail,
    this.businessPhone,
    this.businessImage,
    this.ownerId,
    this.status,
  });

  BusinessInfoModel.fromJson(Map<String, dynamic> json)
      : businessId       = json['business']['business_id'],
        businessType     = json['business']['business_type'],
        businessName     = json['business']['business_name'],
        businessAddress  = json['business']['business_address'],
        businessEmail    = json['business']['business_email'],
        businessPhone    = json['business']['business_phone'],
        businessImage    = json['business']['business_image'],
        ownerId          = json['business']['owner_id'],
        status           = json['business']['status'];

  Map<String, dynamic> toJson() => {
        'business_id': businessId,
        'business_type': businessType,
        'business_name': businessName,
        'business_address': businessAddress,
        'business_email': businessEmail,
        'business_phone': businessPhone,
        'business_image': businessImage,
        'owner_id': ownerId,
        'status': status
      };
}

///User Box
///
/// This class handles the user data crud operation to box.
class BusinessInfoBox {

  Box get _businessInfoBox {
    return Hive.box(Boxes.businessInfoBox);
  }

  Future<void> insert(ResponseModel response) async {
    final data = BusinessInfoModel.fromJson(response.data);
    await _businessInfoBox.put(data.businessId, data);
  }

  Future<void> update(ResponseModel data) async {
    final item = BusinessInfoModel.fromJson(data.data);
    await _businessInfoBox.put(item.businessId, data);
  }

  BusinessInfoModel getSingleItemById(id) {
    return _businessInfoBox.values.where((b) => b.businessId == id).first;
  }

  BusinessInfoModel get data {
    return _businessInfoBox.getAt(0);
  }

  Future<void> clear() async {
    await _businessInfoBox.clear();
  }

  bool get isEmpty {
    return _businessInfoBox.isEmpty;
  }
}
