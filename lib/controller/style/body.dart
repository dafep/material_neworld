import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final String imageUrl;
  final Color color;
  final List<Color> gradient;
  Body({@required this.child, this.height, this.width, this.imageUrl, this.color, this.gradient});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          gradient: LinearGradient(
            colors: gradient != null ? gradient : null,
          ),
        ),
        child: child,
      ),
    );
  }
}