import 'package:material_neworld/controller/firebase/call.dart';
import 'package:material_neworld/controller/firebase/constant/message.dart';
import 'package:material_neworld/controller/firebase/modeDebug.dart';

class Cloud {
  /* Cloud */

  static cloudSet({String email, Map<String, dynamic> map, String cloud, bool debugMode, context}) async {
    final response = await Call.setCloud(
      email: email,
      map: map,
      cloud: cloud,
    );
    if (debugMode == true && response != "OK")
      ModeDebug.errorAlert(UNDEFINED_ERROR_CLOUD, context);
    return response;
  }

  static cloudUpdate({String email, Map<String, dynamic> map, String cloud, bool debugMode, context}) async {
    final response = await Call.updateCloud(
      email: email,
      map: map,
      cloud: cloud,
    );
    if (debugMode == true && response != "OK")
      ModeDebug.errorAlert(UNDEFINED_ERROR_CLOUD, context);
    return response;
  }
}