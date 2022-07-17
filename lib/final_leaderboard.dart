import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shwibble/home_screen.dart';
import 'package:velocity_x/velocity_x.dart';

class FinalLeaderboard extends StatelessWidget {
  final scoreboard;
  final String winner;
  FinalLeaderboard(this.scoreboard, this.winner);

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
            "Results"
                .text
                .black
                .size(26)
                .fontWeight(FontWeight.bold)
                .makeCentered(),
            SizedBox(
              height: context.screenHeight * 0.02,
            ),
            ListView.builder(
                primary: true,
                shrinkWrap: true,
                itemCount: scoreboard.length,
                itemBuilder: (context, index) {
                  var data = scoreboard[index].values;
                  return ListTile(
                    title: Text(data.elementAt(0),
                        style:
                            const TextStyle(color: Colors.black, fontSize: 23)),
                    trailing: Text(data.elementAt(1),
                        style: const TextStyle(
                            color: Colors.grey,
                            fontSize: 20,
                            fontWeight: FontWeight.bold)),
                  );
                }),
            Center(
              child: Text(
                "$winner has won the game!",
                style: const TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 24),
              ),
            ),
             SizedBox(
              height: context.screenHeight * 0.02,
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(0.0, 5.0, 0.0, 0.0),
              child: Material(
                //Wrap with Material
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(22.0)),
                elevation: 18.0,
                color: Colors.black,
                clipBehavior: Clip.antiAlias, // Add This
                child: MaterialButton(
                  minWidth: 200.0,
                  height: 35,
                  color: Colors.black,
                  child: Text('Play Again!',
                      style: TextStyle(fontSize: 16.0, color: Colors.white)),
                  onPressed: () {
                    Navigator.push(
                      context,
                      PageTransition(
                          child: const HomeScreen(),
                          type: PageTransitionType.leftToRightWithFade),
                    );
                  },
                ),
              ),
            )
          ]),
    );
  }
}
