import 'package:flutter/material.dart';

class WelcomePage1 extends StatefulWidget {
  const WelcomePage1({Key? key, required this.code}) : super(key: key);
  final String code;

  @override
  State<WelcomePage1> createState() => _WelcomePage1State();
}

class _WelcomePage1State extends State<WelcomePage1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Text(widget.code));
  }
}
