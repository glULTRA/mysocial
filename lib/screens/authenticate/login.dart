import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysocial/shared/shapes/Circle.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  var radius = 10.0;
  var stroke = 2.0;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          padding: EdgeInsets.all(50.0),
          child: Column(
            children: [
              SizedBox(height: 100.0),
              Opacity(
                opacity: 0.5,
                child: CustomPaint(
                  painter: Circle(
                    radius: radius,
                    stroke: stroke,
                  ),
                  child: Container(),
                ),
              ),
              SizedBox(height: 100.0),
              Slider(
                value: radius,
                min: 10,
                max: 100,
                activeColor: Colors.amber[300],
                inactiveColor: Colors.amber[300],
                onChanged: (value) {
                  setState(() {
                    radius = value;
                  });
                },
                label: "Radius",
              ),
              SizedBox(height: 100.0),
              Slider(
                value: stroke,
                min: 1.0,
                max: 10.0,
                activeColor: Colors.red[300],
                inactiveColor: Colors.red[300],
                onChanged: (value) {
                  setState(() {
                    stroke = value;
                  });
                },
                label: "Stroke",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
