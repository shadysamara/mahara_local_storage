import 'package:shared_preferences/shared_preferences.dart';

class SpHelper {
  SpHelper._();
  static SpHelper spHelper = SpHelper._();
  late SharedPreferences sharedPreferences;
  Future<void> initSp() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  Future<void> saveMyName(String name) async {
    await sharedPreferences.setString('name', name);
  }

  String? getMyName() {
    String? name = sharedPreferences.getString('name');
    return name;
  }

  bool checkIfFirstTime() {
    bool? isFirstTime = sharedPreferences.getBool('isFirstTime');
    // return isFirstTime ?? true;
    if (isFirstTime == null) {
      return true;
    } else {
      return isFirstTime;
    }
  }

  writeFirstTime() {
    sharedPreferences.setBool('isFirstTime', false);
  }
}
