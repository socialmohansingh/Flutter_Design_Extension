import 'package:flutter/material.dart';

class SlideUpRouteBuilder extends PageRouteBuilder<dynamic> {
  final Widget child;

  SlideUpRouteBuilder({required this.child})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => child,
          opaque: false,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) {
            const begin = Offset(0, 1);
            const end = Offset.zero;
            final tween = Tween(
              begin: begin,
              end: end,
            );
            return SlideTransition(
              position: animation.drive(tween),
              child: child,
            );
          },
        );
}
