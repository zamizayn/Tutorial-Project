import 'dart:developer';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:tutorial_project/homePage/chooseImage.dart';
import 'package:tutorial_project/signUp/checkNumber.dart';
import 'utils/custom.dart';

class MainPage extends StatefulWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  bool _requireConsent = true;

  @override
  void initState() {
    super.initState();
    initPlatformState();
  }

  Future<void> initPlatformState() async {
    if (!mounted) return;
    OneSignal.shared.consentGranted(true);
    OneSignal.shared.setLogLevel(OSLogLevel.verbose, OSLogLevel.none);
    bool requiresConsent = await OneSignal.shared.requiresUserPrivacyConsent();
    OneSignal.shared.setRequiresUserPrivacyConsent(requiresConsent);

    OneSignal.shared.promptUserForPushNotificationPermission().then((value) {
      log("Allowed permission");
    });
    final status = await OneSignal.shared.getDeviceState();
    final String? userId = status!.userId;
    log("TOKENNN" + userId.toString());
    OneSignal.shared
        .setNotificationOpenedHandler((OSNotificationOpenedResult result) {
      navigate(context, ChooseImage());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: Container(
            height: 50, child: Center(child: Text("Developed by Google"))),
        //appBar: appBarContent("MainPage"),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                CachedNetworkImage(
                    imageUrl:
                        "https://cdn.dribbble.com/users/623359/screenshots/13230768/untitled-1-01_4x.png"),
                Text("Welcome to Google".toUpperCase(),
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        letterSpacing: 1.2)),
                SizedBox(
                  height: 30,
                ),
                Container(
                  width: getWidth(context) / 1.4,
                  height: 45,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple)),
                      onPressed: () {},
                      child: Text("Sign Up",
                          style: TextStyle(color: Colors.yellow))),
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                  width: getWidth(context) / 1.4,
                  height: 45,
                  child: TextButton(
                      style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.purple)),
                      onPressed: () async {
                        await Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => CheckNumber(
                                      argument: "Login to Google accounts",
                                    )));
                      },
                      child: Text("Sign In",
                          style: TextStyle(color: Colors.yellow))),
                ),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ));
  }
}
