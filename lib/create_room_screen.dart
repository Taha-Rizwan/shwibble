import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:shwibble/paint_screen.dart';
import 'package:shwibble/widgets/customTextField.dart';
import 'package:velocity_x/velocity_x.dart';

class CreateRoomScreen extends StatefulWidget {
  const CreateRoomScreen({Key? key}) : super(key: key);

  @override
  _CreateRoomScreenState createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _roomController = TextEditingController();
  String? _maxRoundValue;
  String? _maxRoomSize;

  void createRoom() {
    if (_nameController.text.isNotEmpty &&
        _roomController.text.isNotEmpty &&
        _maxRoundValue != null &&
        _maxRoomSize != null) {
      Map<String, String> data = {
        'nickname': _nameController.text,
        "name": _roomController.text,
        "occupancy": _maxRoomSize!,
        "maxRounds": _maxRoundValue!,
      };
      Navigator.of(context).push(MaterialPageRoute(builder: (context) => PaintScreen(data: data, screenFrom: 'createRoom'), ));
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
          "Create Room".text.black.size(30).makeCentered(),
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
          DropdownButton<String>(
            focusColor: const Color(0xffF5F6FA),
            items: <String>["2", "3", "4", "5", "10", "15"]
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem(
                    value: value,
                    child: value.text.black.make(),
                  ),
                )
                .toList(),
            hint: "Select Max Rounds"
                .text
                .black
                .size(20)
                .fontWeight(FontWeight.w500)
                .make(),
            onChanged: (String? value) {
              setState(() {
                _maxRoundValue = value;
              });
            },
            value: _maxRoundValue.isNotEmptyAndNotNull ? _maxRoundValue : null,
            borderRadius: BorderRadius.circular(8),
          ),
          DropdownButton<String>(
            focusColor: const Color(0xffF5F6FA),
            items: <String>["2", "3", "4", "5", "6", "7", "10", "12"]
                .map<DropdownMenuItem<String>>(
                  (String value) => DropdownMenuItem(
                    value: value,
                    child: value.text.black.make(),
                  ),
                )
                .toList(),
            hint: "Select Room Size"
                .text
                .black
                .size(20)
                .fontWeight(FontWeight.w500)
                .make(),
            onChanged: (String? value) {
              setState(() {
                _maxRoomSize = value;
              });
            },
            value: _maxRoomSize.isNotEmptyAndNotNull ? _maxRoomSize : null,
            borderRadius: BorderRadius.circular(8),
          ).py12(),
          ElevatedButton(
            style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all(Colors.black),
                minimumSize: MaterialStateProperty.all(
                    Size(context.screenWidth / 2.5, 50))),
            onPressed: () {
          if(_nameController.text.isEmpty || _roomController.text.isEmpty|| _maxRoundValue == null || _maxRoomSize == null) {
            HapticFeedback.heavyImpact();
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(           
                  content:
                      "Fill in all the Fields!".text.white.size(16).make(),
                  backgroundColor: Colors.black,
                ),
              );
          } else {

              createRoom();
          }

            },
            child: "Create".text.white.size(20).makeCentered(),
          ).px32(),
        ],
      ),
    );
  }
}
