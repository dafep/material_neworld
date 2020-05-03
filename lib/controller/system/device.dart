import 'package:flutter/services.dart';

class Device {
  static portrait() {
    SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  }
}