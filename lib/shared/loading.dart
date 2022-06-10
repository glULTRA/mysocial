import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class Loading extends StatelessWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: EdgeInsets.only(top: 300),
        child: SpinKitSpinningLines(
          color: Colors.black,
          duration: Duration(seconds: 5),
        ),
      ),
    );
  }
}
