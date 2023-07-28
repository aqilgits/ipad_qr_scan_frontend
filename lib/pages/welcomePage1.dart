import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipad_qr_scan_frontend/apis/cameraApi.dart';
import 'package:ipad_qr_scan_frontend/pages/previewPage.dart';
import 'dart:convert';
import 'package:lottie/lottie.dart';
import '../configs/visitorSticker.dart';

class WelcomePage1 extends StatefulWidget {
  const WelcomePage1(
      {Key? key, this.visitor_email, this.visitor_nric, this.visitor_name})
      : super(key: key);
  final String? visitor_email;
  final String? visitor_nric;
  final String? visitor_name;
  @override
  State<WelcomePage1> createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Widget svgPetronas =
        SvgPicture.asset('assets/petronas-logo-white.svg', width: width * .16);
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Color(0XFF00A19C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
    final ButtonStyle style1 = ElevatedButton.styleFrom(
      fixedSize: Size(width * .3, height * .06),
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
              Text('Welcome, ${widget.visitor_name}!',
                  style: TextStyle(
                      fontSize: width * .05,
                      fontWeight: FontWeight.bold,
                      color: Color(0XFF101828))),
              Container(
                height: height * .3,
                width: width * .5,
                child: Lottie.asset('assets/animation_lklf2f5o.json'),
              ),
              Text(
                  'To verify your identity, we will \n take a photo of your face',
                  style: TextStyle(
                      fontSize: width * .03, color: Color(0XFF101828)),
                  textAlign: TextAlign.center),
              SizedBox(
                height: height * .06,
              ),
              ElevatedButton(
                  style: style1,
                  onPressed: () async {
                    final data = await pickImage();
                    if (data != null) {
                      print(data);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => PreviewPage(
                              imageFile: data,
                              userIC: widget.visitor_nric,
                              userName: widget.visitor_name,
                              userEmail: widget.visitor_email)),
                        ),
                      );
                    }
                  },
                  child: Text(
                    'Okay',
                    style:
                        TextStyle(color: Colors.white, fontSize: width * .03),
                  )),
            ],
          ),
        ));
  }
}
