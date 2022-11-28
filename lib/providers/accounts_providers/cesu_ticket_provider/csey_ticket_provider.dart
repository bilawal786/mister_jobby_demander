import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../../models/accounts_models/cesu_tickets_model.dart';
import '../../../widgets/home_screen_widgets/login_progress_indicator.dart';

class CseuTicketProvider with ChangeNotifier {

  getData (){
    var data = ticketModel!.where((element) => element.status == 1);
    return data;
  }

  List<CesuTicketModel>? ticketModel;

  Future<void> getCesuTicket() async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? userToken = sharedPref.getString('token');
    var response = await http.get(Uri.parse('${MyRoutes.BASEURL}/demandeur/my/cesu/tickets'),
    headers: <String, String>{
      "Accept":"application/json",
      "Content-Type":"application/json",
      "Authorization":"Bearer $userToken"
    });
    if(response.statusCode == 200){
      debugPrint('CESU get Api is working');
      ticketModel = cesuTicketModelFromJson(response.body);
      notifyListeners();
    }else{
      debugPrint('CESU get Api is not working');
    }

  }

  Future<void> postCesuTicket (BuildContext context, number) async {
    showDialog(context: context, builder: (BuildContext context) {
      return const LoginProgressIndicator();
    });
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? userToken = sharedPref.getString('token');
    var response = await http.post(Uri.parse('${MyRoutes.BASEURL}/demandeur/cesu/ticket/submit'),
    headers: <String, String>{
      "Accept":"application/json",
      "Content-Type":"application/json",
      "Authorization":"Bearer $userToken"
    }, body: jsonEncode( <String, String>{
      "number": number
        })
    );
    if(response.statusCode == 200){
      debugPrint('CSEY post Api is working');
      Navigator.pop(context);
      Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.MYTICKETSROUTE,
            (route) => false,);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text(
            'Ticket Scanned Successfully',
            // textAlign: TextAlign.center,
          ),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
      notifyListeners();
    }else {
      debugPrint('CESU post Api is not working');}
  // print(response.body);
  }
}