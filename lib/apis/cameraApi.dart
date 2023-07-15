import 'package:image_picker/image_picker.dart';
import 'dart:io';

import 'package:ipad_qr_scan_frontend/apis/saveImage.dart';

File? image;

Future pickImage() async {
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.camera);
    if (image == null) return;
    final imageTemp = File(image.path);
    print('test');
    return imageTemp;
  } on Exception catch (e) {
    print('Failed to pick image: $e');
  }
}

Future storeImage(image) async {
   try {
    final imageStore = File(image.path);
    final url = await saveImage(imageStore);
    return url;
  } on Exception catch (e) {
    print('Failed to pick image: $e');
  }
}