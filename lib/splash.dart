import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class Splashscreen extends StatefulWidget {
  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    super.initState();
    Duration duration = const Duration(seconds: 4);
    Timer(duration, () {
      Navigator.of(context).pushReplacementNamed('home');
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Hero(tag: "image",
                  child: Image.asset("assets/image/male-gender.png",scale: 3,color: Colors.black,)),
          SizedBox(height: 20,),

          Text(
              "BMI CALCULATOR",
              style: const TextStyle(fontSize: 35, color: Colors.black),
            ),


      ],
    ),
        ));
  }
}
