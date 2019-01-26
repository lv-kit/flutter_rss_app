import 'package:flutter/material.dart';
import 'dart:async';

import 'package:flutter_rss/screen/home_screen.dart';


class SplashScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _SplashScreenState();
  }
}


class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/splash.png'),
                fit: BoxFit.fitWidth
            )
        ),
        child: Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
          ),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    loadData();

  }

  Future<Timer> loadData() async {
    return Timer(Duration(seconds: 3), onDoneLoad);
  }

  onDoneLoad() async {
    Navigator.of(context).pushReplacementNamed("/home");
  }

}