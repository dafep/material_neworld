import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:material_neworld/controller/firebase/cloud.dart';

class Image {
  static gallery({String uploadTable, String me, Map<String, dynamic> map}) async {
    final _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    var compress = await FlutterImageCompress.compressWithFile(
      _image.absolute.path,
      minWidth: 500,
      minHeight: 500,
      quality: 85,
    );
    Cloud.uploadImage(
      image: compress,
      me: me,
      uploadTable: uploadTable,
      map: map,
    );
  }

  static camera({String uploadTable, String me, Map<String, dynamic> map}) async {
    final _image = await ImagePicker.pickImage(source: ImageSource.camera);

    var compress = await FlutterImageCompress.compressWithFile(
      _image.absolute.path,
      minWidth: 500,
      minHeight: 500,
      quality: 85,
    );
    Cloud.uploadImage(
      image: compress,
      me: me,
      uploadTable: uploadTable,
      map: map,
    );
  }
}