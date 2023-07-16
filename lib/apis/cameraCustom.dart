// import 'package:flutter/material.dart';
// import 'package:camerawesome/camerawesome_plugin.dart';
// import 'package:better_open_file/better_open_file.dart';
// import 'package:path_provider/path_provider.dart';
// import 'dart:io';

// class CameraCustom extends StatefulWidget {
//   const CameraCustom({super.key});

//   @override
//   State<CameraCustom> createState() => _CameraCustomState();
// }

// class _CameraCustomState extends State<CameraCustom> {
//   late Future dataFuture;
//   @override
//   void initState() {
//     super.initState();
//     dataFuture = _localFile;
//   }

//   Future<String> get _localPath async {
//     final directory = await getApplicationDocumentsDirectory();

//     return directory.path;
//   }

//   Future<File> get _localFile async {
//     final path = await _localPath;
//     return File('$path/');
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//           child: FutureBuilder(
//               future: dataFuture,
//               builder: (context, snapshot) {
//                 if (snapshot.hasError) {
//                   final error = snapshot.error;
//                   return Text('$error');
//                 } else if (snapshot.hasData) {
//                   File path = snapshot.data;
//                   return Container(
//                     color: Colors.white,
//                     child: CameraAwesomeBuilder.awesome(
//                       saveConfig: SaveConfig.photoAndVideo(
//                         photoPathBuilder: () =>  (
                          
//     final testDir = await Directory('${extDir.path}/camerawesome').create(recursive: true);
//                         )
                   
//                             path(CaptureMode.photo),
//                         videoPathBuilder: () =>
                        
//                         initialCaptureMode: CaptureMode.photo,
//                       ),
//                       enablePhysicalButton: true,
//                       filter: AwesomeFilter.AddictiveRed,
//                       flashMode: FlashMode.auto,
//                       aspectRatio: CameraAspectRatios.ratio_16_9,
//                       previewFit: CameraPreviewFit.fitWidth,
//                       onMediaTap: (mediaCapture) {
//                         OpenFile.open(mediaCapture.filePath);
//                       },
//                     ),
//                   );;
//                 } else {
//                   return const Text('Waiting');
//                 }
//               })),
//     );
//   }
// }
