import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:libuta_sugbo_app/widgets/common/alert_dialog_widget.dart';
import 'package:libuta_sugbo_app/contants/common_style_constants.dart';
import 'package:go_router/go_router.dart';

import '../../models/user_model.dart';

import 'package:libuta_sugbo_app/cubit/auth/auth_cubit.dart';

final formKey = GlobalKey<FormState>();
final TextEditingController usernameController = TextEditingController();
final TextEditingController passwordController = TextEditingController();

final FocusNode usernameFocus = FocusNode();
final FocusNode passwordFocus = FocusNode();

final PageController page = PageController();
final AlertDialogWidget alertDialog = AlertDialogWidget();
final userBox = UserBox();

class TopWaveClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    // This is where we decide what part of our image is going to be visible.
    var path = Path();
    path.lineTo(0.0, size.height);

    //creating first curver near bottom left corner
    var firstControlPoint =
        Offset(size.width - (size.width / 9), size.height / 6);
    var firstEndPoint = Offset(size.width, 0.0);

    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstEndPoint.dx, firstEndPoint.dy);

    //creating second curver near center
    var secondControlPoint = Offset(size.width / 1.5, size.height / 5);
    var secondEndPoint = Offset(size.width / 5, size.height / 4);

    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondEndPoint.dx, secondEndPoint.dy);

    //creating third curver near top right corner
    var thirdControlPoint = new Offset(size.width / 15, size.height - 30);
    var thirdEndPoint = new Offset(size.width / 6, size.height / 1.5);

    path.quadraticBezierTo(thirdControlPoint.dx, thirdControlPoint.dy,
        thirdEndPoint.dx, thirdEndPoint.dy);

    ///move to top right corner
    path.lineTo(size.width, 0.0);

    ///finally close the path by reaching start point from top right corner
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    // TODO: implement shouldReclip
    throw UnimplementedError();
  }
}

const List<Color> orangeGradients = [
  Color(0xFFFF4faf80),
  Color(0xFFFE56bc87),
  Color(0xFFF58c18d),
];

class LoginPageWebLandscape extends StatelessWidget {
  LoginPageWebLandscape({super.key});

  _fieldFocusChange(
      {required BuildContext context,
      required FocusNode currentFocus,
      required FocusNode nextFocus}) {
    currentFocus.unfocus();
    FocusScope.of(context).requestFocus(nextFocus);
  }

  @override
  Widget build(BuildContext context) {
    // RouteSettings routeSettings;
    bool isLoading = false;

    return SelectionArea(
        child: SafeArea(
      child: Scaffold(
        // backgroundColor: Colors.green.shade200,
        body: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * .1,
              width: double.infinity,
              color: const Color(0xff59bcb9),
              child: Container(
                margin: EdgeInsets.only(left: 200.0,right: 200.0),
                child: Row(
                  children: [
                    const Image(
                      image: AssetImage('assets/logo/logo.png'),
                      width: 100,
                    ),
                  ],
                ),
              ),
            ),
             Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child:  Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                  child: BlocListener<AuthCubit, AuthState>(
                    listener: (context, state) {
                      // TODO: implement listener
                      print("**** Auth Cubit Listener .... : $state");

                      if (state is FailureAuthState) {
                        alertDialog.showAlertMessage(
                            context: context,
                            title: "Login",
                            desc: state.errorMessage,
                            isError: state.isError);
                      }

                      if (state is LoadingAuthState) {
                        if (state.isLoading) {
                          alertDialog.showLoadingDialog(
                              context: context, onPressed: () {});
                        } else {
                          Navigator.of(context, rootNavigator: true).pop();
                        }
                      }

                      if (state is SuccessAuthState) {
                        print("userBox.userData.userType : ${userBox.userData.userType}");
                        if (userBox.userData.userType == 'Client') {
                          context.go('/splash');
                        } else {
                          // context.go('/splash');
                        }
                      }
                    },
                    child: Center(
                      child: Container(
                        width: 400,
                        child: Form(
                          key: formKey,
                          autovalidateMode: AutovalidateMode.disabled,
                          child: Column(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                SizedBox(height: 50.0,),
                                Text(
                                  'Sign in account',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 20.0,
                                    color: Colors.black,
                                  ),
                                ),
                                const SizedBox(height: 20.0),
                                Container(
                                   width: double.infinity,
                                   height: 80,
                                    child: TextFormField(
                                      decoration: kTextFieldInputDecorationSqaure(
                                        labelText: 'Username',
                                        prefixIcon: const Icon(Icons.person_outlined),
                                        fillColor: Colors.white,
                                      ),
                                      // focusNode: usernameFocus,
                                      textInputAction: TextInputAction.next,
                                      controller: usernameController,
                                      onFieldSubmitted: (submit) async {
                                        _fieldFocusChange(
                                            context: context,
                                            currentFocus: FocusNode(),
                                            nextFocus: passwordFocus);
                                      },
                                      validator: (textValue) => textValue == ""
                                          ? 'This field is required.'
                                          : null,
                                      onChanged: (newTextValue) {
                                        // usernameController.text = newTextValue;
                                      },
                                    )),
                                Container(
                                  width: double.infinity,
                                  height: 80,
                                  child: TextFormField(
                                    controller: passwordController,
                                    decoration: kTextFieldInputDecorationSqaure(
                                      labelText: 'Password',
                                      prefixIcon: const Icon(Icons.lock_outline),
                                      fillColor: Colors.white,
                                    ),
                                    // focusNode: passwordFocus,
                                    textInputAction: TextInputAction.send,
                                    onFieldSubmitted: (submit) async {
                                      if (formKey.currentState!.validate()) {
                                        Object payload = {

                                        };
                                        BlocProvider.of<AuthCubit>(context).login(payload: payload);
                                      }
                                    },
                                    obscureText: true,
                                    validator: (textValue) => textValue == ""
                                        ? 'This field is required.'
                                        : null,
                    
                                    onChanged: (newTextValue) {
                                      // passwordController.text = newTextValue;
                                    },
                                  ),
                                ),
                                Container(
                                    width: double.infinity,
                                    height: 50,
                                    decoration: BoxDecoration(
                                      gradient: const LinearGradient(
                                        colors: [
                                          Colors.lightBlue,
                                          // Color(0xff03E5B7),
                                          Colors.lightBlue,
                                        ],
                                        begin: Alignment.centerLeft,
                                        end: Alignment.centerRight,
                                      ),
                                      // borderRadius: BorderRadius.circular(30.0),
                                    ),
                                      // shape: RoundedRectangleBorder(
                                      //     borderRadius: BorderRadius.circular(30.0)),
                                    child: MaterialButton(
                                      onPressed: !isLoading
                                          ? () {
                                              if (formKey.currentState!.validate()) {
                                                Object payload = {
                                                  'username':usernameController.text,
                                                  'password':passwordController.text,
                                                };
                                                BlocProvider.of<AuthCubit>(context).login(payload: payload);
                                              }
                                            }
                                          // ignore: dead_code
                                          : null,
                                      child: const Text(
                                        "Login",
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20.0,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    )),
                                const SizedBox(height: 20),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    RichText(
                                      text: TextSpan(
                                        style: const TextStyle(fontSize: 14.0),
                                        children: <TextSpan>[
                                          const TextSpan(
                                              text: "Don`t have an account? ",
                                              style: TextStyle(color: Colors.black)),
                                          TextSpan(
                                            text: "Sign up",
                                            style: const TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.blue,
                                            ),
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                Navigator.popAndPushNamed(context, '/signup');
                                              },
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 20),
                                RichText(
                                  textAlign: TextAlign.center,
                                  text: TextSpan(
                                    style: const TextStyle(fontSize: 14.0),
                                    children: <TextSpan>[
                                      const TextSpan(
                                          text: "By signing in or creating an account, you agree with our  ",
                                          style: TextStyle(color: Colors.black)),
                                      TextSpan(
                                        text: "Terms & Conditions",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.popAndPushNamed(context, '/signup');
                                          },
                                      ),
                                      TextSpan(
                                        text: "and "
                                      ),
                                      TextSpan(
                                        text: "Privacy Statement",
                                        style: const TextStyle(
                                          fontWeight: FontWeight.bold,
                                          color: Colors.blue,
                                        ),
                                        recognizer: TapGestureRecognizer()
                                          ..onTap = () {
                                            Navigator.popAndPushNamed(context, '/signup');
                                          },
                                      ),
                                    ],
                                  ),
                                ),
                              ]),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
