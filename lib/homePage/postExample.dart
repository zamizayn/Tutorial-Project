import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_project/providers/apiProvider.dart';

class PostExample extends StatefulWidget {
  const PostExample({Key? key}) : super(key: key);

  @override
  _PostExampleState createState() => _PostExampleState();
}

class _PostExampleState extends State<PostExample> {
  TextEditingController controller = TextEditingController();
  TextEditingController jobController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Post Example"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                maxLength: 10,
                keyboardType: TextInputType.number,
                decoration: new InputDecoration(
                  counterText: "",
                  hintText: "Enter your number to submit",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                  ),
                ),
                controller: controller,
              ),
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  log("message");
                  Provider.of<ApiProvider>(context, listen: false)
                      .checkNumberApi(
                    context,
                    controller.text.toString(),
                  );
                },
                child: Text(
                  "Add Now",
                  style: TextStyle(color: Colors.white),
                ))
          ],
        ),
      ),
    );
  }
}
