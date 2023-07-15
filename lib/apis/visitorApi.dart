import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

import '../models/meetingModel.dart';
import '../models/visitorModel.dart';

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

Future<Meeting> fetchMeeting(body) async {
  dynamic response;
  try {
    response = await http.get(
      Uri.parse("http://10.0.2.2:5000/api/v1/meeting/$body"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    print(jsonDecode(response.body));
  } catch (e) {
    log(e.toString());
  }
  return Meeting.fromJson(jsonDecode(response.body));
}
