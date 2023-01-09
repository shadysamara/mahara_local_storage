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
    return sharedPreferences.getBool('isFirstTime') ?? true;
  }

  writeFirstTime() {
    sharedPreferences.setBool('isFirstTime', false);
  }
}
