import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

Widget visitorSticker(BuildContext context, int count) {
  List images = const [
    'assets/bottom-1.png',
    'assets/bottom-2.png',
    'assets/bottom-3.png',
    'assets/bottom-4.png',
    'assets/bottom-5.png',
  ];
  double width = MediaQuery.of(context).size.width;
  double height = MediaQuery.of(context).size.height;
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.circular(width * .015)),
    ),
    width: width * .4,
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: EdgeInsets.all(width * .02),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Rachel",
                style: TextStyle(
                    fontSize: width * .05, fontWeight: FontWeight.bold),
              ),
              Text(
                "How",
                style: TextStyle(
                    fontSize: width * .03, fontWeight: FontWeight.bold),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Core Tech Sdn Bhd"),
                      Text("Host: Lisa Chan, Stack Sdn Bhd"),
                      Text("Meeting Room E, Tower 2, Level 7"),
                    ],
                  ),
                  Image.asset(
                    'assets/Ellipse2.png',
                    width: width * .07,
                  ),
                ],
              ),
            ],
          ),
        ),
        Container(
          height: height * .22,
          child: Stack(
            children: [
              SizedBox(
                  width: width,
                  child: Image.asset(
                    images[count],
                    fit: BoxFit.fill,
                  )),
              Positioned(
                  width: width * .4,
                  bottom: -3,
                  right: 0,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.black,
                        borderRadius: BorderRadius.only(
                            bottomLeft: Radius.circular(width * .015),
                            bottomRight: Radius.circular(width * .015))),
                    height: height * .05,
                    padding: EdgeInsets.all(width * .01),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SvgPicture.asset('assets/petronas-logo-white.svg',
                            width: width * .1),
                        Text(
                          DateTime.now().toString(),
                          style: TextStyle(color: Colors.white),
                        )
                      ],
                    ),
                  )),
              Positioned(
                  bottom: 50,
                  right: 20,
                  child: Image.asset(
                    'assets/qr-code.png',
                    width: width * .12,
                    fit: BoxFit.fill,
                  )),
            ],
          ),
        ),
      ],
    ),
  );
}
