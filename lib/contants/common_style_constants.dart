import 'package:flutter/material.dart';

/// Button styles (login)
BorderRadius kButtonLoginBorderRadius = BorderRadius.all(Radius.circular(15.0));

BoxDecoration kLoginEnabledButton = BoxDecoration(
  borderRadius: kButtonLoginBorderRadius,
  color: Color(0xFF273788),
);

BoxDecoration kLoginDisabledButton = BoxDecoration(
  borderRadius: kButtonLoginBorderRadius,
  color: Color(0xFF273799),
);

/// TextField styles
BorderRadius kTextFieldBorderRadius = BorderRadius.all(Radius.circular(15.0));

InputDecoration kTextFieldInputDecorationSqaure(
    {String? labelText,
    bool isPassword = false,
    Color? borderSideErrorColor,
    Color? borderSideColor,
    Color fillColor = Colors.white10,
    double? helperFontSize,
    Widget? prefixIcon,
    Widget? suffixIcon,
    String? hintText}) =>
InputDecoration(
  floatingLabelBehavior: FloatingLabelBehavior.auto,
  labelText: labelText,
  filled: true,
  fillColor: fillColor,
  suffixIcon: suffixIcon,
  prefixIcon: prefixIcon,
  hintText: hintText,
  contentPadding: EdgeInsets.symmetric(
    vertical: 5.0,
    horizontal: 10.0,
  ),
  // border: OutlineInputBorder(
  //   borderRadius: BorderRadius.all(
  //     Radius.circular(32.0),
  //   ),
  // ),
  border: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2.0,
    ),
    // borderRadius: BorderRadius.all(
    //   Radius.circular(32.0),
    // ),
  ),
  enabledBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2.0,
    ),
    // borderRadius: BorderRadius.all(
    //   Radius.circular(32.0),
    // ),
  ),
  focusedBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.grey,
      width: 2.0,
    ),
    // borderRadius: BorderRadius.all(
    //   Radius.circular(
    //     32.0,
    //   ),
    // ),
  ),
  errorBorder: OutlineInputBorder(
    borderSide: BorderSide(
      color: Colors.redAccent,
      width: 2.0,
    ),
    // borderRadius: BorderRadius.all(
    //   Radius.circular(
    //     32.0,
    //   ),
    // ),
  ),
  helperText: ' ',
);

InputDecoration kTextFieldInputDecorationLogin(
        {String? labelText,
        bool isPassword = false,
        Color? borderSideErrorColor,
        Color? borderSideColor,
        Color fillColor = Colors.white10,
        double? helperFontSize,
        Widget? prefixIcon,
        Widget? suffixIcon,
        String? hintText}) =>
    InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelText: labelText,
      filled: true,
      fillColor: fillColor,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hintText,
      contentPadding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white12,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            32.0,
          ),
        ),
      ),
      helperText: ' ',
    );


    InputDecoration kTextFieldInputDecorationNoBorder(
        {String? labelText,
        bool isPassword = false,
        Color? borderSideErrorColor,
        Color? borderSideColor,
        Color fillColor = Colors.white10,
        double? helperFontSize,
        Widget? prefixIcon,
        Widget? suffixIcon,
        String? hintText}) =>
    InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      labelText: labelText,
      filled: true,
      fillColor: fillColor,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      hintText: hintText,
      contentPadding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      // border: OutlineInputBorder(
      //   borderRadius: BorderRadius.all(
      //     Radius.circular(32.0),
      //   ),
      // ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        // borderRadius: BorderRadius.all(
        //   Radius.circular(32.0),
        // ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white12,
          width: 2.0,
        ),
        // borderRadius: BorderRadius.all(
        //   Radius.circular(
        //     32.0,
        //   ),
        // ),
      ),
      helperText: ' ',
    );

InputDecoration kTextFieldInputDecoration(
        {String? labelText,
        bool isPassword = false,
        Color? borderSideErrorColor,
        Color? borderSideColor,
        double? helperFontSize,
        Widget? prefixIcon,
        Widget? suffixIcon}) =>
    InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      counterText: '',
      labelText: labelText,
      filled: true,
      fillColor: Colors.white10,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      contentPadding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white12,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            32.0,
          ),
        ),
      ),
      helperText: ' ',
    );

InputDecoration kTextFieldDropdownInputDecoration(
        {String? labelText,
        bool isPassword = false,
        Color? borderSideErrorColor,
        Color? borderSideColor,
        double? helperFontSize,
        Widget? prefixIcon,
        Widget? suffixIcon}) =>
    InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      counterText: '',
      labelText: labelText,
      filled: true,
      fillColor: Colors.white10,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      contentPadding: EdgeInsets.symmetric(
        vertical: 0.0,
        horizontal: 20.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white12,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            32.0,
          ),
        ),
      ),
      helperText: ' ',
    );

InputDecoration kTextFieldInputDecorationPhone(
        {String? labelText,
        bool isPassword = false,
        Color? borderSideErrorColor,
        Color? borderSideColor,
        double? helperFontSize,
        Widget? prefixIcon,
        Widget? suffixIcon,
        String? helperText}) =>
    InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.auto,
      counterText: '',
      labelText: labelText,
      filled: true,
      fillColor: Colors.white10,
      suffixIcon: suffixIcon,
      prefixIcon: prefixIcon,
      contentPadding: EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 20.0,
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 1.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white12,
          width: 2.0,
        ),
        borderRadius: BorderRadius.all(
          Radius.circular(
            32.0,
          ),
        ),
      ),
      helperText: helperText ?? ' ',
    );

Text kTextListTileTitle(String label, {double fontSize = 17, Color? color}) =>
    Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        color: color,
      ),
    );

Text kTextListTileSubtitle(String label, {double fontSize = 15}) => Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        color: Colors.white,
      ),
    );

Text kTextAlertDialogActionLabel(String label, {double fontSize = 20}) => Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );

Text kTextHint(String label, {double fontSize = 12}) => Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );

Text kTextProfileHeaders(String label, {double fontSize = 20}) => Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );

Text kTextAppBarTitle(String label, {double fontSize = 24}) => Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );

Text kTextProfileSubHeaders(String label, {double fontSize = 20}) => Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
        fontWeight: FontWeight.bold,
      ),
    );

Text kTextAppBarLeading(String label, {double fontSize = 18}) => Text(
      label,
      style: TextStyle(
        fontSize: fontSize,
      ),
    );

Card kProfileListMenuCard(String label, IconData leadingIcon,
        BuildContext context, String route, GlobalKey<ScaffoldState> _key) =>
    Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {
          Navigator.pushNamed(context, route);
          // _key.currentState!.openEndDrawer();
        },
        child: ListTile(
          leading: Icon(leadingIcon),
          trailing: Icon(Icons.arrow_forward_ios),
          title: kTextListTileTitle(label),
        ),
      ),
    );

Card kProfileListMenuCardLogout(String label, BuildContext context) => Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      child: InkWell(
        onTap: () {},
        child: ListTile(
          leading: Icon(Icons.logout, color: Colors.red),
          title: kTextListTileTitle(label, color: Colors.red),
        ),
      ),
    );
