import 'package:flutter/material.dart';
import 'package:mahara_db/sp_helper.dart';

class AppProvider extends ChangeNotifier {
  AppProvider() {
    SpHelper.spHelper.initSp().then((value) {
      getUser();
    });
  }

  TextEditingController editingController = TextEditingController();
  String? name;
  saveUser() async {
    await SpHelper.spHelper.saveMyName(editingController.text);
    getUser();
  }

  getUser() {
    name = SpHelper.spHelper.getMyName();
    notifyListeners();
  }

  getFirstTime(){}
}
