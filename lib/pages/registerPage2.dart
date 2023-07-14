import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ipad_qr_scan_frontend/apis/visitorApi.dart';

class RegisterPage2 extends StatefulWidget {
  RegisterPage2(
      {Key? key, required this.name, required this.email, required this.ic})
      : super(key: key);
  final String name, email, ic;

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Hi ${widget.name}!',
            style: TextStyle(
                color: const Color(0XFF101828),
                fontSize: MediaQuery.of(context).size.width * .05,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .02,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            alignment: Alignment.centerLeft,
            child: Text(
              "Who are your meeting today?",
              style: TextStyle(
                  color: const Color(0XFF101828),
                  fontSize: MediaQuery.of(context).size.width * .03,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            // child: DropdownButton(items: visitors, onChanged: onChanged),
          ),
        ],
      )),
    );
  }
}
