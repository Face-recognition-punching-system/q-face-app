import 'package:flutter/material.dart';

class Reaction extends StatefulWidget {
  const Reaction({Key? key}) : super(key: key);

  @override
  ReactionState createState() => ReactionState();
}

class ReactionState extends State<Reaction> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('申诉'),
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
