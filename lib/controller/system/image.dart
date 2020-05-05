import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:material_neworld/controller/firebase/cloud.dart';

class Image {
  static gallery({String uploadTable, String me, Map<String, dynamic> map}) async {
    final _image = await ImagePicker.pickImage(source: ImageSource.gallery);

    Cloud.uploadImage(
      image: _image,
      me: me,
      uploadTable: uploadTable,
      map: map,
    );
  }

  static camera({String uploadTable, String me, Map<String, dynamic> map}) async {
    final _image = await ImagePicker.pickImage(source: ImageSource.camera);

    Cloud.uploadImage(
      image: _image,
      me: me,
      uploadTable: uploadTable,
      map: map,
    );
  }
}