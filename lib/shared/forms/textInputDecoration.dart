import 'package:flutter/material.dart';

InputDecoration textInputDecoration({
  required IconData? icon,
  required String? placeholder,
}) =>
    InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          width: 2.0,
        ),
      ),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.transparent,
          width: 10.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20.0),
          borderSide: BorderSide(
            color: Colors.transparent,
          )),
      focusedErrorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      errorStyle: TextStyle(
        color: Colors.red[400],
        fontWeight: FontWeight.normal,
        fontSize: 13,
      ),
      disabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: BorderSide(color: Colors.transparent),
      ),
      hintText: placeholder,
      hintStyle: TextStyle(color: Colors.grey[500]),
      prefixIcon: Icon(
        icon,
        color: Colors.lightGreen[600],
      ),
      contentPadding: const EdgeInsets.fromLTRB(
        20.0,
        10.0,
        20.0,
        10.0,
      ),
    );
