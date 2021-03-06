// ignore_for_file: deprecated_member_use

import 'package:auth_buttons/auth_buttons.dart';
import 'package:eva_icons_flutter/eva_icons_flutter.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:mysocial/certs/terms_and_conditions.dart';
import 'package:mysocial/models/mega.dart';
import 'package:mysocial/models/user.dart';
import 'package:mysocial/screens/authenticate/login.dart';
import 'package:mysocial/screens/home/home.dart';
import 'package:mysocial/services/auth.dart';
import 'package:mysocial/services/database.dart';
import 'package:mysocial/shared/forms/containerTextInputShadow.dart';
import 'package:mysocial/shared/loading.dart';
import 'package:mysocial/shared/shapes/bottom_wave.dart';
import 'package:mysocial/shared/shapes/wave.dart';
import 'package:flutter_signin_button/flutter_signin_button.dart';
import 'package:provider/provider.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  State<Register> createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  bool isAgree = false;
  bool mustBeAgree = false;
  bool loading = false;
  MegaUserData? mega_user_data = MegaUserData();
  TextEditingController username = TextEditingController();
  TextEditingController fullname = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  MegaUserData? user_data;

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool isValidate = true;

  Future<String>? data;

  @override
  Widget build(BuildContext context) {
    Size device_size = MediaQuery.of(context).size;

    return loading
        ? Loading()
        : StreamProvider<List<Mega>?>.value(
            initialData: [],
            value: DatabaseService().mega,
            child: SafeArea(
              child: Scaffold(
                backgroundColor: Color.fromARGB(255, 235, 246, 252),
                body: ListView.builder(
                  addRepaintBoundaries: false,
                  itemCount: 1,
                  itemBuilder: ((context, index) => FutureBuilder<String>(
                      future: terms_conditions(),
                      builder: (context, snapshot) {
                        {
                          return Stack(
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
                                  height: isValidate
                                      ? device_size.height
                                      : device_size.height + 100,
                                  child: CustomPaint(
                                    painter: BottomWave(),
                                    child: Container(),
                                  ),
                                ),
                              ),
                              Center(
                                child: Container(
                                  padding: EdgeInsets.only(
                                      top: 190, left: 45.0, right: 45.0),
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
                                        SizedBox(height: 30.0),
                                        ContainerTextInputShadow(
                                          placeholder: "Username",
                                          icon: null,
                                          textAlign: TextAlign.center,
                                          controller: username,
                                          // validator: (username) => AuthService().isUsernameExist(username) ? "Username already taken" : null;
                                          validator2: (username) =>
                                              username!.isEmpty
                                                  ? "Username must be added"
                                                  : null,
                                        ),
                                        SizedBox(height: 10.0),
                                        ContainerTextInputShadow(
                                            placeholder: "Full name",
                                            icon: null,
                                            textAlign: TextAlign.center,
                                            controller: fullname,
                                            validator2: (fullname) => fullname!
                                                        .length <
                                                    5
                                                ? "Fullname must be at least 5 charecter"
                                                : null),
                                        SizedBox(height: 10.0),
                                        ContainerTextInputShadow(
                                          placeholder: "Email Address",
                                          icon: null,
                                          textAlign: TextAlign.center,
                                          controller: email,
                                          validator2: (email) => email!.isEmpty
                                              ? 'Enter an email'
                                              : null,
                                        ),
                                        SizedBox(height: 10.0),
                                        ContainerTextInputShadow(
                                          obscureText: true,
                                          placeholder: "Password",
                                          icon: null,
                                          textAlign: TextAlign.center,
                                          controller: password,
                                          validator2: (password) => password!
                                                      .length <
                                                  6
                                              ? 'Password must be more than 6 charecter!'
                                              : null,
                                        ),
                                        SizedBox(height: 10.0),
                                        Container(
                                          decoration: BoxDecoration(
                                            color: Colors.grey[50],
                                            borderRadius:
                                                BorderRadius.circular(20.0),
                                            boxShadow: [
                                              BoxShadow(
                                                color: Colors.grey
                                                    .withOpacity(0.3),
                                                spreadRadius: 5,
                                                blurRadius: 7,
                                                offset: Offset(0, 3),
                                              ),
                                            ],
                                          ),
                                          padding: EdgeInsets.only(
                                            bottom: mustBeAgree ? 10.0 : 0.0,
                                          ),
                                          child: Column(
                                            children: [
                                              Row(
                                                children: [
                                                  Expanded(
                                                      flex: 1,
                                                      child: SizedBox(
                                                          width: 30.0)),
                                                  Checkbox(
                                                    shape:
                                                        RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              7.0),
                                                    ),
                                                    side:
                                                        MaterialStateBorderSide
                                                            .resolveWith(
                                                      (states) => BorderSide(
                                                          width: 1.0,
                                                          color: Colors.green),
                                                    ),
                                                    value: this.isAgree,
                                                    onChanged: (value) {
                                                      setState(() {
                                                        this.isAgree = value!;
                                                      });
                                                    },
                                                    activeColor: Colors.green,
                                                    checkColor: Colors.white,
                                                  ),
                                                  Text(
                                                    "I Agree to",
                                                    textAlign: TextAlign.center,
                                                  ),
                                                  TextButton(
                                                    onPressed: () {
                                                      showTemrs(
                                                        context: context,
                                                        data: snapshot.data
                                                            .toString(),
                                                        onPressed: () {
                                                          setState(() {
                                                            isAgree = true;
                                                            mustBeAgree = false;
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                          });
                                                        },
                                                      );
                                                    },
                                                    child: Text(
                                                      "Terms & Conditions.",
                                                      style: TextStyle(
                                                        color: Colors.blue[500],
                                                        fontWeight:
                                                            FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Expanded(
                                                      flex: 1,
                                                      child: SizedBox(
                                                          width: 30.0)),
                                                ],
                                              ),
                                              Text(
                                                mustBeAgree
                                                    ? "Must be agree!"
                                                    : "",
                                                style: TextStyle(
                                                  color: Colors.redAccent[400],
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 10.0),
                                        Row(
                                          children: [
                                            Expanded(
                                                flex: 3, child: SizedBox()),
                                            TwitterAuthButton(
                                              // Buttons.Facebook,
                                              // mini: true,
                                              // elevation: 10.0,
                                              style: AuthButtonStyle(
                                                buttonType: AuthButtonType.icon,
                                                iconType: AuthIconType.outlined,
                                              ),
                                              onPressed: () async {
                                                //await _auth.signInWithFacebook();
                                              },
                                            ),
                                            Expanded(
                                                flex: 1, child: SizedBox()),
                                            RaisedButton(
                                              onPressed: () async {
                                                auth_check_register(context);
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
                                                "Sign up",
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 17.0,
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                                flex: 1, child: SizedBox()),
                                            GoogleAuthButton(
                                              //icon: Icon(
                                              //  EvaIcons.email,
                                              //  color: Colors.red,
                                              //  size: 40,
                                              //),
                                              style: AuthButtonStyle(
                                                buttonType: AuthButtonType.icon,
                                                iconType: AuthIconType.outlined,
                                              ),
                                              onPressed: () async {
                                                //await _auth
                                                //    .signInWithGitHub(context);
                                                final navigator =
                                                    Navigator.of(context);

                                                MegaUser result = MegaUser();
                                                try {
                                                  setState(() {
                                                    loading = true;
                                                  });
                                                  result = await _auth
                                                      .signInWithGoogle();
                                                } catch (e) {
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                }

                                                if (!result.uid.isEmpty) {
                                                  print("AM i here sir? ");
                                                  await EasyLoading.showSuccess(
                                                      'Logged in Successfully!');
                                                  navigator.pop();
                                                } else {
                                                  setState(() {
                                                    loading = false;
                                                  });
                                                  EasyLoading.showInfo(
                                                      'None account chosen!');
                                                }
                                              },
                                            ),
                                            Expanded(
                                                flex: 3, child: SizedBox()),
                                          ],
                                        ),
                                        SizedBox(height: 5.0),
                                        TextButton(
                                          onPressed: () async {
                                            final nav = Navigator.of(context);
                                            nav.pop();
                                            //await Navigator.push(
                                            //    context,
                                            //    MaterialPageRoute(
                                            //      builder: (context) =>
                                            //          const Login(),
                                            //    ));
                                          },
                                          child: Text(
                                            "I'm already a member",
                                            style: TextStyle(
                                              color: Colors.lightGreen[500],
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
                          );
                        }
                      })),
                ),
              ),
            ),
          );
  }

  void auth_check_register(BuildContext context) async {
    final navigator = Navigator.of(context); // store the Navigator

    if (_formKey.currentState!.validate()) {
      setState(() => loading = true);
      if (!isAgree) {
        setState(() {
          mustBeAgree = true;
          isValidate = false;
          loading = false;
        });
      } else {
        setState(() {
          isValidate = true;
          mustBeAgree = false;
        });

        MegaUser? result = MegaUser();
        try {
          // final mega = await Provider.of<List<Mega>>(context);
          // mega.forEach(
          //   (meg) {
          //     print("${meg.username} - ${username.text}");
          //     if (meg.username == username.text) {
          //       print("Username is exist man!");
          //     }
          //   },
          // );
          result = await _auth.registerWithEmailAndPassword(
            email: email.text,
            password: password.text,
            fullname: fullname.text,
            username: username.text,
          );
        } catch (e) {
          print(e);
        }
        if (result == null) {
          // show the error.
          setState(() {
            loading = false;
          });
        } else {
          print("Should get back!");
          EasyLoading.showSuccess("Registered Successful!");
          navigator.pop();
        }
      }
    } else {
      setState(() {
        isValidate = false;
      });
    }
  }
}
