import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../widgets/home_screen_widgets/login_progress_indicator.dart';
import 'job_reservation_provider.dart';

class CancelReservationProvider with ChangeNotifier {

  Future<void> cancelJobReservations(context, reservationId, jobId) async {
    showDialog(context: context, barrierDismissible: false, builder: (BuildContext context){
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
      Provider.of<JobReservationProvider>(context,listen: false).getJobReservations(context, jobId);
      notifyListeners();
    }else if(response.statusCode == 401){
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
      debugPrint('Cancel Job Reservation Api is not working correctly');
    }
    // print(response.body);
  }

}