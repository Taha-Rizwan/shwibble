import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shwibble/paint_screen.dart';
import 'package:shwibble/widgets/customTextField.dart';
import 'package:velocity_x/velocity_x.dart';

class JoinRoomScreen extends StatefulWidget {
  const JoinRoomScreen({Key? key}) : super(key: key);

  @override
  _JoinRoomScreenState createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();

  void joinRoom() {
    if (_nameController.text.isNotEmpty && _roomController.text.isNotEmpty) {
      Map<String, String> data = {
        "nickname": _nameController.text,
        "name": _roomController.text,
      };

      Navigator.of(context).push(MaterialPageRoute(
          builder: (context) =>
              PaintScreen(data: data, screenFrom: 'joinRoom')));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          "Join Room".text.black.size(30).makeCentered(),
          SizedBox(
            height: context.screenHeight * 0.08,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: CustomTextField(
                controller: _nameController,
                hintText: "Enter Your Name",
                max: 8),
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: CustomTextField(
                controller: _roomController,
                hintText: "Enter Room Name",
                max: 4),
          ),
          SizedBox(
            height: context.screenHeight * 0.01,
          ),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                minimumSize: MaterialStateProperty.all(
                    Size(context.screenWidth / 2.5, 50))),
            onPressed: () {
              if (_nameController.text.isEmpty ||
                  _roomController.text.isEmpty) {
                HapticFeedback.heavyImpact();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    content:
                        "Fill in all the Fields!".text.white.size(16).make(),
                    backgroundColor: Colors.black,
                  ),
                );
              } else {
                joinRoom();
              }
            },
            child: "Join".text.white.size(20).makeCentered(),
          ).px32(),
        ],
      ),
    );
  }
}
