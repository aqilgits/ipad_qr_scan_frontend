import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:ipad_qr_scan_frontend/apis/cameraApi.dart';
import 'package:ipad_qr_scan_frontend/models/visitorModel.dart';
import 'package:ipad_qr_scan_frontend/pages/registerPage2.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../apis/visitorApi.dart';

class RegisterPage1 extends StatefulWidget {
  const RegisterPage1({super.key, required this.imageFile});
  final File? imageFile;
  @override
  State<RegisterPage1> createState() => _RegisterPageState1();
}

class _RegisterPageState1 extends State<RegisterPage1> {
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _ic = TextEditingController();
  bool loading = false;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    final Widget svgPetronas =
        SvgPicture.asset('assets/petronas-logo-white.svg', width: width * .2);
    final ButtonStyle style = ElevatedButton.styleFrom(
      backgroundColor: Color(0XFF00A19C),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8.0),
      ),
    );
    if (loading) {
      return const Center(child: CircularProgressIndicator());
    } else {
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
                    ..pop()
                    ..pop();
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
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                "Welcome to Petronas",
                style: TextStyle(
                    color: const Color(0XFF101828),
                    fontSize: MediaQuery.of(context).size.width * .05,
                    fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .05,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Name",
                  style: TextStyle(
                      color: const Color(0XFF101828),
                      fontSize: MediaQuery.of(context).size.width * .03,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: TextField(
                  controller: _name,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF00A19C), width: 3.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Email",
                  style: TextStyle(
                      color: const Color(0XFF101828),
                      fontSize: MediaQuery.of(context).size.width * .03,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: TextField(
                  controller: _email,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF00A19C), width: 3.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .01,
              ),
              Container(
                width: MediaQuery.of(context).size.width * .5,
                alignment: Alignment.centerLeft,
                child: Text(
                  "Identity card / Passport",
                  style: TextStyle(
                      color: const Color(0XFF101828),
                      fontSize: MediaQuery.of(context).size.width * .03,
                      fontWeight: FontWeight.bold),
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: TextField(
                  controller: _ic,
                  decoration: InputDecoration(
                    enabledBorder: OutlineInputBorder(
                      borderSide:
                          const BorderSide(width: 3, color: Colors.grey),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: const BorderSide(
                          color: Color(0xFF00A19C), width: 3.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width * .03,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width * .5,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Color(0xFF00A19C),
                      side:
                          const BorderSide(width: 3, color: Color(0xFF00A19C)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      padding: const EdgeInsets.all(20)),
                  child: Text(
                    'Register',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: MediaQuery.of(context).size.width * .03,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () async {
                    final imgUrl = await storeImage(widget.imageFile);
                    setState(() {
                      loading = true;
                    });
                    await createVisitor(jsonEncode(Visitor(
                                ic: _ic.text,
                                name: _name.text,
                                email: _email.text,
                                image: imgUrl)
                            .toJson()))
                        .then(
                      (value) {
                        setState(() {
                          loading = false;
                        });
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: ((context) => RegisterPage2(
                                name: _name.text,
                                email: _email.text,
                                ic: _ic.text)),
                          ),
                        );
                      },
                    );
                  },
                ),
              )
            ],
          ),
        ),
      );
    }
  }
}
