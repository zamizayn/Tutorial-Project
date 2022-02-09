import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:onesignal_flutter/onesignal_flutter.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_project/home.dart';
import 'package:tutorial_project/providers/apiProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ApiProvider>(create: (_) => ApiProvider()),
  ], child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    init();
  }

  init() async {
    await OneSignal.shared.setAppId("cf9f8521-ec1e-4eb0-b79c-0ed250cea666");
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: LoaderOverlay(child: MainPage()),
    );
  }
}
