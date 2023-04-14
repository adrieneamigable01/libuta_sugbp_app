import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:libuta_sugbo_app/contants/api_constants.dart';
import 'package:libuta_sugbo_app/models/response_model.dart';
import 'package:libuta_sugbo_app/services/api_service.dart';

// models
import 'package:libuta_sugbo_app/models/user_info_model.dart';
import 'package:libuta_sugbo_app/models/business_info_model.dart';

part 'users_state.dart';

APIServiceRepo _apiServiceRepo    = APIServiceRepo();
UserInfoBox _userInfoBox          = UserInfoBox();
BusinessInfoBox _businessInfoBox  = BusinessInfoBox();

class UsersCubit extends Cubit<UsersState> {
  UsersCubit() : super(UsersInitial());

  getProfile(String payload) async {
    var newUri  = Uri.parse("${kGetUserProfile}?${payload}");
    var response = await _apiServiceRepo.get(newUri);
    ResponseModel responseModel = ResponseModel(json: response);
    if(!responseModel.isError){
      _userInfoBox.insert(responseModel);
      if(responseModel.data['business'] != null){
        _businessInfoBox.insert(responseModel);
      }
    }
  }
}
