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
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
            image: AssetImage('assets/splash.png'),
          fit: BoxFit.cover
        )
      ),
      child: Center(
        child: CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation<Color>(Colors.blueAccent),
        ),
      ),
    );
  }

  @override
  void initState() {
    super.initState();

    Future.delayed(const Duration(seconds: 3))
      .then((value) => handleTimeout());
  }

  void handleTimeout() {
    Navigator.of(context).pushReplacementNamed('/home');
  }
}