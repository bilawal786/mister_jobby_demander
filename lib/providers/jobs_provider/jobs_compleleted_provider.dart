import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/jobs_models/jobs_completed_model.dart';

class JobsCompletedProvider with ChangeNotifier{
  List<JobsCompletedModel>? jobsCompletedModel;
  
  Future<void> getJobsCompleted() async{
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? UserToken = sharedPref.getString('token');
    var response = await http.get(Uri.parse('${MyRoutes.BASEURL}/demandeur/jobs/2'),
    headers: <String, String> {
     'Accept':'application/json',
     'Content-Type': 'application/json',
     'Authorization':'Bearer $UserToken'
    });
    if(response.statusCode == 200){
      debugPrint('Jobs completed Api is working');
      jobsCompletedModel = jobsCompletedModelFromJson(response.body);
      notifyListeners();
    }else{debugPrint('Jobs completed Api is not working');}
  }
}