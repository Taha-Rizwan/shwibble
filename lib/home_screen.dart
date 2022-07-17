import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shwibble/create_room_screen.dart';
import 'package:shwibble/join_room_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/images/giphy.gif",
              height: 250,
              width: 250,
            ).centered(),
            "Create/Join a room to play!"
                .text
                .black
                .size(26)
                .fontWeight(FontWeight.bold)
                .makeCentered(),
            SizedBox(
              height: context.screenHeight * 0.05,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(
                          Size(context.screenWidth / 2.5, 50))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: const CreateRoomScreen(),
                          type: PageTransitionType.leftToRightWithFade),
                    );
                  },
                  child: "Create".text.white.size(20).makeCentered(),
                ).px12(),
                ElevatedButton(
                  style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(Colors.black),
                      minimumSize: MaterialStateProperty.all(
                          Size(context.screenWidth / 2.5, 50))),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: const JoinRoomScreen(),
                          type: PageTransitionType.leftToRightWithFade),
                    );
                  },
                  child: "Join".text.white.size(20).makeCentered(),
                ).px12()
              ],
            )
          ]),
    );
  }
}
