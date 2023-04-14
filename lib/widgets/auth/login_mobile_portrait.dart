import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:libuta_sugbo_app/widgets/common/alert_dialog_widget.dart';
import 'package:libuta_sugbo_app/contants/common_style_constants.dart';
import 'package:go_router/go_router.dart';
import 'package:libuta_sugbo_app/contants/api_constants.dart';

import 'package:libuta_sugbo_app/cubit/auth/auth_cubit.dart';



  


  final formKey = GlobalKey<FormState>();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final PageController page = PageController();
  final AlertDialogWidget alertDialog = AlertDialogWidget();

  


class LoginPageMobilePortrait extends StatelessWidget {
  LoginPageMobilePortrait({super.key});
  
  _fieldFocusChange(
      {required BuildContext context, required FocusNode currentFocus, required FocusNode nextFocus}) {
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
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 10.0,horizontal: 20.0),
          child: BlocListener<AuthCubit,AuthState>(
            listener: (context, state) {
              // TODO: implement listener
               print("**** Auth Cubit Listener .... : $state");
                if (state is FailureAuthState) {
                  // _scaffoldKey.currentState
                  //     .showSnackBar(SnackBar(content: Text(state.errorMessage)));
                   Navigator.of(context, rootNavigator: true).pop();
                  alertDialog.showAlertDialog(
                      isError: state.isError,
                      title: 'Login',
                      content: state.errorMessage,
                      onPressed: (){

                      },
                      context: context);
                }

                if (state is SuccessAuthState) {
                  // Navigator.popAndPushNamed(context, '/landing');
                   Navigator.of(context, rootNavigator: true).pop();
                  context.push('/store_list');
                  // Navigator.pushNamedAndRemoveUntil(
                  //     context, '/store_list', (Route<dynamic> route) => false);
                }

                if(state is LoadingAuthState){
                  if(state.isLoading){
                    alertDialog.showLoadingDialog(context: context, onPressed: (){});
                  }
                }
              },
              child: Form(
              key: formKey,
              autovalidateMode: AutovalidateMode.disabled,
              child: Column(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'GOSHOP LOGIN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30.0,
                        ),
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    const Center(
                      child: Image(
                        image: AssetImage('assets/logo/gslogo.png'),
                        width: 80,
                      ),
                    ),
                    const SizedBox(height: 20.0),
                    Container(
                        constraints:
                            const BoxConstraints(maxWidth: 370.0, minHeight: 10.0),
                        child: TextFormField(
                          decoration: kTextFieldInputDecorationLogin(
                              labelText: 'Username',
                              prefixIcon: const Icon(Icons.person_outlined),
                              fillColor:Colors.white,),
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
                    const SizedBox(height: 5),
                    Container(
                      constraints:
                          const BoxConstraints(maxWidth: 370.0, minHeight: 50.0),
                      child: TextFormField(
                        controller: passwordController,
                        decoration: kTextFieldInputDecorationLogin(
                            labelText: 'Password',
                            prefixIcon: const Icon(Icons.lock_outline),
                            fillColor:Colors.white,
                          ),
                        // focusNode: passwordFocus,
                        textInputAction: TextInputAction.send,
                        onFieldSubmitted: (submit) async {},
                        obscureText: true,
                        validator: (textValue) => textValue == ""
                            ? 'This field is required.'
                            : null,
                        /*.copyWith(
                                                suffixIcon: GestureDetector(
                                                  dragStartBehavior: DragStartBehavior.down,
                                                  onTap: () {
                                                    setState(() {
                                                      _obscureText = !_obscureText;
                                                    });
                                                  },
                                                  child: Icon(
                                                    _obscureText ? Icons.visibility_off : Icons.visibility,
                                                    color: Colors.white,
                                                    size: sizeConfig.kBlockSizeHorizontal * 5,
                                                    semanticLabel: _obscureText ? 'show password' : 'hide password',
                                                  ),
                                                ),
                                              )*/
                                              
                        onChanged: (newTextValue) {
                          // passwordController.text = newTextValue;
                        },
                      ),
                    ),
                    const SizedBox(height: 10),
                    Container(
                        constraints: const BoxConstraints(
                            minWidth: 300.0, maxWidth: 300.0, minHeight: 20.0),
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
                          borderRadius: BorderRadius.circular(30.0),
                        ),
                        child: MaterialButton(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(30.0)),
                          onPressed: !isLoading
                              ? () {
                                  if (formKey.currentState!.validate()) {
                                    // BlocProvider.of<AuthCubit>(context).login(usernameController.text,passwordController.text);
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
                                context.push('/signup');
                              },
                          ),
                        ],
                      ),
                    ),
                    // Spacer(),
                    SizedBox(height: 10.0,),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("v ${kBuildNumber}",style: TextStyle(color: Colors.grey.shade500),)
                      ],
                    )
                  ]),
            ),
          ),
        ),
      ),
    )
    );
  }
}
