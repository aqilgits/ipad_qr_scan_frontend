import 'dart:developer';
import 'package:ipad_qr_scan_frontend/models/visitorModel.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

Future<http.Response?> createVisitor(body) async {
  print(body);
  http.Response? response;
  try {
    response = await http.post(Uri.parse("http://10.0.2.2:5000/api/v1/visitor"),
        headers: {
          "Accept": "application/json",
          "content-type": "application/json"
        },
        body: body);
  } catch (e) {
    log(e.toString());
  }
  return response;
}
