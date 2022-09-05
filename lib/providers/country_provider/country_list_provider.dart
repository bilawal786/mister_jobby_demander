import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:mister_jobby/models/country_model/country_model.dart';

class CountryProvider with ChangeNotifier{
  List<CountryModel>? countryList;
  
  Future <void> getCountries() async {
    var response = await get(
      Uri.parse("${MyRoutes.BASEURL}/country"),
      headers: <String,String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if(response.statusCode == 200){
      print('country Api is working perfectly.');
      countryList = countryModelFromJson(response.body);
    }else{
      print('country Api is not working perfectly.');
    }
  }
}