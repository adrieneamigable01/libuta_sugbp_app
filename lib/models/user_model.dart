import 'package:hive/hive.dart';

import '../helpers/hive_db_helper.dart';

part 'user_model.g.dart';

///HiveDB Annotation
///
/// This annotation is use for the hive_generator plugin to generate an adapter.
/// Type id must be unique and hive field indexes can start from 0-223.
@HiveType(typeId: 0)
class UserModel {
  @HiveField(0)
  dynamic userId;
  @HiveField(1)
  dynamic userName;
  @HiveField(2)
  String? userType;
  @HiveField(3)
  String? role;
  @HiveField(7)
  String? token;

  UserModel({
    this.userId,
    this.userName,
    this.userType,
    this.role,
    this.token,
  });

  UserModel.fromJson(Map<String, dynamic> json)
      : userId = json['user_info']['user_id'],
        userName = json['user_info']['username'],
        userType = json['user_info']['user_type'],
        role = json['user_info']['role'],
        token = json['token'];

  Map<String, dynamic> toJson() => {
        'userId': userId,
        'userName': userName,
        'userType': userType,
        'role': role,
        'token': token
      };
}

///User Box
///
/// This class handles the user data crud operation to box.
class UserBox {
  Box get _userBox {
    return Hive.box(Boxes.userBox);
  }

  Future<void> insertUserData(json) async {
    final userData = UserModel.fromJson(json);
    await _userBox.clear();
    await _userBox.add(userData);
  }

  int getStaffCount({required String status}){
    return _userBox.values.where((element) => element.status == status).length;
  }

  UserModel get userData {
    return _userBox.getAt(0);
  }

  Future<void> updateUser(UserModel userData) async {
    await _userBox.putAt(0, userData);
  }

  Future<void> clearUserData() async {
    await _userBox.clear();
  }

  bool get isEmpty {
    return _userBox.isEmpty;
  }
}
