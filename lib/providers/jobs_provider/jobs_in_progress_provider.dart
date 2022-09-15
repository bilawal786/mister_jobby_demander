import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../helpers/routes.dart';
import '../../models/jobs_models/jobs_in_progress_model.dart';

class JobsInProgressProvider with ChangeNotifier {
  List<JobsInProgressModel>? inProgressJobs;

  Future<void> getInProgressJobs() async {
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? userToken = sharePref.getString('token');
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/demandeur/jobs/1'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
    );
    if(response.statusCode == 200) {
      print('InProgress Jobs Api is working perfectly.');
      inProgressJobs = jobsInProgressModelFromJson(response.body);
      notifyListeners();
    }else{
      print('InProgress Jobs Api is not working correctly');
    }
    // print(response.body);
  }
}
