import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ipad_qr_scan_frontend/apis/cameraApi.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:lottie/lottie.dart';
import 'dart:math';
// import '../apis/smsApi.dart';
import '../configs/visitorSticker.dart';
import 'dart:io';

class PrintingMP extends StatefulWidget {
  PrintingMP({super.key, this.userName, this.image});

  String? userName;
  File? image;

  @override
  State<PrintingMP> createState() => _PrintingMPState();
}

class _PrintingMPState extends State<PrintingMP> {
  int status = 0;
  @override
  Widget build(BuildContext context) {
    print('NOHHH');
    print(widget.userName);
    int intValue = Random().nextInt(4);
    List images = const [
      'assets/visitor_sticker_A6.png',
      'assets/visitor_sticker_A6(1).png',
      'assets/visitor_sticker_A6(2).png',
      'assets/visitor_sticker_A6(3).png',
      'assets/visitor_sticker_A6(4).png',
    ];
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
    final tween = MovieTween()
      ..tween('y', Tween<double>(begin: 0, end: height * .7),
          duration: const Duration(seconds: 4));
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
                  Navigator.of(context).popUntil((route) => route.isFirst);
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
        body: status == 0
            ? Center(
                child: Column(
                  children: [
                    SizedBox(height: height * .12),
                    Text(
                      'Almost there!',
                      style: TextStyle(fontSize: width * .04),
                    ),
                    SizedBox(height: height * .025),
                    Text(
                      ' Your badge is being printed..',
                      style: TextStyle(
                          fontWeight: FontWeight.bold, fontSize: width * .05),
                    ),
                    SizedBox(height: height * .025),
                    CustomAnimationBuilder(
                        tween: tween, // Pass in tween
                        duration: tween.duration, // Obtain duration
                        builder: (context, value, child) {
                          return Transform.translate(
                            // Get animated offset
                            offset: Offset(0, value.get('y')),
                            child: Card(
                              elevation: 8,
                              shadowColor: Colors.black,
                              // child: Image.asset(
                              //   images[intValue],
                              //   height: height * .3,
                              // ),
                              child: visitorSticker(context, intValue,
                                  widget.userName, widget.image),
                            ),
                          );
                        },
                        onCompleted: () => {
                              setState(() {
                                status = 1;
                              }),
                              // smsApi("+60169867645",
                              //     "Hi Mr/Ms, your visitor already registered"),
                            }),
                  ],
                ),
              )
            : Stack(
                children: [
                  visitorSticker(context, intValue,
                                  widget.userName, widget.image)
                ],
              ));
  }
}
