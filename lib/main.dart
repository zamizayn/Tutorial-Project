import 'package:flutter/material.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:tutorial_project/home.dart';
import 'package:tutorial_project/providers/apiProvider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider<ApiProvider>(create: (_) => ApiProvider()),
  ], child: MyApp()));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

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
