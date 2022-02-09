import 'dart:convert';
import 'dart:developer';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:tutorial_project/modals/cats.dart';
import 'package:tutorial_project/modals/entries.dart';
import 'package:tutorial_project/modals/usaModel.dart';
import 'package:tutorial_project/providers/apiProvider.dart';

class FetchData {
  static String URL = "https://catfact.ninja/fact";
  static String USA_DATA =
      "https://datausa.io/api/data?drilldowns=Nation&measures=Population";
  static String ENTRIES = "https://api.publicapis.org/entries";
  static String ADD_DATA_URL = "https://reqres.in/api/users";
  static String checkNumberUrl =
      "https://app.onfullymarketing.com/app/customer/customer-number-verification/";

  var urlData = Uri.parse(URL);

  void addData(BuildContext context, String username, String job) async {
    var url = Uri.parse(ADD_DATA_URL);
    Map<String, String> bodyData = {"name": username, "job": job};
    Map<String, String> header = {};
    final response = await http.post(url, body: bodyData);
    log("RESPONSE IS" + response.body.toString());
  }

  void checkNumber(BuildContext context, String phoneNumber) async {
    var checkUrl = Uri.parse(checkNumberUrl);
    Map<String, String> body = {"phone_number": phoneNumber};
    final response = await http.post(checkUrl, body: body);
    Navigator.pop(context);
    log("RESPONSE" + response.body.toString());
  }

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

  void fetchEntries(BuildContext context) async {
    var entryUrl = Uri.parse(ENTRIES);
    Map<String, String> headers = {
      "Authorization": "Token AIZGhjvcvjkiuglihguigiu"
    };
    final response = await http.get(entryUrl);
    Map<String, dynamic> responseData = json.decode(response.body);
    EntriesPojo pojo = EntriesPojo.fromJson(responseData);
    Provider.of<ApiProvider>(context, listen: false).setEntries(pojo);
  }

  void fetchUSAData(BuildContext context) async {
    var usaUrl = Uri.parse(USA_DATA);
    Map<String, String> headers = {
      "Authorization": "Token AIZGhjvcvjkiuglihguigiu"
    };
    final response = await http.get(usaUrl);
    Map<String, dynamic> responseData = json.decode(response.body);
    UsaData cats = UsaData.fromJson(responseData);

    Provider.of<ApiProvider>(context, listen: false).setUSAData(cats);
  }
}
