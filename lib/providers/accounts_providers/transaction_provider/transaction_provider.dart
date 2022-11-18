import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../models/accounts_models/transaction_model.dart';

class TransactionProvider with ChangeNotifier{

  List<TransactionModel>? transactionModel;

  Future<void> getTransaction() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? userToken = sharedPref.getString('token');
    var response = await http.get(Uri.parse('${MyRoutes.BASEURL}/demandeur/transactions'),
        headers: <String, String>{
          "Accept":"application/json",
          "Content-Type":"application/json",
          "Authorization":"Bearer $userToken"
        });
    if(response.statusCode == 200){
      debugPrint('Transaction Api is working');
      transactionModel = transactionModelFromJson(response.body);
      notifyListeners();
    }else{
      debugPrint('Transaction Api is not working');
    }

  }
}