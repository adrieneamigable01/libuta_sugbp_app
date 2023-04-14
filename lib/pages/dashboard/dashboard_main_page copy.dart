import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:libuta_sugbo_app/widgets/dashboard/dashboard_web_main_landscape.dart';
import 'package:libuta_sugbo_app/widgets/common/admin_app_bar_widget.dart';
class DashboardMainPage extends StatefulWidget  {
  // const LoginPage({super.key});

  @override
  State<DashboardMainPage> createState() => _DashboardMainPageState();

}

class _DashboardMainPageState extends State<DashboardMainPage>  {
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
          desktop: (BuildContext context) => DashboardWebMainWidget(),
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
          desktop: (BuildContext context) => DashboardWebMainWidget(),
          watch: (BuildContext context) => Container(color: Colors.purple),
        ),
      ),
    );
  }
  

}
