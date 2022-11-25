import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../../models/accounts_models/my_balance_model.dart';
import 'package:http/http.dart' as http;

import '../../../screens/jobs_screens/payment_success_screen.dart';
import '../../../widgets/home_screen_widgets/login_progress_indicator.dart';

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
  
  Future<void> payFromWallet(BuildContext context,proposalId, price, percentage) async{
    showDialog(
        context: context,
        builder: (BuildContext context) {
          return const LoginProgressIndicator();
        });
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? userToken = sharedPref.getString('token');
    var response = await http.post(Uri.parse("${MyRoutes.BASEURL}/demandeur/pay/via/wallet"),
        headers: <String, String>{
          "Accept":"application/json",
          "Content-Type":"application/json",
          "Authorization":"Bearer $userToken"
        },body: jsonEncode(<String, dynamic> {
        'proposal_id': proposalId,
        'price': price,
        'percentage': percentage,
      }),);
    if(response.statusCode == 200){
      debugPrint('Pay from wallet Api is working');
      Navigator.of(context).pop();
      Provider.of<MyBalanceProvider>(context, listen: false).getMyBalance();
      Navigator.of(context).pop();
      notifyListeners();
    }else{
      debugPrint('Pay from wallet Api is not working');
    }
  }
  
}