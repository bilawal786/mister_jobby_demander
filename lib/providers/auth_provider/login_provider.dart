import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../models/auth_model/login_model.dart';
import '../../widgets/home_screen_widgets/login_progress_indicator.dart';

class LoginProvider with ChangeNotifier {
  bool checkObscure = true;
  void toggleObscure() {
    checkObscure = !checkObscure;
    notifyListeners();
  }

  Future<void> login(BuildContext context, email, password) async {
    showDialog(context: context, builder: (BuildContext context){
      return const LoginProgressIndicator();
    });
    try {
      var response = await http.post(
        Uri.parse('${MyRoutes.BASEURL}/login'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json'
        },
        body: jsonEncode(<String, String>{
          'email': email.toString(),
          'password': password.toString(),
          'role': 2.toString(),
        }),
      );
      if (response.statusCode == 200) {
        final login = LoginModel.fromJson(jsonDecode(response.body));
        final SharedPreferences prefs = await SharedPreferences.getInstance();
        await prefs.setString('token', login.success.token);
        await prefs.setInt('demandeurId', login.success.id);
        Navigator.pop(context);
        Navigator.of(context).pushNamedAndRemoveUntil(
          MyRoutes.SPLASHROUTE,
          (route) => false,
        );
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
           SnackBar(
            padding: const EdgeInsets.all(20.0),
            backgroundColor: const Color(0xFFebf9fe),
            content: Text(
              'Login Successfully',
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
            duration: const Duration(
              seconds: 2,
            ),
          ),
        );
        notifyListeners();
      } else {
        Navigator.of(context).pop();
        print("Failed to login.");
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: const Color(0xFFebf9fe),
            content: Text(
              'Incorrect Credentials',
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
            duration: const Duration(
              seconds: 2,
            ),
          ),
        );
      }
      // print(response.body.toString());
    } catch (e) {
      print(e.toString());
    }
    notifyListeners();
  }
}
