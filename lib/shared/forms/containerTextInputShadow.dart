import 'package:flutter/material.dart';
import 'package:mysocial/shared/forms/textInputDecoration.dart';

Container ContainerTextInputShadow({
  required String ?placeholder,
  required IconData ?icon,
  TextAlign textAlign = TextAlign.start,
  bool obscureText = false,
}) =>
    Container(
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 5,
            blurRadius: 7,
            offset: Offset(0, 3),
          ),
        ],
      ),
      child: TextFormField(
        obscureText: obscureText,
        textAlign: textAlign,
        decoration: textInputDecoration(
          icon: icon,
          placeholder: placeholder,
        ),
      ),
    );
