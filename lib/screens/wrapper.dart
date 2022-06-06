import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysocial/screens/authenticate/authenticate.dart';
import 'package:mysocial/screens/home/home.dart';
import 'package:mysocial/shared/loading.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // initialRoute
      // routes: {
      //   '/': (context) => Loading(),
      //   '/home': (context) => Home(),
      //   '/authenticate': (context) => Home(), // It must be authenticate.
      // },
      debugShowCheckedModeBanner: false,
      // Return home or authenticate
      home: Authenticate(),
    );
  }
}
