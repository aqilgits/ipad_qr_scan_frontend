import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:ipad_qr_scan_frontend/pages/registerPage.dart';
import 'package:ipad_qr_scan_frontend/pages/registerPage2.dart';
import 'dart:convert';
import '../apis/cameraApi.dart';

class PreviewPage extends StatelessWidget {
  PreviewPage({Key? key, required this.imageFile, this.userData})
      : super(key: key);
  final File? imageFile;
  final String? userData;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;

    Map<String, dynamic>? user;
    if (userData != null) {
      user = json.decode(userData!);
    }
    return Scaffold(
      body: Padding(
        padding:
            EdgeInsets.only(top: height * .025),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Looking great!",
              style: TextStyle(
                  color: const Color(0XFF101828),
                  fontSize: width * .05,
                  fontWeight: FontWeight.bold),
            ),
            SizedBox(height: height * .03),
            Center(
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.file(
                  File(imageFile!.path),
                  width: width * .3,
                ),
              ),
            ),
            SizedBox(height: height * .03),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: height * .05,
                  width: width * 0.2,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white.withOpacity(1),
                        side: const BorderSide(width: 3, color: Colors.red),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(width*.02) //content padding inside button
                        ),
                    onPressed: () async {
                      final data = await pickImage();
                      if (data != null) {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => PreviewPage(
                                  imageFile: data,
                                )),
                          ),
                        );
                      }
                    },
                    child: Text(
                      'Retake photo',
                      style: TextStyle(
                        color: Colors.red,
                        fontSize: width * .02,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: width * 0.02),
                SizedBox(
                  height: height * .05,
                  width: width * 0.4,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color(0xFF00A19C),
                        side: const BorderSide(
                            width: 3, color: Color(0xFF00A19C)),
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        padding: EdgeInsets.all(
                            width*.01) //content padding inside button
                        ),
                    child: Text(
                      'Continue',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    onPressed: () {
                      if (user == null) {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                RegisterPage1(imageFile: imageFile)),
                          ),
                        );
                      } else {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) =>
                                RegisterPage2(name: user?['name'], email: user?['email'], ic: user?['ic'],)),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
