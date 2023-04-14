import 'package:flutter/material.dart';


InputDecoration kTextFieldInputDecorationLogin({
  String labelText = "",
  bool isPassword = false,
  Widget suffixIcon = const SizedBox(),
  Widget prefixIcon = const SizedBox(),
}) =>
    InputDecoration(
      floatingLabelBehavior: FloatingLabelBehavior.never,
      labelText: labelText,
      filled: true,
      fillColor: Colors.white,
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

