import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final String imageUrl;
  final Color color;
  Body({@required this.child, this.height, this.width, this.imageUrl, this.color});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          color: color ?? Colors.transparent,
          image: DecorationImage(
            image: AssetImage(imageUrl ?? null),
            fit: BoxFit.cover,
          ),
        ),
        child: child,
      ),
    );
  }
}