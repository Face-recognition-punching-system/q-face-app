import 'package:flutter/material.dart';

import 'pages/home/home.dart';
import 'pages/login/login.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      initialRoute: '/',
      routes: {
        '/': (context) =>const Home(),
        '/login':(context) =>const Login()
      },
    );
  }
}