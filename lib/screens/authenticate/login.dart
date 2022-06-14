// ignore_for_file: deprecated_member_use

import 'package:auth_buttons/auth_buttons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:mysocial/models/user.dart';
import 'package:mysocial/screens/authenticate/register.dart';
import 'package:mysocial/services/auth.dart';
import 'package:mysocial/shared/Animations/page_route_animation.dart';
import 'package:mysocial/shared/forms/containerTextInputShadow.dart';
import 'package:mysocial/shared/loading.dart';
import 'package:mysocial/shared/shapes/bottom_wave.dart';
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
  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool isSuccess = false;
  bool loading = false;
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    Size device_size = MediaQuery.of(context).size;
    print("width :${device_size.width}\nheight:${device_size.height}");
    print("Back to login");
    return loading
        ? Loading()
        : SafeArea(
            child: Scaffold(
              // appBar: AppBar(
              //   backgroundColor: Colors.green[400],
              //   elevation: 0.0,
              //   title: Text('Sign in'),
              //   actions: <Widget>[
              //     FlatButton.icon(
              //       onPressed: () {
              //         Navigator.push(context,
              //             MaterialPageRoute(builder: (context) => Register()));
              //       },
              //       icon: Icon(
              //         Icons.switch_account_rounded,
              //         color: Colors.white,
              //       ),
              //       label: Text(
              //         "Register",
              //         style: TextStyle(color: Colors.white),
              //       ),
              //     ),
              //   ],
              // ),
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
                          opacity: 0.750,
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
                          opacity: 0.80,
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
                                EdgeInsets.only(top: 210, left: 45, right: 45),
                            child: Form(
                              key: _formKey,
                              child: Column(
                                children: [
                                  Wrap(
                                    crossAxisAlignment:
                                        WrapCrossAlignment.center,
                                    children: [
                                      Icon(Icons.music_note),
                                      Text(
                                        "  Mega Music",
                                        style: TextStyle(
                                          color: Colors.lightGreen[500],
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
                                    controller: email,
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
                                          borderRadius:
                                              BorderRadius.circular(3.0),
                                        ),
                                        side:
                                            MaterialStateBorderSide.resolveWith(
                                          (states) => BorderSide(
                                              width: 1.0, color: Colors.green),
                                        ),
                                        value: this.value,
                                        onChanged: (value) {
                                          setState(() {
                                            this.value = value!;
                                          });
                                        },
                                        activeColor: Colors.green,
                                        checkColor: Colors.white,

                                        // fillColor: Fill,
                                      ),
                                      Text("Remember me"),
                                      // Making it responsive.
                                      Expanded(
                                        flex: 1,
                                        child: SizedBox(),
                                      ),
                                      TextButton(
                                        onPressed: () {},
                                        child: Text(
                                          "Forgot Password ?",
                                          style: TextStyle(
                                            color: Colors.lightGreen[500],
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(height: 20.0),
                                  Row(
                                    children: [
                                      Expanded(flex: 3, child: SizedBox()),
                                      TwitterAuthButton(
                                        // Buttons.Facebook,
                                        // mini: true,
                                        // elevation: 10.0,
                                        style: AuthButtonStyle(
                                          buttonType: AuthButtonType.icon,
                                          iconType: AuthIconType.outlined,
                                        ),
                                        onPressed: () async {
                                          //setState(() {
                                          //  loading = true;
                                          //});
                                        //  MegaUser? result = MegaUser();
                                        //  try {
                                        //    //result = await _auth
                                        //    //    .signInWithFacebook();
                                        //  } catch (e) {
                                        //    setState(() {
                                        //      loading = false;
                                        //    });
                                        //  }

                                        //  if (result != null) {
                                        //    print("AM i here sir? ");
                                        //    await EasyLoading.showSuccess(
                                        //        'Logged in Successfully!');
                                        //  } else {
                                        //    setState(() {
                                        //      loading = false;
                                        //    });
                                        //    EasyLoading.showInfo(
                                        //        'None account chosen!');
                                        //  }
                                        },
                                      ),
                                      Expanded(flex: 1, child: SizedBox()),
                                      RaisedButton(
                                        onPressed: () async {
                                          auth_check_login(context);
                                        },
                                        color: Colors.lightGreen[500],
                                        elevation: 10.0,
                                        padding: EdgeInsets.only(
                                          left: 45.0,
                                          right: 45.0,
                                          top: 13.0,
                                          bottom: 13.0,
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(14.0),
                                        ),
                                        child: Text(
                                          "Sign in",
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 17.0,
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 1, child: SizedBox(width: 10)),
                                      GoogleAuthButton(
                                        // icon: Icon(
                                        //   EvaIcons.email,
                                        //   size: 40,
                                        //   color: Colors.red,
                                        // ),

                                        style: AuthButtonStyle(
                                          buttonType: AuthButtonType.icon,
                                          iconType: AuthIconType.secondary,
                                        ),
                                        onPressed: () async {
                                          setState(() {
                                            loading = true;
                                          });
                                          MegaUser result = MegaUser();
                                          try {
                                            result =
                                                await _auth.signInWithGoogle();
                                          } catch (e) {
                                            setState(() {
                                              loading = false;
                                            });
                                          }

                                          if (!result.uid.isEmpty) {
                                            print("AM i here sir? ");
                                            await EasyLoading.showSuccess(
                                                'Logged in Successfully!');
                                          } else {
                                            setState(() {
                                              loading = false;
                                            });
                                            await EasyLoading.showInfo(
                                                'None account chosen!');
                                          }
                                        },
                                      ),
                                      Expanded(flex: 3, child: SizedBox()),
                                    ],
                                  ),
                                  const SizedBox(height: 4.0),
                                  const Text("or"),
                                  TextButton(
                                    onPressed: () async {
                                      await Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  const Register()));
                                      //Navigator.of(context).push(
                                      //  page_route_animated(
                                      //    pageBuilder: (context, animation,
                                      //            secondaryAnimation) =>
                                      //        const Register(),
                                      //  ),
                                      //);
                                    },
                                    autofocus: true,
                                    child: Text(
                                      "Register now",
                                      style: TextStyle(
                                        decoration: TextDecoration.underline,
                                        color: Colors.lightGreen[500],
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

  void auth_check_login(BuildContext context) async {
    final navigator = Navigator.of(context);

    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      MegaUser? result = MegaUser();
      try {
        result = await _auth.signInWithEmailAndPassword(
            email: email.text, password: password.text);
      } catch (e) {
        print(e);
      }

      if (result == null) {
        setState(() => loading = false);
        EasyLoading.showError('Failed to login!');
      } else {
        //await EasyLoading.show(
        //    status: "Loading");
        EasyLoading.showSuccess('Logged in Successfully!');

        setState(() => loading = false);
      }
    }
  }
}
