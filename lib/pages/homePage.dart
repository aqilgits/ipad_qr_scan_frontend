import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Widget svgQR =
        SvgPicture.asset('assets/scan-qr.svg', width: width * .13);
    final Widget userQR =
        SvgPicture.asset('assets/visitor-register.svg', width: width * .13);
    final now = DateTime.now();
    String formattedDate = DateFormat.MMMMEEEEd().format(now);
    String formattedTime = DateFormat.jm().format(DateTime.now());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(left: width * .035, top: height * .025),
        child: Center(
            child: Column(
          children: [
            Align(
                alignment: Alignment.topLeft,
                child: Text(
                  formattedTime,
                  style: TextStyle(fontSize: width * .05),
                )),
            Align(
                alignment: Alignment.topLeft,
                child: Text(formattedDate,
                    style: TextStyle(fontSize: width * .025))),
            SizedBox(
              height: height * .04,
            ),
            Text(
              'Welcome to',
              style: TextStyle(
                  color: Color(0XFF101828).withOpacity(0.5),
                  fontSize: width * .025),
            ),
            Text(
              'Petronas Twin Tower',
              style: TextStyle(
                  color: Color(0XFF101828),
                  fontSize: width * .05,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height*.05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  color: Color(0xFF00A19C),
                  child: SizedBox(
                    width: width * .3,
                    height: height * .2,
                    child: Center(child: svgQR),
                  ),
                ),
                SizedBox(
                  width: width * .04,
                ),
                Card(
                  color: Color(0xFF763F98),
                  child: SizedBox(
                    width: width * .3,
                    height: height * .2,
                    child: Center(child: userQR),
                  ),
                ),
              ],
            ),
          ],
        )),
      ),
    );
  }
}
