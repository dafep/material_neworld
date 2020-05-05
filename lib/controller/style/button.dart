import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final double width;
  final double height;
  final Function onPressed;
  final radius;
  final Color backgroundColor;
  final String value;
  final Color valueColor;
  final double valueSize;
  final List<BoxShadow> shadow;

  Button({
    this.width,
    this.height,
    @required this.onPressed,
    this.radius,
    this.backgroundColor,
    this.value,
    this.valueColor,
    this.valueSize,
    this.shadow,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.all(radius ?? 0),
        boxShadow: shadow ?? null,
      ),
      child: new MaterialButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(radius ?? 0),
        ),
        onPressed: onPressed,
        child: new Text(value, style: TextStyle(color: valueColor ?? Colors.white, fontSize: valueSize ?? 16)),
      ),
    );
  }
}