import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_project/providers/apiProvider.dart';

class AddData extends StatefulWidget {
  const AddData({Key? key}) : super(key: key);

  @override
  _AddDataState createState() => _AddDataState();
}

class _AddDataState extends State<AddData> {
  TextEditingController controller = TextEditingController();
  TextEditingController jobController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Add Data"),
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
                  hintText: "Enter your name to proceed",
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
            Padding(
              padding: const EdgeInsets.all(8),
              child: TextField(
                decoration: new InputDecoration(
                  counterText: "",
                  hintText: "Enter your Job detail",
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue, width: 1),
                      borderRadius: BorderRadius.circular(10)),
                  enabledBorder: const OutlineInputBorder(
                    borderSide:
                        const BorderSide(color: Colors.blue, width: 1.0),
                  ),
                ),
                controller: jobController,
              ),
            ),
            SizedBox(
              height: 20,
            ),
            TextButton(
                style: ButtonStyle(
                    backgroundColor: MaterialStateProperty.all(Colors.black)),
                onPressed: () {
                  Provider.of<ApiProvider>(context, listen: false).callAddData(
                      context,
                      controller.text.toString(),
                      jobController.text.toString());
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
