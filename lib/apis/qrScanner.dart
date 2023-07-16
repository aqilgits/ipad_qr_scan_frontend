import 'package:ipad_qr_scan_frontend/apis/qrOverlay.dart';
import 'package:ipad_qr_scan_frontend/pages/welcomePage1.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
        automaticallyImplyLeading: false,
        backgroundColor: Color(0XFF222222),
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ElevatedButton(
              style: style,
              onPressed: () {
                Navigator.of(context)
                  .pop();
                 
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
      body: Stack(
        children: [
          MobileScanner(
            allowDuplicates: false,
            controller: cameraController,
            onDetect: _foundBarcode,
          ),
          QRScannerOverlay(overlayColour: Colors.black.withOpacity(0.5))
        ],
      )
      
    );
  }

  void _foundBarcode(Barcode barcode, MobileScannerArguments? args) {
    /// open screen
    if (!widget.screenClosed) {
      final String code = barcode.rawValue ?? "---";
      widget.screenClosed = true;
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => WelcomePage1(code: code)),
      );
    }
  }
}
