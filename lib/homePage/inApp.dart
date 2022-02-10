import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:tutorial_project/utils/custom.dart';

class InApp extends StatefulWidget {
  const InApp({Key? key}) : super(key: key);

  @override
  _InAppState createState() => _InAppState();
}

class _InAppState extends State<InApp> {
  InAppWebViewController? webViewController;

  @override
  void initState() {
    super.initState();
  }

  Future<bool> _exitApp(BuildContext context) async {
    if (await webViewController!.canGoBack()) {
      print("onwill goback");
      webViewController!.goBack();
      return Future.value(false);
    } else {
      return Future.value(true);
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        return _exitApp(context);
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text("WebView"),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: getHeight(context),
                child: InAppWebView(
                  onWebViewCreated: (control) {
                    webViewController = control;
                    Future.delayed(Duration(seconds: 3), () {
                      webViewController!.loadUrl(
                          urlRequest: URLRequest(
                              url: Uri.parse("https://facebook.com/")));
                    });
                  },
                  initialUrlRequest:
                      URLRequest(url: Uri.parse("https://google.com/")),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}