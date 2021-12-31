import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

AppBar appBarContent(String title) {
  return AppBar(
    backgroundColor: Colors.purple,
    title: Row(
      mainAxisSize: MainAxisSize.max,
      children: [
        Expanded(
          flex: 2,
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
        Icon(Icons.search)
      ],
    ),
  );
}

double getWidth(BuildContext context) => MediaQuery.of(context).size.width;

double getHeight(BuildContext context) => MediaQuery.of(context).size.height;

navigate(BuildContext context, Widget widget) {
  Navigator.push(context, MaterialPageRoute(builder: (context) => widget));
}

goBack(BuildContext context) => Navigator.pop(context);

showToast(String data) {
  Fluttertoast.showToast(
      msg: data,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.black,
      textColor: Colors.white,
      fontSize: 16.0);
}

removeAndNavigate(BuildContext context,Widget widget){
  Navigator.pushAndRemoveUntil(
    context,
    MaterialPageRoute(
      builder: (BuildContext context) => widget,
    ),
    (route) => false,
  );
}

class CustomTextField extends StatefulWidget {
  final TextEditingController? controller;
  final int? maxLength;
  String? hint;

  CustomTextField(
      {required this.controller, required this.maxLength, this.hint});

  @override
  _CustomTextFieldState createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: widget.controller,
      decoration:
          InputDecoration(hintText: widget.hint == null ? "Heyy" : widget.hint),
    );
  }
}
