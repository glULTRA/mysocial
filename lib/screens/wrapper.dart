import 'package:flutter/material.dart';
import 'package:mysocial/models/user.dart';
import 'package:mysocial/screens/authenticate/authenticate.dart';
import 'package:mysocial/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print("back to wrapper");

    try {
      final user = Provider.of<MegaUser?>(context);
      print(user);
      return user == null ? Authenticate() : Home();
    } catch (e) {
      print("Why dude ? : ${e.toString()}");
      return Authenticate();
    }
  }
}
