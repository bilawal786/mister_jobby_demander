import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../../helpers/routes.dart';
import '../../models/jobs_models/job_proposals_model.dart';

class JobProposalsProvider with ChangeNotifier {
  List<JobProposalsModel>? jobProposal;

  Future<void> getJobProposals(jobId) async {
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
      print('Job Proposals Api is working perfectly.');
      jobProposal = jobProposalsModelFromJson(response.body);
      notifyListeners();
    }else{
      print('Job Proposals Api is not working correctly');
    }
    // print(response.body);
  }

}