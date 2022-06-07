import 'package:flutter/material.dart';

InputDecoration textInputDecoration({
  required icon,
  required placeholder,
}) =>
    InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20.0),
        borderSide: const BorderSide(
          color: Colors.redAccent,
          width: 2.0,
        ),
      ),
      fillColor: Colors.white,
      filled: true,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(
          color: Colors.white,
          width: 10.0,
        ),
        borderRadius: BorderRadius.circular(20.0),
      ),
      hintText: placeholder,
      hintStyle: TextStyle(color: Colors.grey[500]),
      prefixIcon: Icon(
        icon,
        color: Colors.pink[600],
      ),
      contentPadding: const EdgeInsets.fromLTRB(
        20.0,
        10.0,
        20.0,
        10.0,
      ),
    );
