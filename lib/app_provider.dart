import 'package:flutter/material.dart';
import 'package:mahara_db/db_helper.dart';
import 'package:mahara_db/sp_helper.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    DbHelper.dbHelper.initilizaDb();
    SpHelper.spHelper.initSp().then((value) {
      getUser();
      getFirstTime();
    });
  }

  TextEditingController editingController = TextEditingController();
  String content = '';

  String? name;
  saveUser() async {
    await SpHelper.spHelper.saveMyName(editingController.text);
    getUser();
  }

  getUser() {
    name = SpHelper.spHelper.getMyName();
    notifyListeners();
  }

  getFirstTime() {
    bool isFirstTime = SpHelper.spHelper.checkIfFirstTime();
    if (isFirstTime) {
      content = "this is the first time in the app";
      SpHelper.spHelper.writeFirstTime();
    } else {
      content = "you are an old user, hello my friend";
    }
    notifyListeners();
  }
}
