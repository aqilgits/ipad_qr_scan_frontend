import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:ipad_qr_scan_frontend/apis/qrScanner.dart';
import 'package:ipad_qr_scan_frontend/pages/pageForNew.dart';
import 'package:video_player/video_player.dart';
import 'package:camera/camera.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, this.camera});
  final CameraDescription? camera;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  VideoPlayerController? videoPlayerController;
  // ChewieController? chewieController;

  @override
  void initState() {
    super.initState();
    videoPlayerController =
        VideoPlayerController.asset("assets/kiosk-bg-video-vertical.mp4")
          ..initialize().then((_) {
            videoPlayerController!.play();
            videoPlayerController!.setLooping(true);
            setState(() {});
          });
  }

  @override
  void dispose() {
    videoPlayerController!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    final Widget svgQR =
        SvgPicture.asset('assets/scan-qr.svg', width: width * .13);
    final Widget userQR =
        SvgPicture.asset('assets/visitor-register.svg', width: width * .13);
    final Widget svgPetronas =
        SvgPicture.asset('assets/petronas-logo-white.svg', width: width * .2);
    final now = DateTime.now();
    String formattedDate = DateFormat.MMMMEEEEd().format(now);
    String formattedTime = DateFormat.jm().format(DateTime.now());

    return Scaffold(
      body: Stack(
        children: [
          VideoPlayer(videoPlayerController!),
          Padding(
            padding: EdgeInsets.only(top: height * .025),
            child: Center(
                child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: width * .025),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(
                          formattedTime,
                          style: TextStyle(
                              fontSize: width * .05,
                              color: const Color(0XFFFFFFFF)),
                        )),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: width * .025),
                    child: Align(
                        alignment: Alignment.topLeft,
                        child: Text(formattedDate,
                            style: TextStyle(
                                fontSize: width * .025,
                                color: const Color(0XFFFFFFFF)))),
                  ),
                  SizedBox(
                    height: height * .04,
                  ),
                  Text(
                    'WELCOME TO',
                    style: TextStyle(
                        color: const Color(0XFFFFFFFF).withOpacity(0.8),
                        fontSize: width * .025),
                  ),
                  Text(
                    'Petronas Twin Towers',
                    style: TextStyle(
                      color: Color(0XFFFFFFFF),
                      fontSize: width * .05,
                    ),
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
                                builder: (context) =>
                                    QRScanner(screenClosed: false)),
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
                          // final data = await pickImage();
                          // if (data != null) {
                          //   print(data);
                          //   Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: ((context) => PreviewPage(
                          //             imageFile: data,
                          //           )),
                          //     ),
                          //   );
                          // }
                          // Navigator.push(
                          //     context,
                          //     MaterialPageRoute(
                          //       builder: ((context) => TakePictureScreen(camera: camera)),
                          //     ),
                          //   );
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: ((context) => const PageForNew()),
                            ),
                          );
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
                  SizedBox(height: height * .45),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        svgPetronas,
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.end,
                          children: [
                            Text(
                              'Waiting time saved : ',
                              style: TextStyle(
                                  color: const Color(0XFFFFFFFF),
                                  fontSize: width * .02),
                            ),
                            Text('302,480 Minutes',
                                style: TextStyle(
                                    fontFamily: 'Vcr',
                                    fontSize: width * .03,
                                    color: const Color(0XFFFFFFFF))),
                          ],
                        ),
                      ],
                    ),
                  )
                ],
              ),
            )),
          ),
        ],
      ),
    );
  }
}
