import 'package:firebase_storage/firebase_storage.dart';
import 'firebaseAPI.dart';

Future<String?> saveImage(image) async {
    FirebaseStorage storage = FirebaseStorage.instance;
    Reference ref = storage.ref().child("image${DateTime.now()}");
    FirebaseApi api = FirebaseApi();
    String? url = await api.uploadFile(ref, image);
    return url;
  }