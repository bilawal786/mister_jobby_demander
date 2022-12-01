import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../../helpers/routes.dart';
import '../../models/jobs_models/job_proposals_model.dart';

class JobProposalsProvider with ChangeNotifier {
  List<JobProposalsModel>? jobProposal;

  var checkApi = false;

  setCheckApi(){
    checkApi = false;
    notifyListeners();
  }

  Future<void> getJobProposals(context, jobId) async {
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? userToken = sharePref.getString('token');
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/demandeur/job/proposals/$jobId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
    );
    if(response.statusCode == 200) {
      debugPrint('Job Proposals Api is working perfectly.');
      jobProposal = jobProposalsModelFromJson(response.body);
      checkApi = true;
      notifyListeners();
    } else if(response.statusCode == 401){
      debugPrint('error: 401');
      Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.LOGINROUTE, (route) => false);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding :const EdgeInsets.all(20.0),
          backgroundColor: const Color(0xFFebf9fe),
          content: Text(
            'Session Expired...  Please Log-In',
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
    }
    else{
      Navigator.of(context).pushNamed(MyRoutes.ERRORSCREENROUTE);
      checkApi = true;
      debugPrint('Job Proposals Api is not working correctly');
      notifyListeners();
    }
    // print(response.body);
  }

  Future<void> postProposalContract(proposalId, totalPrice, tax) async {
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? userToken = sharePref.getString('token');
    var response = await http.post(
      Uri.parse('${MyRoutes.BASEURL}/demandeur/proposals/contract'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
      body: jsonEncode(<String, dynamic> {
        'proposal_id': proposalId,
        'price': totalPrice,
        'percentage': tax,
      }),
    );
    if(response.statusCode == 200) {
      debugPrint('Job Proposals Contract Api is working perfectly.');
      notifyListeners();
    }else{
      debugPrint('Job Proposals contract Api is not working correctly');
    }
    // print(response.body);
  }

}