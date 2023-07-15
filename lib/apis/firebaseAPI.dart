import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';

class FirebaseApi {
  Future<String?> uploadFile(Reference destination, File file) async {
    String url1 = '';
    try {
      await destination.putFile(file).then((taskSnapshot) async {
        await destination.getDownloadURL().then((url) {
          url1 = url;
        });
      });
    } on FirebaseException catch (e) {
      print(e);
      return null;
    }
    return url1;
  }
}
