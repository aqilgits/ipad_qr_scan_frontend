import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:ipad_qr_scan_frontend/pages/meetingDetailsPage.dart';

class RegisterPage2 extends StatefulWidget {
  const RegisterPage2(
      {Key? key, required this.name, required this.email, required this.ic})
      : super(key: key);
  final String name, email, ic;

  @override
  State<RegisterPage2> createState() => _RegisterPage2State();
}

class _RegisterPage2State extends State<RegisterPage2> {
  String dropdownvalue = 'Lisa Chan';

  var hosts = [
    'Lisa Chan',
    'Patreena',
    'Patshi Acharya',
    'Patrick Loo',
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
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
        toolbarHeight: height * .08,
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
                      style:
                          TextStyle(color: Colors.white, fontSize: width * .02),
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
            'Welcome ${widget.name}!',
            style: TextStyle(
                color: const Color(0XFF101828),
                fontSize: MediaQuery.of(context).size.width * .05,
                fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .01,
          ),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            alignment: Alignment.centerLeft,
            child: Text(
              "Who's your host?",
              style: TextStyle(
                color: const Color(0XFF101828),
                fontSize: MediaQuery.of(context).size.width * .03,
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width * .8,
            padding: EdgeInsets.symmetric(
              horizontal: MediaQuery.of(context).size.width * .01,
              vertical: MediaQuery.of(context).size.height * .01,
            ),
            decoration: BoxDecoration(
              color: Colors.transparent,
              border: Border.all(
                color: Colors.grey,
                width: 3,
              ),
              borderRadius: BorderRadius.circular(10),
            ),
            child: DropdownButton(
              isExpanded: true,
              underline: const SizedBox(),
              value: dropdownvalue,
              icon: const Icon(Icons.keyboard_arrow_down),
              items: hosts.map((String host) {
                return DropdownMenuItem(
                  value: host,
                  child: Text(host),
                );
              }).toList(),
              onChanged: (String? newValue) {
                setState(() {
                  dropdownvalue = newValue!;
                });
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => MeetingDetailsPage(
                            name: dropdownvalue,
                          )),
                );
              },
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * .03,
          ),
        ],
      )),
    );
  }
}
