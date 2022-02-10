import 'package:flutter/material.dart';
import 'package:share_plus/share_plus.dart';

class ShareData extends StatefulWidget {
  const ShareData({Key? key}) : super(key: key);

  @override
  _ShareDataState createState() => _ShareDataState();
}

class _ShareDataState extends State<ShareData> {
  String value = "This data will be copied";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Share Data"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(child: Text(value)),
              TextButton(
                  onPressed: () async {
                    await Share.share(value);
                  },
                  child: Text("Tap to share"))
            ],
          ),
        ),
      ),
    );
  }
}