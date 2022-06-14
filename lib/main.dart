import 'dart:ui';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mysocial/models/user.dart';
import 'package:mysocial/screens/authenticate/authenticate.dart';
import 'package:mysocial/screens/wrapper.dart';
import 'package:mysocial/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  DartPluginRegistrant.ensureInitialized();

  // Options are for web.
  await Firebase.initializeApp(
    // name: "mysocial",
    // //Android
    //options: FirebaseOptions(
    //  apiKey: "AIzaSyBOGw6Ryp4_HDe94TKhcztkMAMQNu6xAwc",
    //  appId: "1:202413675237:android:d0c9688ae23f4798bb3a0c",
    //  messagingSenderId: "202413675237",
    //  projectId: "mysocial-c3703",
    //  authDomain: "mysocial-c3703.firebaseapp.com",
    //),
    //Web
    options: FirebaseOptions(
      apiKey: "AIzaSyBOGw6Ryp4_HDe94TKhcztkMAMQNu6xAwc",
      appId: "1:202413675237:android:d0c9688ae23f4798bb3a0c",
      messagingSenderId: "202413675237",
      projectId: "mysocial-c3703",
      authDomain: "mysocial-c3703.firebaseapp.com",
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<MegaUser?>.value(
      catchError: (_, __) => null,
      value: AuthService().user,
      initialData: null,
      child: MaterialApp(
        // initialRoute
        // routes: {
        //   '/': (context) => Loading(),
        //   '/home': (context) => Home(),
        //   '/authenticate': (context) => Home(), // It must be authenticate.
        // },
        debugShowCheckedModeBanner: false,
        // Return home or authenticate

        theme: ThemeData(),

        home: Wrapper(),
        builder: EasyLoading.init(),
      ),
    );
  }
}
