import 'package:flutter/material.dart';
import 'package:libuta_sugbo_app/widgets/dashboard/dashboard_web_landscape.dart';
import 'package:responsive_builder/responsive_builder.dart';


class DashboardPage extends StatefulWidget {
  // const LoginPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
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
          mobile: (BuildContext context) => Container(color: Colors.pink),
          tablet: (BuildContext context) => Container(color: Colors.pink),
          desktop: (BuildContext context) => DashboardWebLandscape(),
          watch: (BuildContext context) => Container(color: Colors.pink),
        ),
        landscape: (context) => ScreenTypeLayout.builder(
          // breakpoints: ScreenBreakpoints(
          //   tablet: 768.0,
          //   desktop: 1200,
          //   watch: 300,
          // ),
          mobile: (BuildContext context) => Container(color: Colors.pink),
          tablet: (BuildContext context) => Container(color: Colors.pink),
          desktop: (BuildContext context) => DashboardWebLandscape(),
          watch: (BuildContext context) => Container(color: Colors.purple),
        ),
      ),
    );
  }
}
