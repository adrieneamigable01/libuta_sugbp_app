import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:libuta_sugbo_app/widgets/auth/login_mobile_portrait.dart';
import 'package:libuta_sugbo_app/widgets/auth/login_web_landscape.dart';

class LoginPage extends StatefulWidget {
  // const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
          mobile: (BuildContext context) => LoginPageMobilePortrait(),
          tablet: (BuildContext context) => Container(color: Colors.pink),
          desktop: (BuildContext context) => Container(color: Colors.purple),
          watch: (BuildContext context) => Container(color: Colors.pink),
        ),
        landscape: (context) => ScreenTypeLayout.builder(
          // breakpoints: ScreenBreakpoints(
          //   tablet: 768.0,
          //   desktop: 1200,
          //   watch: 300,
          // ),
          mobile: (BuildContext context) => LoginPageMobilePortrait(),
          tablet: (BuildContext context) => Container(color: Colors.pink),
          desktop: (BuildContext context) => LoginPageWebLandscape(),
          watch: (BuildContext context) => Container(color: Colors.purple),
        ),
      ),
    );
  }
}
