import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:tutorial_project/utils/custom.dart';

class ChooseImage extends StatefulWidget {
  const ChooseImage({Key? key}) : super(key: key);

  @override
  _ChooseImageState createState() => _ChooseImageState();
}

class _ChooseImageState extends State<ChooseImage> {
  final ImagePicker imagePicker = ImagePicker();
  XFile? cameraImage;
  XFile? galleryImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Image Picker"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TextButton(
                onPressed: () async {
                  cameraImage =
                      await imagePicker.pickImage(source: ImageSource.camera);
                  setState(() {});
                },
                child: Text("Choose image from camera")),
            SizedBox(
              height: 20,
            ),
            TextButton(
                onPressed: () async {
                  galleryImage =
                      await imagePicker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: Text("Choose image from gallery")),
            SizedBox(
              height: 20,
            ),
            cameraImage != null
                ? Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Text("Image From Camera"),
                        SizedBox(
                          height: 20,
                        ),
                        Image.file(
                          File(cameraImage!.path),
                          height: 100,
                          fit: BoxFit.cover,
                          width: getWidth(context),
                        ),
                      ],
                    ),
                  )
                : Text(""),
            SizedBox(
              height: 20,
            ),
            galleryImage != null
                ? Column(
                    children: [
                      Text("Image From Gallery"),
                      SizedBox(
                        height: 20,
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Image.file(
                          File(galleryImage!.path),
                          height: 100,
                          fit: BoxFit.cover,
                          width: getWidth(context),
                        ),
                      ),
                    ],
                  )
                : Text("")
          ],
        ),
      ),
    );
  }
}
