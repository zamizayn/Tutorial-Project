import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tutorial_project/homePage/homePage.dart';
import 'package:tutorial_project/signUp/intro.dart';
import 'package:tutorial_project/utils/custom.dart';

class CheckNumber extends StatefulWidget {
  final String? argument;

  CheckNumber({this.argument});

  @override
  _CheckNumberState createState() => _CheckNumberState();
}

class _CheckNumberState extends State<CheckNumber> {
  TextEditingController numberController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        Navigator.pop(context, "Returning to first screen");
        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios, color: Colors.black),
            onPressed: () {
              goBack(context);
            },
          ),
        ),
        backgroundColor: Colors.white,
        body: SafeArea(
          child: SingleChildScrollView(
            child: Container(
              height: getHeight(context),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(widget.argument.toString()),
                  Center(
                      child: Text(
                    "Enter your number to proceed",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  )),
                  SizedBox(
                    height: 20,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8),
                    child: TextField(
                      maxLength: 10,
                      keyboardType: TextInputType.number,
                      inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                      decoration: new InputDecoration(
                        counterText: "",
                        hintText: "Enter your number to proceed",
                        focusedBorder: OutlineInputBorder(
                            borderSide:
                                BorderSide(color: Colors.blue, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        enabledBorder: const OutlineInputBorder(
                          borderSide:
                              const BorderSide(color: Colors.blue, width: 1.0),
                        ),
                      ),
                      controller: numberController,
                    ),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: getWidth(context) / 1.4,
                    height: 45,
                    child: TextButton(
                        style: ButtonStyle(
                            backgroundColor:
                                MaterialStateProperty.all(Colors.purple)),
                        onPressed: () {
                          if (numberController.text.toString() ==
                              "7012738756") {
                            showToast("Valid User");
                            removeAndNavigate(context, HomePage());
                          } else if (numberController.text.toString().length <
                              10) {
                            showToast("Invalid Number");
                          } else {
                            showToast("You are not registered");
                          }
                          // navigate(context,
                          //     IntroductionVideo(videoId: "iLnmTe5Q2Qw"));
                        },
                        child: Text("Check",
                            style: TextStyle(color: Colors.yellow))),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
