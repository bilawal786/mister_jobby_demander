import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:mister_jobby/providers/jobs_provider/job_proposals_provider.dart';
import 'package:mister_jobby/providers/jobs_provider/job_reservation_provider.dart';
import 'package:mister_jobby/widgets/home_screen_widgets/login_progress_indicator.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';

class RatingProvider with ChangeNotifier {

  double? ratingValue;
  String? message;

  getRating(double value) {
    ratingValue = value;
    notifyListeners();
  }

  getMessage(value){
    message = value;
    notifyListeners();
  }


  Future<void> postRating(context,rating, message, jobId) async {
    showDialog(context: context, builder: (BuildContext context){
      return const LoginProgressIndicator();
    });
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? userToken = sharedPrefs.getString("token");
    try {
      var response = await http.post(
        Uri.parse('${MyRoutes.BASEURL}/demandeur/job/complete/$jobId'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken'
        },
        body: jsonEncode(<String, String>{
          'star': rating.toString(),
          'message': message.toString(),
        }),
      );
      if(response.statusCode == 200) {
        debugPrint("Post Rating Api is working");
        Provider.of<JobReservationProvider>(context, listen: false).getJobReservations(jobId);
        Provider.of<JobProposalsProvider>(context, listen: false).getJobProposals(jobId);
        Navigator.of(context).pop();
        Navigator.of(context).pop();
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'Complete Job Successfully',
              // textAlign: TextAlign.center,
            ),
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
        notifyListeners();
      }
      else {
        debugPrint("Post Rating Api is not working");
        Navigator.of(context).pop();
        notifyListeners();
      }
    }catch(e){
      debugPrint("error exception $e");
    }
  }
}