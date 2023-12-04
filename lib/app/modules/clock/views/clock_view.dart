import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_analog_clock/flutter_analog_clock.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import '../controllers/clock_controller.dart';

class ClockView extends GetView<ClockController> {
  const ClockView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ClockView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'ClockView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
class ExampleSpecifyTime extends StatefulWidget {
  const ExampleSpecifyTime({Key? key}) : super(key: key);

  @override
  State<ExampleSpecifyTime> createState() => _ExampleSpecifyTimeState();
}

class _ExampleSpecifyTimeState extends State<ExampleSpecifyTime> {
  String? _timeString="";
  void _getTime() {
    // final DateTime now = DateTime.now();
    final String formattedDateTime = _formatDateTime();
    setState(() {
      _timeString = formattedDateTime;
    });
  }

  @override
  void initState() {
    super.initState();
    _timeString = _formatDateTime();
    Timer.periodic(Duration(seconds: 1), (Timer t) => _getTime());
  }

  String _formatDateTime() {
    return DateFormat.jm().format(DateTime.now());
  }
  final GlobalKey<AnalogClockState> _analogClockKey = GlobalKey();
  final formattedDate = DateFormat.yMMMMd().format(DateTime.now()); // "July 19, 2023"
  final formattedTime = DateFormat.jm().format(DateTime.now()); // "8:34 PM"
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[800],
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            children: [

              Column(children: [
                const SizedBox(height: 15,),
                Text(DateFormat.yMMMMd().format(DateTime.now()),style: TextStyle(color: Colors.yellow,fontSize: 28,),),
                const SizedBox(height: 22,),
                Text(_timeString!,style: TextStyle(color: Colors.white,fontSize: 28,fontWeight: FontWeight.bold),),

              ],),
              const Spacer(),

              Center(
                child: AnalogClock(
                  key: _analogClockKey,
                  dateTime: DateTime.now(),
                  dialColor: Colors.deepPurple[800],
                  hourHandColor: Colors.white,
                  minuteHandColor: Colors.white,
                  secondHandColor: Colors.yellow,markingWidthFactor: 0.8,
                  centerPointColor: Colors.white,
                  isKeepTime: true,dialBorderColor: Colors.blue,markingColor: Colors.white,hourNumberColor: Colors.white,
                ),
              ),
              const Spacer(),
            ],
          ),
        ),
      ),

    );
  }
}

