import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:material_neworld/controller/firebase/constant/message.dart';

class Call {
  static final auth = FirebaseAuth.instance;

  /* Auth */

  static signIn({String email, String password}) async {
    try {
      await auth.signInWithEmailAndPassword(
        email: email,
        password: password
      );
      return SUCCESS;
    } catch (e) {
      switch (e.code) {
        case ERROR_INVALID_EMAIL_SIGNIN:
          return ERROR_INVALID_EMAIL_MESSAGE_SIGNIN;
        case ERROR_WRONG_PASSWORD_SIGNIN:
          return ERROR_WRONG_PASSWORD_MESSAGE_SIGNIN;
        case ERROR_USER_NOT_FOUND_SIGNIN:
          return ERROR_USER_NOT_FOUND_MESSAGE_SIGNIN;
        case ERROR_USER_DISABLED_SIGNIN:
          return ERROR_USER_DISABLED_MESSAGE_SIGNIN;
        case ERROR_TOO_MANY_REQUESTS_SIGNIN:
          return ERROR_TOO_MANY_REQUESTS_MESSAGE_SIGNIN;
        case ERROR_OPERATION_NOT_ALLOWED_SIGNIN:
          return ERROR_OPERATION_NOT_ALLOWED_MESSAGE_SIGNIN;
        default:
          return UNDEFINED_ERROR_SIGNIN;
      }
    }
  }

  static signUp({String email, String password, Map<String, dynamic> map, String cloud}) async {
    try {
      await auth.createUserWithEmailAndPassword(email: email, password: password);
      if (map.isNotEmpty) {
        await setCloud(
          email: email,
          map: map,
          cloud: cloud
        );
      }
      return SUCCESS;
    } catch (e) {
      switch (e.code) {
        case ERROR_WEAK_PASSWORD_SIGNUP:
          return ERROR_WEAK_PASSWORD_SIGNUP_MESSAGE;
        case ERROR_INVALID_EMAIL_SIGNUP:
          return ERROR_INVALID_EMAIL_SIGNUP_MESSAGE;
        case ERROR_EMAIL_ALREADY_IN_USE_SIGNUP:
          return ERROR_EMAIL_ALREADY_IN_USE_SIGNUP_MESSAGE;
        default:
          return UNDEFINED_ERROR_SIGNUP;
      }
    }
  }

  static currentUser() async {
    final FirebaseUser currentUser = await auth.currentUser();
    return currentUser.email;
  }

  static logOutAuth() async {
    await auth.signOut();
    return SUCCESS;
  }

  /* Cloud */

  static setCloud({String email, String cloud, Map<String, dynamic> map}) async {
    try {
      await Firestore.instance.collection(cloud).document(email).setData(map);
      return (SUCCESS);
    } catch (e) {
      return (e);
    }
  }

  static updateCloud({String email, String cloud, Map<String, dynamic> map}) async {
    try {
      await Firestore.instance.collection(cloud).document(email).updateData(map);
      return (SUCCESS);
    } catch (e) {
      return e;
    }
  }
}