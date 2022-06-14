// ignore_for_file: deprecated_member_use

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:mysocial/models/mega.dart';
import 'package:mysocial/screens/home/mega_list.dart';
import 'package:mysocial/services/auth.dart';
import 'package:mysocial/services/database.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  AuthService _auth = AuthService();
  @override
  Widget build(BuildContext context) {
    print("Am i here ?");
    return StreamProvider<List<Mega>?>.value(
      value: DatabaseService().mega,
      initialData: const [],
      //child: MegaList(),
      child: Scaffold(
        appBar: AppBar(
          actions: [
            FlatButton(
              onPressed: () async {
                await _auth.signOut();
              },
              child: Text("Sign out"),
            )
          ],
        ),
        body: Center(
          child: RaisedButton(
            onPressed: () async {
              await _auth.signOut();
            },
          ),
        ),
      ),
    );
  }
}
