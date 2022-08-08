import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'dart:async';
void main ()=> runApp(battery());
class battery extends StatefulWidget {
  @override
  State<battery> createState() => _batteryState();
}
class _batteryState extends State<battery> {
var battery = Battery();
int percentage = 0;
late Timer timer;
BatteryState batteryState = BatteryState.full;
late StreamSubscription streamSubscription;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Timer.periodic(const Duration(seconds: 5), (timer) {getBatteryPerentage(); });

  }
void getBatteryPerentage() async {
  final level = await battery.batteryLevel;
  percentage = level;

  setState(() {});
}
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
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
          backgroundColor: Colors.orange[500],
        ),
        body: Container(
          child: Center(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                IconButton(icon: Icon(Icons.battery_charging_full_sharp),
                  onPressed: () { print('worked');},
                  iconSize: 90,
                  color: Colors.orange[300],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
