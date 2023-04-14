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
final authCubit = AuthCubit();
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

class LandingWebLandscape extends StatelessWidget {
  LandingWebLandscape({super.key});

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
              height: MediaQuery.of(context).size.height * .40,
              width: double.infinity,
              color: const Color(0xff003580),
              child: Text("asds"),
            ),
             Expanded(
              child: Container(
                width: double.infinity,
                color: Colors.white,
                child: Text("asds"),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
