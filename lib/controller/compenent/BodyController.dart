import 'package:flutter/material.dart';

class BodyController extends StatelessWidget {
  final Widget appBar;
  final Widget body;
  final bottomNavigationBar;

  BodyController({
    this.appBar,
    @required this.body,
    this.bottomNavigationBar,
  });

  Widget build(BuildContext context) {
    return Stack(
      children: [
        appBar != null ? Positioned(
          left: 0,
          top: 0,
          right: 0,
          bottom: 0,
          child: appBar,
        ) : new Container(),
        body != null ? Positioned(
          top: 0,
          left: 0,
          right: 0,
          child: body,
        ) : new Container(),
        bottomNavigationBar != null ? Positioned(
          left: 0,
          right: 0,
          bottom: 0,
          child: bottomNavigationBar,
        ) : new Container(),
      ],
    );
  }
}