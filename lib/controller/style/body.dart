import 'package:flutter/material.dart';

class Body extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final String imageUrl;
  Body({@required this.child, this.height, this.width, this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: new Container(
        width: width ?? MediaQuery.of(context).size.width,
        height: height ?? MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
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