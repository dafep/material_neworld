import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Auth {
  static Widget handleAuth(Widget index, Widget mainAppController) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        return (!snapshot.hasData) ? index : mainAppController;
      },
    );
  }
}