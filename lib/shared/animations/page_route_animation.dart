import 'package:flutter/cupertino.dart';
import 'package:mysocial/screens/authenticate/register.dart';

PageRouteBuilder page_route_animated({
  required RoutePageBuilder pageBuilder,
}) =>
    PageRouteBuilder(
      pageBuilder: pageBuilder,
      transitionsBuilder: (context, animation, secondaryAnimation, child) {
        const begin = Offset(0.0, 1.0);
        const end = Offset.zero;
        const curve = Curves.easeInOutCubicEmphasized;

        final tween = Tween(begin: begin, end: end);
        final curvedAnimation = CurvedAnimation(
          parent: animation,
          curve: curve,
        );

        return SlideTransition(
          position: tween.animate(curvedAnimation),
          child: child,
        );
      },
    );
