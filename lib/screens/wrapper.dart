import 'package:flutter/material.dart';
import 'package:mysocial/models/user.dart';
import 'package:mysocial/screens/authenticate/authenticate.dart';
import 'package:mysocial/screens/home/home.dart';
import 'package:provider/provider.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final user = Provider.of<MegaUser?>(context);
    return user == null ? Authenticate() : Home();
  }
}
