import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ipad_qr_scan_frontend/apis/visitorApi.dart';
import 'package:ipad_qr_scan_frontend/models/meetingModel.dart';
import 'package:ipad_qr_scan_frontend/models/visitorModel.dart';
import 'package:flutter_svg/flutter_svg.dart';
class RegisterPage2 extends StatefulWidget {
  RegisterPage2(
      {Key? key, required this.name, required this.email, required this.ic})
      : super(key: key);
  final String name, email, ic;
  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  Future<Meeting> getVisitor() {
    Future<Meeting> visitor = fetchMeeting(widget.ic);
    return visitor;
  }

  @override
  void initState() {
    super.initState();
    getVisitor();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final Widget svgPetronas =
        SvgPicture.asset('assets/petronas-logo-white.svg', width: width * .2);
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Color(0XFF00A19C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Color(0XFF222222),
          title: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              ElevatedButton(
                style: style,
                onPressed: () {
                  Navigator.of(context)
                    ..pop()
                    ..pop();
                },
                child: Center(
                  child: Row(
                    children: [
                      Icon(
                        Icons.arrow_back,
                        size: width * .02,
                        color: Colors.white,
                      ),
                      SizedBox(width: width * .01),
                      Text(
                        'Go Back',
                        style: TextStyle(
                            color: Colors.white, fontSize: width * .02),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8),
                child: Align(child: svgPetronas),
              ),
            ],
          ),
        ),
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
            height: MediaQuery.of(context).size.height * .01,
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
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF00A19C), width: 3.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            alignment: Alignment.centerLeft,
            child: Text(
              "Time",
              style: TextStyle(
                  color: const Color(0XFF101828),
                  fontSize: MediaQuery.of(context).size.width * .03,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF00A19C), width: 3.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .5,
            alignment: Alignment.centerLeft,
            child: Text(
              "Venue",
              style: TextStyle(
                  color: const Color(0XFF101828),
                  fontSize: MediaQuery.of(context).size.width * .03,
                  fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
            width: MediaQuery.of(context).size.width * .5,
            child: SizedBox(
              width: MediaQuery.of(context).size.width * .5,
              child: TextField(
                decoration: InputDecoration(
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(width: 3, color: Colors.grey),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Color(0xFF00A19C), width: 3.0),
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                ),
              ),
            ),
          ),
        ],
      )),
    );
  }
}
