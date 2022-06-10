import 'package:flutter/material.dart';
import 'package:mysocial/screens/authenticate/authenticate.dart';
import 'package:mysocial/screens/wrapper.dart';
import 'package:mysocial/services/auth.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';

dynamic main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // Options are for web.
  await Firebase.initializeApp(
      //options: FirebaseOptions(
      //  apiKey: "XXX",
      //  appId: "XXX",
      //  messagingSenderId: "XXX",
      //  projectId: "XXX",
      //),
      );
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return StreamProvider.value(
      value: AuthService().user,
      catchError: (_, __) {},
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
        home: Wrapper(),
      ),
    );
  }
}
