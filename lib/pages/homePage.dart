import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ipad_qr_scan_frontend/apis/cameraApi.dart';
import 'package:ipad_qr_scan_frontend/apis/qrScanner.dart';
import 'package:ipad_qr_scan_frontend/pages/previewPage.dart';

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
    final Widget svgPetronas =
        SvgPicture.asset('assets/petronas-logo-dark.svg', width: width * .2);
    final now = DateTime.now();
    String formattedDate = DateFormat.MMMMEEEEd().format(now);
    String formattedTime = DateFormat.jm().format(DateTime.now());
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.only(top: height * .025),
        child: Center(
            child: Column(
          children: [
            Padding(
              padding: EdgeInsets.only(left: width * .025),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    formattedTime,
                    style: TextStyle(fontSize: width * .05),
                  )),
            ),
            Padding(
              padding: EdgeInsets.only(left: width * .025),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Text(formattedDate,
                      style: TextStyle(fontSize: width * .025))),
            ),
            SizedBox(
              height: height * .04,
            ),
            Text(
              'Welcome to',
              style: TextStyle(
                  color: const Color(0XFF101828).withOpacity(0.5),
                  fontSize: width * .025),
            ),
            Text(
              'Petronas Twin Towers',
              style: TextStyle(
                  color: Color(0XFF101828),
                  fontSize: width * .05,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * .05),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => QRScanner(screenClosed: false)),
                    );
                  },
                  child: Card(
                    color: Color(0xFF00A19C),
                    child: SizedBox(
                      width: width * .3,
                      height: height * .2,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: height * .025),
                            Align(
                                alignment: const Alignment(0.1, 0.6),
                                child: svgQR),
                            SizedBox(
                              height: height * .015,
                            ),
                            Text(
                              'Pre-registered visitors',
                              style: TextStyle(
                                  color: Colors.white.withOpacity(0.8),
                                  fontSize: width * .02),
                            ),
                            Text('Scan QR',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * .03)),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  width: width * .04,
                ),
                GestureDetector(
                  onTap: () async {
                    final data = await pickImage();
                    if (data != null) {
                      print(data);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: ((context) => PreviewPage(
                                imageFile: data,
                              )),
                        ),
                      );
                    }
                  },
                  child: Card(
                    color: Color(0xFF763F98),
                    child: SizedBox(
                      width: width * .3,
                      height: height * .2,
                      child: Center(
                        child: Column(
                          children: [
                            SizedBox(height: height * .025),
                            userQR,
                            SizedBox(
                              height: height * .015,
                            ),
                            Text('All visitors',
                                style: TextStyle(
                                    color: Colors.white.withOpacity(0.8),
                                    fontSize: width * .02)),
                            Text('Register Here',
                                style: TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: width * .03))
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: height * .15),
            svgPetronas,
            SizedBox(height: height * .025),
            Text('302,480 hours of waiting time saved!',
                style: TextStyle(
                    fontSize: width * .03, fontWeight: FontWeight.bold))
          ],
        )),
      ),
    );
  }
}
