import 'package:flutter/material.dart';

final RegExp kNumberRegEx = RegExp('[0-9]');
final RegExp kEmailRegEx = RegExp(
    r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
final RegExp kAlphabetRegEx = RegExp(r'^[a-zA-Z ,]+$');

final RegExp kAlphabetPeriodRegEx = RegExp(r'^[a-zA-Z.0-9]+$');

String? kValidateEmail(String? value) {
  bool isMatch = false;
  if (value!.isEmpty) {
    return 'This field is required.';
  } else {
    isMatch = kEmailRegEx.hasMatch(value);

    if (!isMatch) {
      return 'Please input a valid email address.';
    }
  }

  return null;
}

String? kValidateRequire(String? value) {
  return value!.isEmpty ? 'This field is required.' : null;
}

String? kValidateMobileNumber(String? value) {
  String pattern = r'^(09|)\d{11}$';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    return 'This field is required.';
  } /* else if (value.length > 1 && value.substring(0, 2) != '9') {
    return 'Please enter valid mobile number';
  } else if (!regExp.hasMatch(value)) {
    return 'Please enter valid mobile number';
  } */
  return null;
}

String? kValidateLandline(String? value) {
  String pattern = r'(^(?:[0]32)?[0-9]{10}$)';
  RegExp regExp = RegExp(pattern);
  if (value!.isEmpty) {
    if (value.length > 3 && value.substring(0, 3) != '032') {
      return 'Please enter valid landline number';
    } else if (!regExp.hasMatch(value)) {
      return 'Please enter valid landline number';
    }
  }
  return null;
}

enum Gender { male, female }

final List<DropdownMenuItem<String>> kCivilStatus = [
  DropdownMenuItem(child: Text('Single'), value: 'single'),
  DropdownMenuItem(child: Text('Married'), value: 'married'),
  DropdownMenuItem(child: Text('Widowed'), value: 'widowed'),
  DropdownMenuItem(child: Text('Others'), value: 'others'),
];


Widget saveButton({required VoidCallback? onPressedFunction,required String label}){
  return Container(
        constraints: const BoxConstraints(
            minWidth: 100.0,
            maxWidth: 250.0,
            minHeight: 35.0
          ),
        decoration: BoxDecoration(
          gradient: const LinearGradient(
            colors: [
              Colors.blueAccent,
              Colors.blueAccent
            ],
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
          ),
          borderRadius: BorderRadius.circular(5.0),
        ),
        child: MaterialButton(
          // shape: RoundedRectangleBorder(
          //     borderRadius: BorderRadius.circular(30.0)),
          
          onPressed: () => onPressedFunction!(),
          child: Text(
            label,
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
            ),
          ),
        )
      );
}


Widget cancelButton({required VoidCallback? onPressedFunction}){
  return Container(
      constraints: const BoxConstraints(
          minWidth: 100.0,
          maxWidth: 250.0,
          minHeight: 35.0
        ),
      decoration: BoxDecoration(
        gradient: const LinearGradient(
          colors: [
            Colors.grey,
            Colors.grey
          ],
          begin: Alignment.centerLeft,
          end: Alignment.centerRight,
        ),
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: MaterialButton(
        // shape: RoundedRectangleBorder(
        //     borderRadius: BorderRadius.circular(30.0)),
        
        onPressed: () =>  onPressedFunction!(),
        child: Text(
          "Cancel",
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Colors.white,
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      )
    );
}