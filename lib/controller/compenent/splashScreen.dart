import 'package:flutter/material.dart';

class SplashScreen extends StatelessWidget {
  final Widget child;

  SplashScreen({
    @required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: child,
    );
  }
}