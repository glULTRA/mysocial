// ignore_for_file: deprecated_member_use

import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart' show rootBundle;

Future<String> terms_conditions() async {
  return await rootBundle.loadString('assets/terms.txt');
}

void showTemrs(
    {required BuildContext context,
    required String data,
    required VoidCallback? onPressed}) {
  showDialog(
    context: context,
    builder: (context) => AlertDialog(
      elevation: 100.0,
      actionsAlignment: MainAxisAlignment.center,
      scrollable: true,
      backgroundColor: Colors.grey[100],
      title: Text("Terms & Conditions"),
      content: Text(
        data,
        style: TextStyle(
          color: Colors.blue[500],
          fontWeight: FontWeight.bold,
        ),
      ),
      actions: [
        RaisedButton(
          onPressed: () {
            Navigator.of(context).pop();
          },
          child: Text("Ok"),
        ),
        RaisedButton(
          onPressed: onPressed,
          color: Colors.pink,
          child: Text(
            "Agree",
            style: TextStyle(color: Colors.white),
          ),
        ),
      ],
    ),
  );
}
