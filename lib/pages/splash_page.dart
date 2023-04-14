import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:libuta_sugbo_app/bloc_providers.dart';
import 'package:libuta_sugbo_app/cubit/auth/auth_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
// import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:libuta_sugbo_app/models/user_model.dart';


class SplashPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashPageState();
  }
}

final UserBox _userBox = UserBox();


class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    print("trigger splash");
    startTimer();
    super.initState();
  }
///Circle2
  final spinkit = SpinKitThreeBounce(
    // duration: Duration(milliseconds: 2000),
    size: 50.0,
    itemBuilder: (_, int index) {
      return DecoratedBox(
        decoration: BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
      );
    },
  );
  

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        color: const Color(0xff59bcb9),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(child: Image.asset('assets/logo/logo.png', width: 200, height: 100)),
            SizedBox(height: 5),
            spinkit,
          ],
        ),
      ),
    );
  }

  void startTimer() {
    // BlocProvider.of<AuthCubit>(context).checkTokenValidity(context);
    Timer(Duration(seconds: 3), () {
      navigateUser(); //It will redirect  after 3 seconds
    });
  }



  void navigateUser() async {
    print("_userBox : ${_userBox.isEmpty}");
    if(!kIsWeb){
      if(!_userBox.isEmpty){
       context.go('/dashboard');
      }else{
        context.go('/login');
      }
    }else{
      if(!_userBox.isEmpty){
      context.go('/dashboard');
      }else{
        context.go('/login');
      }
    } 
  }
}
