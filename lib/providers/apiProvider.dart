import 'package:flutter/cupertino.dart';
import 'package:tutorial_project/modals/cats.dart';
import 'package:tutorial_project/repository/fetchDatas.dart';

class ApiProvider with ChangeNotifier {
  Cats? catsData;

  fetchDataFromRepo(BuildContext context) {
    FetchData data = FetchData();
    data.getData(context);
  }

  setCatsData(Cats cats) {
    this.catsData = cats;
    notifyListeners();
  }
}
