import 'package:flutter/material.dart';
import 'package:sqflite/sqflite.dart';

import '../login/login.dart';

class Mine extends StatefulWidget {
  const Mine({Key? key}) : super(key: key);

  @override
  MineState createState() => MineState();
}

class MineState extends State<Mine> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('个人'),
      ),
      body: Center(
          child: Column(
        children: [
          ElevatedButton(
            child: const Text("登陆"),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const Login()),
              );
            },
          )
        ],
      )),
    );
  }
}
