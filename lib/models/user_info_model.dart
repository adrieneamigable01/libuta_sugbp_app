import 'package:hive/hive.dart';
import 'package:libuta_sugbo_app/models/response_model.dart';

import '../helpers/hive_db_helper.dart';

part 'user_info_model.g.dart';

///HiveDB Annotation
///
/// This annotation is use for the hive_generator plugin to generate an adapter.
/// Type id must be unique and hive field indexes can start from 0-223.
@HiveType(typeId: 1)
class UserInfoModel {
  @HiveField(0)
  dynamic userId;
  @HiveField(1)
  dynamic lastname;
  @HiveField(2)
  String? middlename;
  @HiveField(3)
  String? firstname;
  @HiveField(4)
  String? mobile;
  @HiveField(5)
  String? email;
  @HiveField(6)
  dynamic userInfoId;

  UserInfoModel({
    this.userInfoId,
    this.lastname,
    this.middlename,
    this.firstname,
    this.mobile,
    this.email
  });

  UserInfoModel.fromJson(Map<String, dynamic> json)
      : userId  = json['user_info']['user_id'],
        userInfoId = json['user_info']['user_info_id'],
        lastname = json['user_info']['lastname'],
        middlename = json['user_info']['middlename'],
        firstname = json['user_info']['firstname'],
        mobile = json['user_info']['mobile'],
        email = json['user_info']['email'];

  Map<String, dynamic> toJson() => {
        'userId':userId,
        'userInfoId': userInfoId,
        'lastname': lastname,
        'middlename': middlename,
        'firstname': firstname,
        'mobile': mobile,
        'email': email
      };
}

///User Box
///
/// This class handles the user data crud operation to box.
class UserInfoBox {

  Box get _userInfoBox {
    return Hive.box(Boxes.userInfoBox);
  }

  Future<void> insert(ResponseModel response) async {
    final data = UserInfoModel.fromJson(response.data);
    await _userInfoBox.put(data.userInfoId, data);
  }

  Future<void> update(ResponseModel data) async {
    final item = UserInfoModel.fromJson(data.data);
    await _userInfoBox.put(item.userInfoId, data);
  }

  UserInfoModel getSingleItemById(id) {
    return _userInfoBox.values.where((b) => b.userInfoId == id).first;
  }

  UserInfoModel get data {
    return _userInfoBox.getAt(0);
  }

  Future<void> clear() async {
    await _userInfoBox.clear();
  }

  bool get isEmpty {
    return _userInfoBox.isEmpty;
  }
}
