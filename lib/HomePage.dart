import 'dart:math';
import 'dart:ui';
import 'package:flutter/widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animator/flutter_animator.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_left.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_right.dart';
import 'package:flutter_animator/widgets/fading_entrances/fade_in_up.dart';
import 'animator.dart';

class Homepage extends StatefulWidget {
  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  String? gender;
  double slidval = 30;
  double weight = 0,
      age = 0;
  double? score;
  bool male = false;
  bool female = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueGrey,
      appBar: AppBar(
        brightness: Brightness.dark,
        title:  Hero(
          tag: "bmi",
            child: Text(" BMI CALCULATOR")),
        centerTitle: true,
        backgroundColor: const Color(0xff090E21),
        actions: [
          IconButton(onPressed: () {
            setState(() {
              slidval = 30;
              weight = 0;
              age = 0;
              male = false;
              female = false;
            });
          },
              icon: const Icon(Icons.refresh, size: 20))
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            const SizedBox(
              height: 20,
            ),
            Row(
              children: [

                FadeInLeft(
                  child: Center(
                    child: Container(
                      height:220,
                      width: 150,
                      decoration: BoxDecoration(
                        color: const Color(0xff4C4F5E),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [

                          InkWell(
                            onTap: () {
                              setState(() {
                                male = true;
                                female = false;
                              });
                            },
//
                              child: Hero(tag: "image", child:  Image.asset("assets/image/male-gender.png",scale: 6,))
                          ),
                          SizedBox(height: 10,),
                          Text(
                            "Male",
                            style: TextStyle(
                              fontSize: 17,
                              color: Colors.white.withOpacity(0.85),
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                Spacer(),
                FadeInRight(
                  child: Container(
                    height: 220,
                    width: 150,
                    decoration: BoxDecoration(
                        color: const Color(0xff4C4F5E),
                        borderRadius: BorderRadius.circular(10)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        InkWell(
                          onTap: () {
                            setState(() {
                              female = true;
                              male = false;
                            });
                          },
                          child: TweenAnimationBuilder(
                            tween: Tween(begin: 0,end: pi*2),
                            duration: Duration(seconds: 2),
                            builder: (context, dynamic value, child) => Transform.rotate(angle: value,child:  Image.asset("assets/image/female.png",scale: 6,),),

                          ),
                        ),
                        SizedBox(height: 10,),
                        Text(
                          "Female",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withOpacity(0.85),
                          ),),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 20,
            ),
            FadeInUpBig(
              child: Container(
                width: 320,
                height: 150,
                decoration: BoxDecoration(
                  color: const Color(0xff4C4F5E),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 20,
                    ),
                    Text(
                      "Height",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                    Text.rich(
                      TextSpan(
                        text:"100",
                        style: const TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                        ),
                        children: [
                          TextSpan(
                            text: " cm",
                            style: TextStyle(
                              fontSize: 13,
                              color: Colors.white.withOpacity(0.6),
                            ),
                          ),
                        ],
                      ),
                    ),
                    SliderTheme(
                      data: SliderThemeData(
                        trackHeight: 1,
                        activeTrackColor: Colors.white,
                        thumbColor: Colors.pink,
                        disabledActiveTrackColor: Colors.white.withOpacity(0.85),
                      ),
                      child: Slider(
                        value: slidval,
                        min: 1,
                        max: 230,
                        divisions: 200,
                        label: slidval.toInt().toString(),
                        onChanged: (double val) {
                          setState(
                                () {
                              slidval = val;
                            },
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TweenAnimationBuilder(
                  curve: Curves.bounceOut,
                  duration: Duration(seconds: 2),
                  tween: Tween<Offset>(begin: Offset(0,-500),end: Offset(0,0)),
                  builder: (context, dynamic value, child) => Transform.translate(offset: value,child: child,),
                  child: Container(
                    width: 150,
                    height: 210,
                    decoration: BoxDecoration(
                      color: const  Color(0xff4C4F5E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                      const SizedBox(
                      height: 15,
                    ),
                    Text(
                      "Weight",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w700,
                        color: Colors.white.withOpacity(0.85),
                      ),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Text.rich(
                      TextSpan(
                        text: weight.toInt().toString(),
                        style: const TextStyle(
                          fontSize: 35,
                          color: Colors.white,
                          // fontWeightchildren: [
                          //   TextSpan(
                          //     text: " kg",
                          //     style: TextStyle(
                          //       fontSize: 13,
                          //       color: Colors.white.withOpacity(0.6),
                          //     ),
                          //   ),
                          // ],
                        ),
                      ),
                    ),
                      const SizedBox(
                        height: 20,
                      ),
                      Row(
                        children: [
                          const SizedBox(
                            width: 12,
                          ),
                          FloatingActionButton(
                            backgroundColor: const Color(0xff4C4F5E),
                            elevation: 0,
                            child: const Text(
                              "-",
                              style: TextStyle(fontSize: 30),
                            ),
                            onPressed: () {
                              setState(
                                    () {
                                  if (weight <= 0) {
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(
                                      const SnackBar(
                                        backgroundColor: Color(0xff4C4F5E),
                                        content: Text(
                                          "Wrong Arguments",
                                          style: TextStyle(
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    );
                                  } else {
                                    weight--;
                                  }
                                },
                              );
                            },
                          ),
                          const SizedBox(
                            width: 12,
                          ),
                          FloatingActionButton(
                            backgroundColor: const Color(0xff4C4F5E),
                            elevation: 0,

                            child: const Icon(
                              Icons.add,
                              size: 30,
                            ),
                            onPressed: () {
                              setState(
                                    () {
                                  weight++;
                                },
                              );
                            },
                          ),
                        ],
                      )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  width: 20,
                ),
                TweenAnimationBuilder(
                  curve: Curves.bounceOut,
                  duration: Duration(seconds: 3),
                  tween: Tween<Offset>(begin: Offset(0,-500),end: Offset(0,0)),
                  builder: (context, dynamic value, child) => Transform.translate(offset: value,child: child,),
                  child:Container(
                    width: 150,
                    height: 210,
                    decoration: BoxDecoration(
                      color: const Color(0xff4C4F5E),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 15,
                        ),
                        Text(
                          "Age",
                          style: TextStyle(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white.withOpacity(0.85),
                          ),
                        ),
                        const SizedBox(
                          height: 30,
                        ),
                        Text.rich(
                          TextSpan(
                            text: age.toInt().toString(),
                            style: const TextStyle(
                              fontSize: 35,
                              color: Colors.white,
                              fontWeight: FontWeight.w900,
                            ),
                            children: [
                              TextSpan(
                                text: "",
                                style: TextStyle(
                                  fontSize: 13,
                                  color: Colors.white.withOpacity(0.6),),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 12,
                            ),
                            FloatingActionButton(
                                backgroundColor: Color(0xff4C4F5E),
                                elevation: 0,

                                child: const Text(
                                  "-",
                                  style: const TextStyle(fontSize: 30),
                                ),
                                onPressed: () {
                                  setState(() {
                                    if (age <= 0) {
                                      ScaffoldMessenger.of(context).showSnackBar(
                                        const SnackBar(
                                          backgroundColor: Colors.transparent,
                                          content: Text(
                                            "Wrong Arguments",
                                            style: const TextStyle(
                                              color: Colors.white,
                                            ),
                                          ),
                                        ),
                                      );
                                    } else {
                                      age--;
                                    }
                                  });
                                }),
                            const SizedBox(
                              width: 12,
                            ),
                            FloatingActionButton(
                                elevation: 0,

                                backgroundColor: const Color(0xff4C4F5E),
                                child: const Icon(
                                  Icons.add,
                                  size: 30,
                                ),
                                onPressed: () {
                                  setState(() {
                                    age++;
                                  });
                                }),
                          ],
                        ),

                      ],
                    ),
                  ),
                ),

              ],
            ),
            const Spacer(),
            FadeInUp(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                    horizontal: 20, vertical: 10),
                child: Container(
                  width: double.infinity,
                  height: 0,
                  child: ElevatedButton(
                    child:  const Text(
                      "CALCULATE",
                      style: TextStyle(
                        fontSize: 17,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xffEB1555),
                    ),
                    onPressed: () {
                      if (weight > 0 && age > 0 && slidval > 30) {
                        score = (weight * 10000) / (slidval * slidval);
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (context) =>
                                Resultpage(
                                  age1: age,
                                  bmiscore: score,
                                  height1: slidval,
                                  weight1: weight,
                                ),
                          ),
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            backgroundColor: Color(0xff4C4F5E),
                            content: Text(
                              "Wrong Arguments",
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}