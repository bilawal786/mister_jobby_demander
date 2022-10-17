import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PreferencesProvider with ChangeNotifier {
  String? token;
  int? id;
  Future<void> checkToken() async {
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? userToken = sharedPrefs.getString("token");
    int? userId = sharedPrefs.getInt("demandeurId");
    token = userToken.toString();
    id = userId?.toInt();
    notifyListeners();
  }

  void logOut(BuildContext context) async{
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    await sharedPrefs.clear();
    Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.SPLASHROUTE, (route) => false);
    notifyListeners();
  }
}