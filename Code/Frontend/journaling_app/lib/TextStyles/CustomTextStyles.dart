import 'package:flutter/material.dart';

class CustomTextStyles {
  static TextStyle ErrorTextStyle({double? fontSize, FontWeight? fontWeight, Color? color}) {
    return TextStyle(
      fontSize: fontSize ?? 20,
      fontWeight: fontWeight ?? FontWeight.normal,
      color: color ?? Colors.red,
      fontFamily: 'Times New Roman'
    );
  }

  static TextStyle InputLabelTextStyle() {
    return TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontFamily: 'Times new Roman'
    );
  }

  static TextStyle HintTextStyle() {
    return TextStyle(
      fontSize: 15,
      color: Colors.yellow,
      fontFamily: 'Times new Roman'
    );
  }

  static TextStyle HeadingTextStyle({Color? textColor}) {
    return TextStyle(
        fontSize: 40,
        color: textColor ?? Colors.white,
        fontWeight: FontWeight.w800,
        fontFamily: 'Times new Roman'
    );
  }

  static TextStyle MessageTextStyle({Color? textColor}) {
    return TextStyle(
        fontSize: 14,
        decoration: TextDecoration.underline,
        color: textColor ?? Colors.black,
        fontWeight: FontWeight.bold,
        fontFamily: 'Times new Roman'
    );
  }

  static TextStyle ButtonTextStyle() {
    return TextStyle(
        fontSize: 20,
        color: Colors.white,
        fontFamily: 'Times new Roman'
    );
  }
}