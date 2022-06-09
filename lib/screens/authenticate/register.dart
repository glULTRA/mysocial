// ignore_for_file: deprecated_member_use

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
  bool isAgree = false;
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
                          SizedBox(height: 10.0),
                          ContainerTextInputShadow(
                            obscureText: true,
                            placeholder: "Password",
                            icon: null,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(height: 10.0),
                          Row(
                            children: [
                              SizedBox(width: 20.0),
                              Checkbox(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                                side: MaterialStateBorderSide.resolveWith(
                                  (states) =>
                                      BorderSide(width: 1.0, color: Colors.red),
                                ),
                                value: this.isAgree,
                                onChanged: (value) {
                                  setState(() {
                                    this.isAgree = value!;
                                  });
                                },
                                activeColor: Colors.pink,
                                checkColor: Colors.white,
                              ),
                              SizedBox(width: 10.0),
                              Text(
                                "Agree to",
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Terms & Conditions.",
                                  style: TextStyle(
                                    color: Colors.pink[500],
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 40.0),
                          RaisedButton(
                            onPressed: () {},
                            color: Colors.pink[500],
                            elevation: 0.0,
                            padding: EdgeInsets.only(
                              left: 45.0,
                              right: 45.0,
                              top: 13.0,
                              bottom: 13.0,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(14.0),
                            ),
                            child: Text(
                              "Sign up",
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 17.0,
                              ),
                            ),
                          ),
                          SizedBox(height: 5.0),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text(
                              "I'm already a member",
                              style: TextStyle(
                                color: Colors.pink[500],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
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
