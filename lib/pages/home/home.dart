import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';

import 'reaction.dart';
import 'clock.dart';
import 'mine.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  HomeState createState() => HomeState();
}

class HomeState extends State<Home> {
  int pageIndex = 2;
  final _pages = [const Reaction(), const Clock(), const Mine()];

  @override
  void initState() {
    super.initState();
    if (kDebugMode) {
      print("Home initState");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[pageIndex],
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.feedback, title: '申诉'),
          TabItem(icon: Icons.line_style_rounded, title: '打卡'),
          TabItem(icon: Icons.person, title: '个人'),
        ],
        initialActiveIndex: pageIndex,
        onTap: (int index) {
          setState(() {
            pageIndex = index;
          });
        },
      ),
    );
  }
}