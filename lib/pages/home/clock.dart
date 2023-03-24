import 'package:flutter/material.dart';

class Clock extends StatefulWidget {
  const Clock({Key? key}) : super(key: key);

  @override
  ClockState createState() => ClockState();
}

class ClockState extends State<Clock> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('打卡'),
      ),
      body: const Center(
        child: Text(
          '早起的年轻人',
          style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}