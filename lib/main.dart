import 'package:flutter/material.dart';

void main ()=> runApp(battery());
class battery extends StatefulWidget {
  @override
  State<battery> createState() => _batteryState();
}

class _batteryState extends State<battery> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text(
            "battery saver",
            style: TextStyle(
              color: Colors.black,
              fontSize: 30,
            ),
          ),
          centerTitle: true,
          backgroundColor: Colors.grey,
        ),
        body: Center(
          child: Text(
            'why this happend?'
          ),
        ),
        backgroundColor: Colors.teal,
      ),
    );
  }
}
