import 'package:flutter/material.dart';
import 'playerDetails.dart';
import 'results.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: Color(0XFF0A0E21),
        primaryColor: Color(0XFF0A0E21),
      ),
      initialRoute: '/',
      routes: {
        '/': (context) => PlayerDetails(),
      },
    );
  }
}
