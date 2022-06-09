import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysocial/shared/forms/containerTextInputShadow.dart';
import 'package:mysocial/shared/forms/textInputDecoration.dart';
import 'package:mysocial/shared/shapes/bottom_wave.dart';
import 'package:mysocial/shared/shapes/wave.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  @override
  Widget build(BuildContext context) {
    Size device_size = MediaQuery.of(context).size;

    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 246, 252),
        body: ListView.builder(
          addRepaintBoundaries: false,
          itemCount: 1,
          reverse: false,
          itemBuilder: ((context, index) => Stack(
                children: [
                  Opacity(
                    opacity: 0.980,
                    alwaysIncludeSemantics: true,
                    child: Container(
                      child: CustomPaint(
                        painter: Wave(),
                        child: Container(
                          height: 200,
                        ),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.670,
                    alwaysIncludeSemantics: true,
                    child: Container(
                      height: 320,
                      child: CustomPaint(
                        painter: Wave(),
                        child: Container(),
                      ),
                    ),
                  ),
                  Opacity(
                    opacity: 0.50,
                    child: Container(
                      height: device_size.height,
                      child: CustomPaint(
                        painter: BottomWave(),
                        child: Container(),
                      ),
                    ),
                  ),
                  Center(
                    child: Container(
                      padding:
                          EdgeInsets.only(top: 200, left: 45.0, right: 45.0),
                      child: Column(
                        children: [
                          ContainerTextInputShadow(
                            placeholder: "Username",
                            icon: null,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.0),
                          ContainerTextInputShadow(
                            placeholder: "Full name",
                            icon: null,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.0),
                          ContainerTextInputShadow(
                            placeholder: "Email Address",
                            icon: null,
                            textAlign: TextAlign.center,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              )),
        ),
      ),
    );
  }
}
