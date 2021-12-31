import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tutorial_project/modals/cats.dart';
import 'package:tutorial_project/providers/apiProvider.dart';

class FetchData {
  static String URL = "https://catfact.ninja/fact";

  var urlData = Uri.parse(URL);

  void getData(BuildContext context) async {
    Map<String, String> headers = {
      "Authorization": "Token AIZGhjvcvjkiuglihguigiu"
    };
    final response = await http.get(urlData);
    Map<String, dynamic> responseData = json.decode(response.body);
    Cats cats = Cats.fromJson(responseData);

    Provider.of<ApiProvider>(context, listen: false).setCatsData(cats);
    log("RESPONSE FROM API IS" + cats.fact);
  }
}