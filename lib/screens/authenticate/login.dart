// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysocial/shared/forms/textInputDecoration.dart';
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
  var value = false;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color.fromARGB(255, 235, 246, 252),
        body: Container(
          child: Stack(
            children: [
              Opacity(
                opacity: 0.980,
                alwaysIncludeSemantics: true,
                child: CustomPaint(
                  painter: Wave(),
                  child: Container(
                    height: 230,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.670,
                alwaysIncludeSemantics: true,
                child: CustomPaint(
                  painter: Wave(),
                  child: Container(
                    height: 400,
                  ),
                ),
              ),
              Opacity(
                opacity: 0.30,
                child: CustomPaint(
                  painter: BottomWave(),
                  child: Container(
                    height: 1000,
                  ),
                ),
              ),
              Center(
                child: Container(
                  padding: EdgeInsets.only(top: 270, left: 35, right: 35),
                  child: Center(
                    child: Column(
                      children: [
                        Wrap(
                          crossAxisAlignment: WrapCrossAlignment.center,
                          children: [
                            Icon(Icons.music_note),
                            Text(
                              "\t\tMega Music",
                              style: TextStyle(
                                color: Colors.pink[500],
                                fontSize: 25.0,
                                fontWeight: FontWeight.bold,
                                letterSpacing: 2.0,
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            decoration: textInputDecoration(
                              icon: Icons.person_outline,
                              placeholder: "Username",
                            ),
                          ),
                        ),
                        SizedBox(height: 30.0),
                        Container(
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(20.0),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 5,
                                blurRadius: 7,
                                offset:
                                    Offset(0, 3), // changes position of shadow
                              ),
                            ],
                          ),
                          child: TextFormField(
                            obscureText: true,
                            decoration: textInputDecoration(
                              icon: Icons.lock_outline,
                              placeholder: "Password",
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        Row(
                          children: [
                            Checkbox(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(3.0),
                              ),
                              side: MaterialStateBorderSide.resolveWith(
                                (states) =>
                                    BorderSide(width: 1.0, color: Colors.red),
                              ),
                              value: this.value,
                              onChanged: (value) {
                                setState(() {
                                  this.value = value!;
                                });
                              },
                              activeColor: Colors.pink,
                              checkColor: Colors.white,
                              // fillColor: Fill,
                            ),
                            Text("Remember me"),
                            SizedBox(width: 30.0),
                            Text(
                              "Forgot Password ?",
                              style: TextStyle(
                                color: Colors.pink[500],
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        RaisedButton(
                          onPressed: () {},
                          color: Colors.pink[500],
                          elevation: 0.0,
                          padding: EdgeInsets.only(
                            left: 45.0,
                            right: 45.0,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(14.0),
                          ),
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 17.0,
                            ),
                          ),
                        ),
                        Text("or"),
                        SizedBox(
                          height: 10.0,
                        ),
                        Text(
                          "Register now",
                          style: TextStyle(
                            decoration: TextDecoration.underline,
                            color: Colors.pink[500],
                            fontSize: 15.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
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
