import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../models/auth_model/registration_model.dart';
import '../../widgets/home_screen_widgets/login_progress_indicator.dart';

class RegisterProvider with ChangeNotifier {
  bool checkObscure = true;
  void toggleObscure() {
    checkObscure = !checkObscure;
    notifyListeners();
  }

  Future<void> registration(BuildContext context, firstName, lastName, email,
      password) async {
    showDialog(context: context, barrierDismissible: false, builder: (BuildContext context){
      return const LoginProgressIndicator();
    });
    var response = await http.post(
      Uri.parse('${MyRoutes.BASEURL}/register'),
      headers: <String, String>{
        'Accept': "application/json",
        'Content-Type': "application/json"
      },
      body: jsonEncode(<String, String>{
        'firstName': firstName.toString(),
        'lastName': lastName.toString(),
        'email': email.toString(),
        'password': password.toString(),
        'role': 2.toString(),
      }),
    );
    if (response.statusCode == 200) {
      Navigator.pop(context);
      final register = RegistrationModel.fromJson(jsonDecode(response.body));
      final SharedPreferences prefs = await SharedPreferences.getInstance();
      await prefs.setString('token', register.success.token);
      await prefs.setInt('demandeurId', register.success.id);
      Navigator.of(context)
          .pushNamedAndRemoveUntil(MyRoutes.SPLASHROUTE, (route) => false);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding :const EdgeInsets.all(20.0),
          backgroundColor: const Color(0xFFebf9fe),
          content: Text(
            'Registration Successfully',
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
      notifyListeners();
    } else {
      Navigator.pop(context);
      print('Register api is not working');
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding :const EdgeInsets.all(20.0),
          backgroundColor: const Color(0xFFebf9fe),
          content: Text(
            'Already Registered',
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
    }
  }
}
