import 'package:flutter/material.dart';

class DeviceSize {
  static DeviceSize config = DeviceSize();
  double mobileMaxWidth;
  double desktopMinWidth;
  DeviceSize({this.mobileMaxWidth = 650, this.desktopMinWidth = 1100});
}

class DeviceScreen extends StatelessWidget {
  final Widget mobile;
  final Widget tablet;
  final Widget desktop;

  const DeviceScreen({
    required this.mobile,
    Widget? tablet,
    Widget? desktop,
    super.key,
  })  : tablet = tablet ?? mobile,
        desktop = desktop ?? tablet ?? mobile;

  // This isMobile, isTablet, isDesktop helep us later
  static bool isMobile(BuildContext context) =>
      MediaQuery.of(context).size.width < DeviceSize.config.mobileMaxWidth;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < DeviceSize.config.desktopMinWidth &&
      MediaQuery.of(context).size.width >= DeviceSize.config.mobileMaxWidth;

  static bool isDesktop(BuildContext context) =>
      MediaQuery.of(context).size.width >= DeviceSize.config.desktopMinWidth;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 1100 then we consider it a desktop
      builder: (context, constraints) {
        if (constraints.maxWidth >= DeviceSize.config.desktopMinWidth) {
          return desktop;
        }
        // If width it less then 1100 and more then 650 we consider it as tablet
        else if (constraints.maxWidth >= DeviceSize.config.mobileMaxWidth) {
          return tablet;
        }
        // Or less then that we called it mobile
        else {
          return mobile;
        }
      },
    );
  }
}
