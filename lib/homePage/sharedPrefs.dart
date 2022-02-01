import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:show_up_animation/show_up_animation.dart';

class SharedPrefs extends StatefulWidget {
  const SharedPrefs({Key? key}) : super(key: key);

  @override
  _SharedPrefsState createState() => _SharedPrefsState();
}

class _SharedPrefsState extends State<SharedPrefs> {
  TextEditingController controller = TextEditingController();
  String? phoneNumber = "";

  @override
  void initState() {
    super.initState();
    readFromPrefs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Shared Preferences"),
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8),
            child: TextField(
              maxLength: 10,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(
                counterText: "",
                hintText: "Enter your number to save",
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(color: Colors.blue, width: 1),
                    borderRadius: BorderRadius.circular(10)),
                enabledBorder: const OutlineInputBorder(
                  borderSide: const BorderSide(color: Colors.blue, width: 1.0),
                ),
              ),
              controller: controller,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          ShowUpAnimation(
            delayStart: Duration(seconds: 0),
            animationDuration: Duration(seconds: 3),
            curve: Curves.easeOut,
            direction: Direction.horizontal,
            offset: 5,
            child: TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  saveToPrefs(controller.text.toString());
                },
                child: Text("Save to Preference")),
          ),
          SizedBox(
            height: 10,
          ),
          phoneNumber != null
              ? Text("Number from SharedPreference is " + phoneNumber!)
              : Text("Not saved anything")
        ],
      ),
    );
  }

  Future<String> saveToPrefs(String value) async {
    log("Value from textfield" + value);
    SharedPreferences preferences = await SharedPreferences.getInstance();
    await preferences.setString("phone_number", value);
    readFromPrefs();
    return "";
  }

  Future<String> readFromPrefs() async {
    String? data = "";
    SharedPreferences preferences = await SharedPreferences.getInstance();
    data = await preferences.getString("phone_number");
    phoneNumber = data;
    //for removing value from preference
    //  preferences.remove("phone_number");
    setState(() {});
    //log("Saved Data is " + data!);

    return data!;
  }
}
