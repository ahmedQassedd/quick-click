import 'package:flutter/material.dart';

import '../const.dart';

Widget defaultTextFormField({
  required TextEditingController controller,
  required TextInputType inputType,
  String? Function(String?)? validator,
  String? label,
  String? hint,
  required context ,
  IconData? suffixIcon,
  Function? suffixPressed,
  IconData? prefix,
  bool secure = false,
  InputDecoration? border,

}) =>
    TextFormField(
      cursorColor:  Colors.black,
      scrollPadding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom + 20*4),
      controller: controller,
      keyboardType: inputType,
      validator: validator,
      obscureText: secure,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 0.0, horizontal: 15.0),
        fillColor: Colors.white,
        filled: true,
        prefixIcon: prefix != null ? Icon(prefix , color: primaryColor,) : null ,
        suffixIcon:  suffixIcon != null ? IconButton(
            onPressed: () {
              suffixPressed!();
            },
            icon: Icon(suffixIcon)) : null ,
        labelText: label,
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.black54),
        border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(10)
        ),
      ),
    );