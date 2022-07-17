import 'dart:async';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shwibble/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class Splashscreen extends StatefulWidget {
  const Splashscreen({Key? key}) : super(key: key);

  @override
  _SplashscreenState createState() => _SplashscreenState();
}

class _SplashscreenState extends State<Splashscreen> {
  @override
  void initState() {
    Timer(
      5.seconds,
      () => Navigator.pushReplacement(
        context,
        PageTransition(
            child: const HomeScreen(),
            type: PageTransitionType.leftToRightWithFade),
      ),
    );

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/giphy.gif",
              height: 250,
              width: 250,
            ).centered(),
            AnimatedTextKit(animatedTexts: [
              TypewriterAnimatedText(
                'SHWIBBLE',
                textStyle: const TextStyle(
                    fontSize: 32.0,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'GrandHotel'),
                speed: const Duration(milliseconds: 300),
              )
            ])
          ],
        ),
      ),
    );
  }
}
