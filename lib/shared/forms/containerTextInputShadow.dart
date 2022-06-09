import 'package:flutter/material.dart';
import 'package:mysocial/shared/forms/textInputDecoration.dart';

Container ContainerTextInputShadow({
  required String? placeholder,
  required IconData? icon,
  TextAlign textAlign = TextAlign.start,
  bool obscureText = false,
  TextEditingController? controller,
  FormFieldValidator<String>? validator2,
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
        onChanged: (value) => value = value,
        obscureText: obscureText,
        textAlign: textAlign,
        controller: controller,
        validator: validator2,
        decoration: textInputDecoration(
          icon: icon,
          placeholder: placeholder,
        ),
      ),
    );
