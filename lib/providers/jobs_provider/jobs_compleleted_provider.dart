import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../models/jobs_models/jobs_completed_model.dart';

class JobsCompletedProvider with ChangeNotifier{
  List<JobsCompletedModel>? jobsCompletedModel;
  
  Future<void> getJobsCompleted(context) async{
    final SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? userToken = sharedPref.getString('token');
    var response = await http.get(Uri.parse('${MyRoutes.BASEURL}/demandeur/jobs/2'),
    headers: <String, String> {
     'Accept':'application/json',
     'Content-Type': 'application/json',
     'Authorization':'Bearer $userToken'
    });
    if(response.statusCode == 200){
      debugPrint('Jobs completed Api is working');
      jobsCompletedModel = jobsCompletedModelFromJson(response.body);
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
      debugPrint('Jobs completed Api is not working');}
  }
}