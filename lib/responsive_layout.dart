import 'package:flutter/material.dart';

class ResponsiveLayout extends StatelessWidget {
  const ResponsiveLayout({
    Key? key,
    required this.mobileBody,
    required this.tabletBody,

  }) : super(key: key);

  final Widget mobileBody;
  final Widget tabletBody;

  static bool isTablet(BuildContext context) =>
      MediaQuery.of(context).size.width < 1100 &&
          MediaQuery.of(context).size.width >= 700;

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      // If our width is more than 800 then we consider it a desktop
      builder: (context, constraints) {

        if (constraints.maxWidth >= 650) {
          return tabletBody;
        }
        // Or less then that we called it mobile
        else {
          return mobileBody;
        }
      },
    );
  }
}
