import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;

import '../models/coordinatesModel.dart';
import '../widgets/home_screen_widgets/login_progress_indicator.dart';

class CoordinateProvider with ChangeNotifier {
  CoordinatesModel? getCoordinates;

  Future<void> getLatLngGeoCodingApi(context, String address) async {
    showDialog(context: context, barrierDismissible: false, builder: (BuildContext context){
      return const LoginProgressIndicator();
    });
    String geoCodingApiKey = "AIzaSyAeKxMwTMJzHH2AR1xt7OLWIWFMIzm-JLM&libraries";
    String geoCodingBaseUrl = "https://maps.googleapis.com/maps/api/geocode/json";
    String requestUrl = "$geoCodingBaseUrl?address=$address&key=$geoCodingApiKey";
    var response = await http.get(Uri.parse(requestUrl));
    if(response.statusCode == 200){

        getCoordinates = CoordinatesModel.fromJson(jsonDecode(response.body));
      Navigator.of(context).pop();
      // print("response : ${response.body}");
      notifyListeners();
    }else {
      Navigator.of(context).pop();
      debugPrint("geoCoding coordinates api is not working");
      notifyListeners();
    }
  }
}