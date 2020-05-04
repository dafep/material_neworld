import 'package:flutter/material.dart';

class Input extends StatelessWidget {
  final double width;
  final double height;
  final TextEditingController controller;
  final String placeholder;
  final TextInputType inputType;
  final bool obscure;
  final Color backgroundColor;
  final double radius;
  final double widthBorderTop;
  final double widthBorderBottom;
  final double widthBorderLeft;
  final double widthBorderRight;
  final double padding;
  final Color borderColor;

  Input({
    this.width,
    this.height,
    @required this.controller,
    this.placeholder,
    this.inputType,
    this.obscure,
    this.backgroundColor,
    this.radius,
    this.widthBorderTop,
    this.widthBorderBottom,
    this.widthBorderLeft,
    this.widthBorderRight,
    this.borderColor,
    this.padding,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50,
      padding: EdgeInsets.all(padding ?? 0),
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 0),
        ),
        border: Border(
          top: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: widthBorderTop ?? 0,
          ),
          bottom: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: widthBorderBottom ?? 0,
          ),
          left: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: widthBorderLeft ?? 0,
          ),
          right: BorderSide(
            color: borderColor ?? Colors.transparent,
            width: widthBorderRight ?? 0,
          ),
        ),
      ),
      child: new Center(
        child: new TextField(
          controller: controller,
          decoration: InputDecoration(
            border: InputBorder.none,
            hintText: placeholder,
          ),
          keyboardType: inputType ?? TextInputType.text,
          obscureText: obscure ?? false,
        ),
      ),
    );
  }
}