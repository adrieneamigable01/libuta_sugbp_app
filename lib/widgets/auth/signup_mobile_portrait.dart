import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter/gestures.dart';
import 'package:libuta_sugbo_app/cubit/auth/auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:libuta_sugbo_app/widgets/common/alert_dialog_widget.dart';
import 'package:libuta_sugbo_app/contants/common_style_constants.dart';
import 'package:go_router/go_router.dart';



  


  final formKey = GlobalKey<FormState>();
  final TextEditingController firstnameController = TextEditingController();
  final TextEditingController middleController = TextEditingController();
  final TextEditingController lastnameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController rePasswordController = TextEditingController();

  final FocusNode firstNameFocus = FocusNode();
  final FocusNode middleNameFocus = FocusNode();
  final FocusNode lastNameFocus = FocusNode();
  final FocusNode usernameFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  final PageController page = PageController();
  final AlertDialogWidget alertDialog = AlertDialogWidget();

  


class SignupPageMobilePortrait extends StatelessWidget {
  SignupPageMobilePortrait({super.key});
  
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
                      title: 'Signup',
                      content: state.errorMessage,
                      onPressed: (){

                      },
                      context: context);
                }

                if (state is SuccessAuthState) {
                  Navigator.of(context, rootNavigator: true).pop();
                  context.push('/store_list');
                }

                if(state is LoadingAuthState){
                  if(state.isLoading){
                    alertDialog.showLoadingDialog(context: context, onPressed: (){

                    });
                  }
                  
                }
              },
              child: ListView(
                children: [
                  Form(
                  key: formKey,
                  autovalidateMode: AutovalidateMode.disabled,
                  child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        const Align(
                          alignment: Alignment.center,
                          child: Text(
                            'GOSHOP SIGNUP',
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
                                  labelText: 'Firstname',
                                  prefixIcon: const Icon(Icons.person_outlined),
                                  fillColor:Colors.white,),
                              // focusNode: usernameFocus,
                              textInputAction: TextInputAction.next,
                              controller: firstnameController,
                              onFieldSubmitted: (submit) async {
                                _fieldFocusChange(
                                    context: context,
                                    currentFocus: FocusNode(),
                                    nextFocus: middleNameFocus);
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
                                const BoxConstraints(maxWidth: 370.0, minHeight: 10.0),
                            child: TextFormField(
                              decoration: kTextFieldInputDecorationLogin(
                                  labelText: 'Middlename',
                                  prefixIcon: const Icon(Icons.person_outlined),
                                  fillColor:Colors.white,),
                              focusNode: middleNameFocus,
                              textInputAction: TextInputAction.next,
                              controller: middleController,
                              onFieldSubmitted: (submit) async {
                                _fieldFocusChange(
                                    context: context,
                                    currentFocus: FocusNode(),
                                    nextFocus: lastNameFocus);
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
                                const BoxConstraints(maxWidth: 370.0, minHeight: 10.0),
                            child: TextFormField(
                              decoration: kTextFieldInputDecorationLogin(
                                  labelText: 'Lastname',
                                  prefixIcon: const Icon(Icons.person_outlined),
                                  fillColor:Colors.white,),
                              focusNode: lastNameFocus,
                              textInputAction: TextInputAction.next,
                              controller: lastnameController,
                              onFieldSubmitted: (submit) async {
                                _fieldFocusChange(
                                    context: context,
                                    currentFocus: FocusNode(),
                                    nextFocus: usernameFocus);
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
                            validator: (value) {
                              ///Regular Expresstion for Alpha numeric password + 1 special character
                              RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$'); 
                              if (value == null || value.isEmpty) { ///For for empty password
                                return 'This field is required.';
                              }
                              else if (value.length < 8) { /// atlest 8 characted password
                                return 'Password must be atleast 8 charater';
                              }else {
                                if (!regex.hasMatch(value)) { //// using regex
                                  return 'Invalid Password\n\nPassword should contain atlease alpha numeric character \nPassword must have at least one digit("0-9")\nPassword must have at lease one uppecase ("A-Z")';
                                } else {
                                  return null;
                                }
                              }
                              return null;
                            },
                            onChanged: (newTextValue) {
                              // passwordController.text = newTextValue;
                            },
                          ),
                        ),
                        const SizedBox(height: 10),
                        Container(
                          constraints:
                              const BoxConstraints(maxWidth: 370.0, minHeight: 50.0),
                          child: TextFormField(
                            controller: rePasswordController,
                            decoration: kTextFieldInputDecorationLogin(
                                labelText: 'Re-password',
                                prefixIcon: const Icon(Icons.lock_outline),
                                fillColor:Colors.white,
                              ),
                            // focusNode: passwordFocus,
                            textInputAction: TextInputAction.send,
                            onFieldSubmitted: (submit) async {},
                            obscureText: true,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'This field is required.';
                              }
                              else if (passwordController.text != value) {
                                return 'Password does not match';
                              }
                              return null;
                            },
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
                                        dynamic payload = {
                                          "first_name":firstnameController.text,
                                          "middle_name":middleController.text,
                                          "last_name":lastnameController.text,
                                          "username":usernameController.text,
                                          "password":passwordController.text
                                        };
                                        // BlocProvider.of<AuthCubit>(context).signup(payload: payload,username: usernameController.text,password: passwordController.text);
                                      }
                                    }
                                  // ignore: dead_code
                                  : null,
                              child: const Text(
                                "Signup",
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
                                  text: "Back to ",
                                  style: TextStyle(color: Colors.black)),
                              TextSpan(
                                text: "Login",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  color: Colors.blue,
                                ),
                                recognizer: TapGestureRecognizer()
                                  ..onTap = () {
                                    context.push('/');
                                  },
                              ),
                            ],
                          ),
                        ),
                      ]),
            ),
                ],
              ),
          ),
        ),
      ),
    )
    );
  }
}
