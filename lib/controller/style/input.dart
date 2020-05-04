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
  final double widthBorder;
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
    this.widthBorder,
    this.borderColor,
  });

  @override
  Widget build(BuildContext context) {
    return new Container(
      width: width ?? MediaQuery.of(context).size.width,
      height: height ?? 50,
      decoration: BoxDecoration(
        color: backgroundColor ?? Colors.transparent,
        borderRadius: BorderRadius.all(
          Radius.circular(radius ?? 0),
        ),
        border: Border.all(width: widthBorder ?? 0, color: borderColor ?? Colors.transparent)
      ),
      child: new Center(
        child: new Padding(
          padding: const EdgeInsets.only(left: 10, right: 10),
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
      ),
    );
  }
}