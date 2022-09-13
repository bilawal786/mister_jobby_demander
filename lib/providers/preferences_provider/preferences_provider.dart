import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider with ChangeNotifier {
  String? token;
  Future<void> checkToken() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? userToken = sharedPrefs.getString("token");
    token = userToken.toString();
    notifyListeners();
  }

  void logOut(BuildContext context){
    token= null;
    Navigator.of(context).pushReplacementNamed(MyRoutes.HOMETABROUTE);
    notifyListeners();
  }
}