import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../widgets/home_screen_widgets/login_progress_indicator.dart';
import 'job_reservation_provider.dart';

class CancelReservationProvider with ChangeNotifier {

  Future<void> cancelJobReservations(context, reservationId, jobId) async {
    showDialog(context: context, builder: (BuildContext context){
      return const LoginProgressIndicator();
    });
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? userToken = sharePref.getString('token');
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/demandeur/cancel/contract/$reservationId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
    );
    if(response.statusCode == 200) {
      debugPrint('Cancel Job Reservation Api is working perfectly.');
      Navigator.of(context).pop();
      Provider.of<JobReservationProvider>(context,listen: false).getJobReservations(jobId);
      notifyListeners();
    }else{
      debugPrint('Cancel Job Reservation Api is not working correctly');
    }
    // print(response.body);
  }

}