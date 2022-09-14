import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../models/auth_model/register_model.dart';

class RegisterProvider with ChangeNotifier{

  Future<void> registration(BuildContext context, firstName, lastName, email, password, countryId) async{
    var response = await http.post(
      Uri.parse('${MyRoutes.BASEURL}/register'),
      headers: <String, String>{
        'Accept':"application/json",
        'Content-Type':"application/json"
      },
      body: jsonEncode(<String, String>{
        'firstName': firstName,
        'lastName': lastName,
      'email': email,
      'password': password,
      'role': countryId,
    }),
    );
    if(response.statusCode == 200){
      final register = RegisterModel.fromJson(jsonDecode(response.body));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', register.success.token);
      Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.HOMETABROUTE, (route) => false);
      notifyListeners();
    }else{
      print('Register api is not working');
    }
  }
}