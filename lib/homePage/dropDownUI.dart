import 'dart:developer';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:dropdown_plus/dropdown_plus.dart';
import 'package:flutter/material.dart';
import 'package:tutorial_project/utils/custom.dart';

class DropDownClass extends StatefulWidget {
  const DropDownClass({Key? key}) : super(key: key);

  @override
  _DropDownClassState createState() => _DropDownClassState();
}

class _DropDownClassState extends State<DropDownClass> {
  String? selectedValue;
  List<String> items = [
    'Item1',
    'Item2',
    'Item3',
    'Item4',
  ];
  List<String> list = ["Kerala", "Tamil Nadu", "Karnataka", "Mumbai"];
  String dropDOwnData = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("DropDown"),
      ),
      body: Container(
        width: getWidth(context),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: DropdownButtonHideUnderline(
                  child: DropdownButton2(
                    hint: Text(
                      'Select State',
                      style: TextStyle(
                        fontSize: 14,
                        color: Theme.of(context).hintColor,
                      ),
                    ),
                    items: list
                        .map((item) => DropdownMenuItem<String>(
                              value: item,
                              child: Text(
                                item,
                                style: const TextStyle(
                                  fontSize: 14,
                                ),
                              ),
                            ))
                        .toList(),
                    value: selectedValue,
                    onChanged: (value) {
                      setState(() {
                        selectedValue = value as String;
                      });
                    },
                    buttonHeight: 60,
                    icon: Icon(Icons.arrow_circle_down_sharp),
                    buttonWidth: getWidth(context),
                    itemHeight: 40,
                    itemWidth: getWidth(context),
                  ),
                ),
              ),
              Text("Selected value from DropDown is $selectedValue")
            ],
          ),
        ),
      ),
    );
  }
}
