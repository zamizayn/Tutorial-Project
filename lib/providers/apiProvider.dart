import 'package:flutter/cupertino.dart';
import 'package:tutorial_project/modals/cats.dart';
import 'package:tutorial_project/modals/entries.dart';
import 'package:tutorial_project/modals/usaModel.dart';
import 'package:tutorial_project/repository/fetchDatas.dart';
import 'package:tutorial_project/utils/custom.dart';

class ApiProvider with ChangeNotifier {
  Cats? catsData;
  UsaData? datas;
  EntriesPojo? entriesPojo;
  FetchData data = FetchData();

  setEntries(EntriesPojo pojo) {
    this.entriesPojo = pojo;
    notifyListeners();
  }

  checkNumberApi(BuildContext context, String phoneNumber) {
    getLoading(context);
    data.checkNumber(context, phoneNumber);
  }

  callAddData(BuildContext context, String name, String job) {
    data.addData(context, name, job);
  }

  fetchDataFromRepo(BuildContext context) {
    FetchData data = FetchData();
    data.getData(context);
  }

  setCatsData(Cats cats) {
    this.catsData = cats;
    notifyListeners();
  }

  fetchUsaData(BuildContext context) {
    FetchData data = FetchData();
    data.fetchUSAData(context);
  }

  fetchEntries(BuildContext context) {
    data.fetchEntries(context);
  }

  setUSAData(UsaData usaData) {
    this.datas = usaData;
    notifyListeners();
  }
}
