import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

void smsApi(phoneNo, message) async {
  print(phoneNo + ':' + message);
  http.Response response;
  try {
    response = await http.post(
      Uri.parse("https://inteltech.p.rapidapi.com/send.php"),
      body: {
        "sms": phoneNo,
        "message": message,
        "senderid": "Petronas",
        "key": "D3038660-ECBE-AE2C-4AF9-BE32980AC1E6",
        "username": "bosoxi3533@miqlab.com"
      },
      headers: {
        "content-type": "application/x-www-form-urlencoded",
        "X-RapidAPI-Key": "43ca21b1e1msh81aa2e6f1df42a9p19d28ejsnd155bc5d6652",
        "X-RapidAPI-Host": "inteltech.p.rapidapi.com"
      },
    );
  } catch (e) {
    log(e.toString());
  }
}
