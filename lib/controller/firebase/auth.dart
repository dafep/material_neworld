import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:material_neworld/controller/firebase/call.dart';
import 'package:material_neworld/controller/firebase/constant/message.dart';
import 'package:material_neworld/controller/firebase/modeDebug.dart';

class Auth {
  static Widget handleAuth(Widget index, Widget mainAppController) {
    return StreamBuilder<FirebaseUser>(
      stream: FirebaseAuth.instance.onAuthStateChanged,
      builder: (context, snapshot) {
        return (!snapshot.hasData) ? index : mainAppController;
      },
    );
  }

  static Future<dynamic> authSignIn({String email, String password, bool debugMode, context}) async {
    FocusScope.of(context).requestFocus(FocusNode());

    final response = await Call.signIn(
      email: email,
      password: password
    );

    if (response == "OK")
      return SUCCESS;
    else {
      if (debugMode == true)
        ModeDebug.errorAlert(response, context);
      return response;
    }
  }

  static Future<dynamic> authSignUp({String email, String password, Map<String, dynamic> map, bool debugMode, context, String cloud}) async {
    FocusScope.of(context).requestFocus(FocusNode());

    final response = await Call.signUp(
      email: email,
      password: password,
      map: map,
      cloud: cloud
    );

    if (response == "OK")
      return SUCCESS;
    else {
      if (debugMode == true)
        ModeDebug.errorAlert(response, context);
      return response;
    }
  }

  static authLogOut() async {
    return await Call.logOutAuth();
  }

  static currentUser() async {
    return await Call.currentUser();
  }
}