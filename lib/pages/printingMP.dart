import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:simple_animations/simple_animations.dart';
import 'package:lottie/lottie.dart';

class PrintingMP extends StatefulWidget {
  const PrintingMP({super.key});

  @override
  State<PrintingMP> createState() => _PrintingMPState();
}

class _PrintingMPState extends State<PrintingMP> {
  int status = 0;
  @override
  Widget build(BuildContext context) {
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
          ..tween('y', Tween<double>(begin: 0, end: 500.0),
              duration: const Duration(seconds: 2));
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
                  Navigator.of(context).pop();
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
        body:  status == 0 ? Center(
          child: Column(
            children: [
              SizedBox(height: height * .12),
              Text('Almost there!'),
              SizedBox(height: height * .025),
              Text(
                ' Your badge is being printed..',
                style: TextStyle(fontWeight: FontWeight.bold),
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
                    child: Image.asset(
                      images[1],
                      height: height * .3,
                    ),
                  ),
                  );
                },
                onCompleted: () =>  setState(() {
                  status = 1;
                }),
              ),
            ],
          ),
        ): Stack(
          children: [
            Center(
              child: Column(
                  children: [
                    SizedBox(height: height * .12),
                    Image.asset('assets/Ellipse2.png' ,height: height*0.2),
                    SizedBox(height: height * .05),
                    Text('Your host is on the way!', style: TextStyle(fontSize: width*.03)),
                    SizedBox(height: height * .05),
                    Text('Collect your badge below \n and proceed to the gate', style: TextStyle(fontWeight: FontWeight.bold, fontSize: width*.04)),
                    SizedBox(height: height * .05),
                    Text('At the gate, present the QR on your badge', style: TextStyle(fontSize: width*.03)),
                    Lottie.asset('assets/green-arrow-down.json', height: height *.2),
                  ],
                ),
            ),
              Lottie.asset('assets/confetti.json', height: height, width: width),
          ],
        ));
  }
}
