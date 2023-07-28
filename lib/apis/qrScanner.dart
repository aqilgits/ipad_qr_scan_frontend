import 'package:ipad_qr_scan_frontend/apis/qrOverlay.dart';
import 'package:ipad_qr_scan_frontend/models/visitorModel2.dart';
import 'package:ipad_qr_scan_frontend/pages/welcomePage1.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

// ignore: must_be_immutable
class QRScanner extends StatefulWidget {
  bool screenClosed;
  QRScanner({
    Key? key,
    required this.screenClosed,
  }) : super(key: key);

  @override
  State<QRScanner> createState() => _QRScannerState();
}

class _QRScannerState extends State<QRScanner> {
  MobileScannerController cameraController = MobileScannerController();

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Color(0XFF00A19C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
    final Widget svgPetronas =
        SvgPicture.asset('assets/petronas-logo-white.svg', width: width * .13);
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
        body: Stack(
          children: [

            MobileScanner(
              allowDuplicates: false,
              controller: cameraController,
              onDetect: _foundBarcode,
            ),
            QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
          ],
        ));
  }

  Future<Visitor> fetchVisitor(String code) async {
    final response = await http.get(Uri.parse(
        'https://petronas-vms.onrender.com/api/invitations/$code/checkin/'));

    if (response.statusCode == 200) {
      // If the server did return a 200 OK response,
      // then parse the JSON.
      return Visitor.fromJson(jsonDecode(response.body));
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load album');
    }
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) async {
    // late Future<Visitor> visitor;
    Visitor visitor;

    /// open screen
    if (!widget.screenClosed) {
      print('founded');
      final String code = barcode.rawValue ?? "---";
      visitor = await fetchVisitor(code);
      print(visitor.visitor_email);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage1(visitor_email: visitor.visitor_email, visitor_name: visitor.visitor_name, visitor_nric: visitor.visitor_nric)),
      );
      // FutureBuilder<Visitor>(
      //   future: visitor,
      //   builder: (context, snapshot) {
      //     if (snapshot.hasData) {
      //       print('inside');
      //       print(snapshot.data!.visitor_email);
      //       widget.screenClosed = true;
      //       Navigator.push(
      //         context,
      //         MaterialPageRoute(builder: (context) => WelcomePage1(code: code)),
      //       );
      //     } else if (snapshot.hasError) {
      //       return Text('${snapshot.error}');
      //     }

      //     // By default, show a loading spinner.
      //     return const CircularProgressIndicator();
      //   },
      // );
    }
  }
}
