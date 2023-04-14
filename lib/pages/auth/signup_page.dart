import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:libuta_sugbo_app/widgets/auth/signup_web_landscape.dart';
import 'package:libuta_sugbo_app/widgets/auth/signup_mobile_portrait.dart';

class SignupPage extends StatefulWidget {
  // const LoginPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: const Text('Login Page'),
      // ),
      body: OrientationLayoutBuilder(
        portrait: (context) => ScreenTypeLayout.builder(
          // breakpoints: ScreenBreakpoints(
          //   tablet: 768,
          //   desktop: 1200,
          //   watch: 300,
          // ),
          mobile: (BuildContext context) => SignupPageMobilePortrait(),
          tablet: (BuildContext context) => Container(color: Colors.pink),
          desktop: (BuildContext context) => SignupPageWebLandscape(),
          watch: (BuildContext context) => Container(color: Colors.pink),
        ),
        landscape: (context) => ScreenTypeLayout.builder(
          // breakpoints: ScreenBreakpoints(
          //   tablet: 768.0,
          //   desktop: 1200,
          //   watch: 300,
          // ),
          mobile: (BuildContext context) => SignupPageMobilePortrait(),
          tablet: (BuildContext context) => Container(color: Colors.pink),
          desktop: (BuildContext context) => SignupPageWebLandscape(),
          watch: (BuildContext context) => Container(color: Colors.purple),
        ),
      ),
    );
  }
}
