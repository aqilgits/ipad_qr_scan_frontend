import 'package:image_picker/image_picker.dart';
import 'dart:io';

File? image;
Future pickImage() async {
  print('function invoked');
  try {
    final image = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (image == null) return;
    final imageTemp = File(image.path);
    return imageTemp;
  } on Exception catch (e) {
    print('Failed to pick image: $e');
  }
}
