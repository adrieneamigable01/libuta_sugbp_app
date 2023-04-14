import 'dart:convert';

import 'package:libuta_sugbo_app/contants/api_constants.dart';
import 'package:libuta_sugbo_app/cubit/listing/listings_cubit.dart';
import 'package:libuta_sugbo_app/models/business_info_model.dart';
import 'package:libuta_sugbo_app/models/response_model.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:libuta_sugbo_app/services/api_service.dart';

// Models
import 'package:libuta_sugbo_app/models/user_model.dart';
import 'package:libuta_sugbo_app/models/user_info_model.dart';

// Cubit
import 'package:libuta_sugbo_app/cubit/users/users_cubit.dart';

part 'auth_state.dart';

APIServiceRepo _apiServiceRepo  = APIServiceRepo();

// Box
UserBox _userBox                 = UserBox();
UserInfoBox _userInfoBox         = UserInfoBox();
BusinessInfoBox _businessInfoBox = BusinessInfoBox();

// Cubit
UsersCubit _usersCubit          = UsersCubit();
ListingsCubit _listingsCubit    = ListingsCubit();

class AuthCubit extends Cubit<AuthState> {
  AuthCubit() : super(AuthInitial());

  Future<void> clearInitialBox() async {
    await _userBox.clearUserData();
    await _userInfoBox.clear();
    await _businessInfoBox.clear();
  }

  login({required Object payload}) async {
    emit(const LoadingAuthState(true));

    var response = await _apiServiceRepo.post(kAuthLogin, payload);
    ResponseModel responseModel = ResponseModel(json: response);

    if(!responseModel.isError){
      await clearInitialBox();
      await _userBox.insertUserData(responseModel.data);
      await _usersCubit.getProfile("user_id=${_userBox.userData.userId}");
      await _listingsCubit.getListings("business_id=${_businessInfoBox.data.businessId}");
      emit(const LoadingAuthState(false));
      emit(SuccessAuthState(responseModel.message, responseModel.isError));
    }else{
      emit(const LoadingAuthState(false));
      emit(FailureAuthState(responseModel.message, responseModel.isError));
    }

   
   
    

  }
}
