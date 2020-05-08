import 'package:flutter/material.dart';

class Box extends StatelessWidget {
  final double width;
  final double height;
  final String image;
  final Color color;
  final Widget child;

  Box({
    this.width,
    this.height,
    this.image,
    this.color,
    this.child,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width ?? MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        color: color ?? Colors.transparent,
      ),
      child: child ?? new Container(),
    );
  }
}