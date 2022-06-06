import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysocial/shared/wave_clipper.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Container(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.5,
                child: ClipPath(
                  clipper: WaveClipper(number_of_curve: 3),
                  child: Container(
                    color: Colors.deepOrangeAccent,
                    height: 200.0,
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
