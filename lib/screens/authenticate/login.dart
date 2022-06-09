// ignore_for_file: deprecated_member_use

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:mysocial/screens/authenticate/register.dart';
import 'package:mysocial/shared/forms/containerTextInputShadow.dart';
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

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

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
                    opacity: 0.60,
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
                      padding: EdgeInsets.only(top: 210, left: 35, right: 35),
                      child: Center(
                        child: Column(
                          children: [
                            Wrap(
                              crossAxisAlignment: WrapCrossAlignment.center,
                              children: [
                                Icon(Icons.music_note),
                                Text(
                                  "  Mega Music",
                                  style: TextStyle(
                                    color: Colors.pink[500],
                                    fontSize: 25.0,
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 2.0,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 27.0),
                            ContainerTextInputShadow(
                              placeholder: "Username",
                              icon: Icons.person_outline,
                              controller: username,
                            ),
                            SizedBox(height: 30.0),
                            ContainerTextInputShadow(
                              obscureText: true,
                              placeholder: "Password",
                              icon: Icons.lock_outline,
                              controller: password,
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
                                    (states) => BorderSide(
                                        width: 1.0, color: Colors.red),
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
                                // Making it responsive
                                SizedBox(
                                    width: (device_size.width * 0.05) + 30),
                                TextButton(
                                  onPressed: () {},
                                  child: Text(
                                    "Forgot Password ?",
                                    style: TextStyle(
                                      color: Colors.pink[500],
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.0),
                            Row(
                              children: [
                                SizedBox(width: 40.0),
                                SignInButton(
                                  Buttons.Facebook,
                                  mini: true,
                                  elevation: 10.0,
                                  onPressed: () {},
                                ),
                                RaisedButton(
                                  onPressed: () {
                                    showDialog(
                                      context: context,
                                      builder: (BuildContext context) {
                                        return AlertDialog(
                                          title: Text("helloworld"),
                                          content: Text(
                                              "username : ${username.text}\npassword : ${password.text}"),
                                        );
                                      },
                                    );
                                  },
                                  color: Colors.pink[500],
                                  elevation: 10.0,
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
                                    "Sign in",
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17.0,
                                    ),
                                  ),
                                ),
                                SignInButton(
                                  Buttons.GitHub,
                                  mini: true,
                                  elevation: 10.0,
                                  onPressed: () {},
                                ),
                              ],
                            ),
                            const SizedBox(height: 4.0),
                            const Text("or"),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => Register()));
                              },
                              autofocus: true,
                              child: Text(
                                "Register now",
                                style: TextStyle(
                                  decoration: TextDecoration.underline,
                                  color: Colors.pink[500],
                                  fontSize: 15.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ],
                        ),
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
