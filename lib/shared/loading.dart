import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Center(
          child: SpinKitSpinningLines(
            size: 100,
            itemCount: 15,
            color: Colors.amber,
            duration: Duration(seconds: 5),
          ),
        ),
      ),
    );
  }
}
