import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysocial/shared/shapes/bottom_wave.dart';
import 'package:mysocial/shared/shapes/circle.dart';
import 'package:mysocial/shared/shapes/wave.dart';

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
          child: Stack(
            children: [
              Opacity(
                opacity: 0.99,
                child: CustomPaint(
                  painter: Wave(),
                  child: Container(
                    height: 230,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.772,
                child: CustomPaint(
                  painter: Wave(),
                  child: Container(
                    height: 400,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.272,
                child: CustomPaint(
                  painter: BottomWave(),
                  child: Container(
                    height: 900,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
