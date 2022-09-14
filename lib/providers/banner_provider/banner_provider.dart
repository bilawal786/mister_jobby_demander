import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../models/banner_model/banner_model.dart';

class BannerProvider with ChangeNotifier {
  BannerModel? myBanner;

  Future<void> getBanner() async {
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? userToken = sharePref.getString('token');
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/slider/galery/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
    );
    if(response.statusCode == 200) {
      print('Banner Api is working perfectly.');
      final extractBannerData = json.decode(response.body);
      myBanner = BannerModel.fromJson(extractBannerData);
      notifyListeners();
    }else{
      print('Banner Api is not working correctly');
    }
    print(response.body);
  }
}