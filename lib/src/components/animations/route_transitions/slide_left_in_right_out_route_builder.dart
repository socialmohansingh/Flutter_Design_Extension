import 'package:flutter_design_extension/flutter_design_extension.dart';
import 'package:flutter/cupertino.dart';

class SlideLeftInRightOutRouteBuilder extends PageRouteBuilder<dynamic> {
  final Widget slidingInChild;
  final Widget slidingOutChild;
  @override
  final RouteSettings settings;

  SlideLeftInRightOutRouteBuilder(
      {required this.slidingInChild,
      required this.slidingOutChild,
      required this.settings})
      : super(
          settings: settings,
          pageBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
          ) =>
              slidingInChild,
          transitionsBuilder: (
            BuildContext context,
            Animation<double> animation,
            Animation<double> secondaryAnimation,
            Widget child,
          ) =>
              Stack(
            children: <Widget>[
              SlideTransition(
                position: Tween<Offset>(
                  begin: Offset.zero,
                  end: const Offset(-1.0, 0.0),
                ).animate(animation),
                textDirection: context.getCurrentLanguageDirection(),
                child: slidingOutChild,
              ),
              SlideTransition(
                position: Tween<Offset>(
                  begin: const Offset(1.0, 0.0),
                  end: Offset.zero,
                ).animate(animation),
                textDirection: context.getCurrentLanguageDirection(),
                child: slidingInChild,
              )
            ],
          ),
        );
}
