import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  Body({@required this.child, this.height, this.width});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? MediaQuery.of(context).size.height,
        child: child,
      ),
    );
  }
}