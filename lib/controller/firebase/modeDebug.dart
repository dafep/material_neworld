import 'package:flutter/material.dart';

class ModeDebug {
  static errorAlert(String error, context) {
    AlertDialog alert = AlertDialog(
      title: Text("Erreur"),
      content: Text(error),
      actions: <Widget>[
        FlatButton(
          child: new Text("OK"),
          onPressed: () => Navigator.pop(context),
        )
      ],
    );

    showDialog(
      context: context,
      builder: (BuildContext coontext) => alert
    );
  }
}