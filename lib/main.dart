import 'package:flutter/material.dart';
import 'package:battery_plus/battery_plus.dart';
import 'dart:async';
import 'package:android_alarm_manager_plus/android_alarm_manager_plus.dart';
import 'package:flutter_ringtone_player/flutter_ringtone_player.dart';
void main () async {
  runApp(battery());
 await AndroidAlarmManager.initialize();
}
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
void getBatteryState() {
  streamSubscription = battery.onBatteryStateChanged.listen((state) {
    batteryState = state;

    setState(() {
    });
  });
}
void batteryalarm(){
    if(percentage==100){
      FlutterRingtonePlayer.playNotification();
    }
}
Widget BatteryBuild(BatteryState state) {

  switch (state) {
  // first case is for battery full state
  // then it will show green in color
    case BatteryState.full:
      batteryalarm();
    // ignore: sized_box_for_whitespace
      return Container(
        width: 200,
        height: 200,
        // ignore: prefer_const_constructors
        child: (Icon(
          Icons.battery_full,
          size: 200,
          color: Colors.green,
        )),
      );

  // Second case is when battery is charging
  // then it will show blue in color
    case BatteryState.charging :
    // ignore: sized_box_for_whitespace
    if(BatteryState.full == true){
      FlutterRingtonePlayer.playNotification();
    }
      return Container(
        width: 200,
        height: 200,

        // ignore: prefer_const_constructors
        child: (Icon(
          Icons.battery_charging_full,
          size: 200,
          color: Colors.blue,
        )),
      );

  // third case is when the battery is
  // discharged then it will show red in color
    case BatteryState.discharging:
    default:
    // ignore: sized_box_for_whitespace
      return Container(
        width: 200,
        height: 200,

        // ignore: prefer_const_constructors
        child: (Icon(
          Icons.battery_alert,
          size: 200,
          color: Colors.red,
        )),
      );
  }
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
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                BatteryBuild(batteryState),
                Text('Battery Percentage: $percentage',
                  style: const TextStyle(
                      fontSize: 24
                  ),
                ),
                ],
            ),
          ),
        ),
      ),
    );
  }
}
void firealaram(){
print('ALARM FIRED ${DateTime.now()}');

}
