import 'package:flutter/material.dart';

import '../TextStyles/CustomTextStyles.dart';

class TextFormField_Custom extends StatelessWidget {
  final TextEditingController controller;
  final Color? borderColor;
  final Icon? prefixIcon;
  final Icon? suffixIcon;
  final bool? passwordField;
  final TextInputType? keyboardType;
  final Widget label;
  final Widget? error;
  final String? hintText;
  final String? errorText;

  const TextFormField_Custom({
    required this.controller,
    this.borderColor,
    this.prefixIcon,
    this.suffixIcon,
    this.passwordField,
    this.keyboardType,
    required this.label,
    this.hintText,
    this.error,
    this.errorText
  });
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: passwordField ?? false,
      decoration: InputDecoration(
        border: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.purple),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(width: 2.0, color: Colors.blueAccent),
            borderRadius: BorderRadius.all(Radius.circular(10.0))
        ),
        label: label,
        labelStyle: CustomTextStyles.InputLabelTextStyle(),
        // labelText: labelText,
        hintText: hintText,
        hintStyle: CustomTextStyles.HintTextStyle(),
        error: error,
        errorStyle: CustomTextStyles.ErrorTextStyle(fontSize: 14),
        errorText: errorText,
        // errorBorder: ,
        suffix: suffixIcon,
        suffixIcon: suffixIcon,
        // suffixIconColor: ,
        // suffixStyle: ,
        // suffixText: ,
        prefix: prefixIcon,
        prefixIcon: prefixIcon,
        // prefixIconColor: ,
        // prefixStyle: ,
        // prefixText: ,
      ),
      style: TextStyle(

      ),
      controller: controller,
      keyboardType: keyboardType ?? TextInputType.text,
      // validator: ,

    );
  }

}