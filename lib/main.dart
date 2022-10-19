import 'package:flutter/material.dart';
import 'Homepage.dart';
import 'splash.dart';
void main() {
  runApp(
    MaterialApp(
      // debugShowCheckedModeBanner: false,
      routes: {
        '/': (context) => Splashscreen(),
        'home': (context) => Homepage(),
      },
    ),
  );
}
