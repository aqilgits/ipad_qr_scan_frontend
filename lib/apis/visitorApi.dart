import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

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

Future<List<String>> fetchMeeting(body) async {
  List<String> visitors = [];
  try {
    http.Response response = await http.get(
      Uri.parse("http://10.0.2.2:5000/api/v1/meeting/$body"),
      headers: {
        "Accept": "application/json",
        "content-type": "application/json"
      },
    );
    var jsonData = json.decode(response.body) as List;
    for (var element in jsonData) {
      visitors.add(element["email"]);
    }
    print(visitors);
  } catch (e) {
    log(e.toString());
  }
  return visitors;
}
