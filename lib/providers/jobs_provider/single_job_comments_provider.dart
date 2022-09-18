import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart'as http;

import '../../helpers/routes.dart';
import '../../models/jobs_models/single_job_comments.dart';

class SingleJobCommentsProvider with ChangeNotifier {
  List<SingleJobCommentsModel>? singleJobComments;

  Future<void> getSingleJobComments(jobId) async {
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? userToken = sharePref.getString('token');
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/getComments/$jobId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
    );
    if(response.statusCode == 200) {
      print('Single Job Comments Api is working perfectly.');
      singleJobComments = singleJobCommentsModelFromJson(response.body);
      notifyListeners();
    }else{
      print('Single Job Comments Api is not working correctly');
    }
  }
}