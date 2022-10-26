import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../../helpers/routes.dart';
import '../../../models/accounts_models/terms_and_condition_model/term_and_condition_model.dart';
class TermsAndConditionProvider with ChangeNotifier{

   TermsAndConditionModel? termsAndCondition;

  Future<void> getTermsAndConditions ()async{
    var response = await http.get(Uri.parse('${MyRoutes.BASEURL}/terms/and/privacy'),
      headers: <String, String>{
      'Accept':'application/json',
        'Content-Type' : 'application/json',
      }
      ,);

    if(response.statusCode == 200){
      debugPrint('Terms and conditions API is working');
      termsAndCondition = TermsAndConditionModel.fromJson(json.decode(response.body));
      notifyListeners();
    }
    else{
      debugPrint('Terms and conditions API is not working');
    }

  }
}