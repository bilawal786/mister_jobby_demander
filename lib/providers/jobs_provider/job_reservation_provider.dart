import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../models/jobs_models/job_reservations_model.dart';

class JobReservationProvider with ChangeNotifier {
  List<JobReservationsModel>? jobReservations;

  Future<void> getJobReservations(jobId) async {
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? userToken = sharePref.getString('token');
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/demandeur/contract/$jobId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
    );
    if(response.statusCode == 200) {
      debugPrint('Job Reservation Api is working perfectly.');
      jobReservations = jobReservationsModelFromJson(response.body);
      notifyListeners();
    }else{
      debugPrint('Job Reservation Api is not working correctly');
    }
    // print(response.body);
  }
}