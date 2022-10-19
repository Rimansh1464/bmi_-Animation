import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';

class Resultpage extends StatelessWidget {
  double? age1, height1, weight1, bmiscore;

  Resultpage({this.age1, this.weight1, this.bmiscore, this.height1});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff26273A),
      body: Container(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 240,
              ),
              Text(
                "Your BMI Score is",
                style: TextStyle(
                    color: Colors.white.withOpacity(0.7), fontSize: 17),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                bmiscore!.toStringAsFixed(2),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w700),
              ),
              SizedBox(
                height: 5,
              ),
              Text(
                Scoreplus(kk: bmiscore!.toDouble()),
//text: bmiscore.toStringAsFixed(2),
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 45,
                    fontWeight: FontWeight.w700),
              ),
              Spacer(),
              FadeInUp(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
                  child: Container(
                    width: double.infinity,
                    height: 40,
                    child: ElevatedButton(
                      child: Text(
                        "RE-CALCULATE",
                        style: TextStyle(
                          fontSize: 17,
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                      style: ElevatedButton.styleFrom(
                        primary: Color(0xffEB1555),
                      ),
                      onPressed: () {
                        Navigator.of(context).pushNamed("home");
                      },
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

Scoreplus({required double kk}) {
  if (kk < 18.5) {
    return "Underweight";
  } else if (kk >= 18.5 && kk <= 24.9) {
    return "Normal";
  } else if (kk >= 25 && kk <= 29.9) {
    return "Overweight";
  } else if (kk >= 30 && kk <= 34.9) {
    return "Obese";
  } else {
    return "Extremely Obese";
  }
}

