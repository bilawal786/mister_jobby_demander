import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/accounts_models/my_balance_model.dart';
import 'package:http/http.dart' as http;

class MyBalanceProvider with ChangeNotifier {

  MyBalanceModel? myBalanceModel;

  getData (){
    var data = myBalanceModel!.details.where((element) => element.paymentType == "CESU TICKET");
    return data.length;
  }

  Future<void> getMyBalance () async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? userToken = sharedPref.getString('token');
    var response = await http.get(Uri.parse('${MyRoutes.BASEURL}/demandeur/my/wallet/details'),
        headers: <String, String>{
          "Accept":"application/json",
          "Content-Type":"application/json",
          "Authorization":"Bearer $userToken"
        });
    if(response.statusCode == 200){
      debugPrint('My Balance Api is working');
      myBalanceModel = myBalanceModelFromJson(response.body);
      notifyListeners();
    }else{
      debugPrint('My Balance Api is not working');}
  }
}