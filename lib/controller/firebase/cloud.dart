import 'package:firebase_storage/firebase_storage.dart';
import 'package:material_neworld/controller/firebase/call.dart';
import 'package:material_neworld/controller/firebase/constant/message.dart';
import 'package:material_neworld/controller/firebase/modeDebug.dart';
import 'package:path/path.dart' as Path;

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

  static uploadImage({String me, image, String uploadTable, Map<String, dynamic> map}) async {
    StorageReference storageReference = FirebaseStorage.instance.ref().child(me + "/" + Path.basename(image.path) + DateTime.now().toString());
    StorageUploadTask uploadTask = storageReference.putFile(image);
    await uploadTask.onComplete;
    storageReference.getDownloadURL().then((value) {
      cloudUpdate(
        email: me,
        debugMode: false,
        cloud: uploadTable,
        map: map,
      );
    });
  }
}