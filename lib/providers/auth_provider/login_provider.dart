import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../models/auth_model/login_model.dart';

class LoginProvider with ChangeNotifier{

  bool checkObscure = true;

  void toggleObscure(){
    checkObscure = !checkObscure;
    notifyListeners();
  }


  Future<void> login(email, password, countryId) async {
    try {
      var response = await http.post(
        Uri.parse('${MyRoutes.BASEURL}/login'),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Accept': 'application/json'
        },
        body:
        jsonEncode(<String, String>{'email': email, 'password': password, 'role': countryId}),
      );

      if (response.statusCode == 200) {
        final login = LoginModel.fromJson(jsonDecode(response.body));

        final SharedPreferences prefs = await SharedPreferences.getInstance();
        prefs.setString('token', login.success.token);
        prefs.setString(
            'name', '${login.success.user.firstName} ${login.success.user.lastName}');
        prefs.setString('email', login.success.user.email);
        prefs.setString('photo', login.success.user.image);
      }
      else{
        print("Failed to login.");
      }
      print(response.body.toString());
    } catch (e) {
      print(e.toString());
    }
  }

}