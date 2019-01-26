import 'package:flutter/material.dart';


class HomeScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return _HomeScreenState();
  }
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('RSS'),
      ),
      body: Center(
        child: Text('Hello'),
      ),
    );
  }
}