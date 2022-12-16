import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mister_jobby/helpers/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../widgets/home_screen_widgets/login_progress_indicator.dart';

class GiftCardProvider with ChangeNotifier {
  Future<void> postGiftCard(BuildContext context, number) async {
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const LoginProgressIndicator();
        });
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? userToken = sharedPref.getString('token');
    var response = await http.post(
        Uri.parse("${MyRoutes.BASEURL}/demandeur/redeem/gift/card"),
        headers: <String, String>{
          "Accept": "application/json",
          "Content-Type": "application/json",
          "Authorization": "Bearer $userToken"
        },
        body: jsonEncode(<String, String>{"number": number}));
    if (response.statusCode == 200) {
      debugPrint('Gift Card post Api is working');
      Navigator.pop(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding :const EdgeInsets.all(20.0),
          backgroundColor: const Color(0xFFebf9fe),
          content: Text(
            'Gift Card Redeem Successfully',
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
      debugPrint('Gift card post Api is not working');
      Navigator.of(context).pushNamed(MyRoutes.ERRORSCREENROUTE);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding :const EdgeInsets.all(20.0),
          backgroundColor: const Color(0xFFebf9fe),
          content: Text(
            'Gift Card Number not exist'.tr(),
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
      notifyListeners();
    }
    // print(response.body);
  }
}
