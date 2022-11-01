import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../helpers/routes.dart';
import '../../models/jobs_models/jobs_in_progress_model.dart';
import '../../screens/home_screens/home_tabs_screen.dart';
import '../../widgets/home_screen_widgets/login_progress_indicator.dart';

class JobsInProgressProvider with ChangeNotifier {
  List<JobsInProgressModel>? inProgressJobs;
  
  Future<void>closeThisJob(context, jobId)async{
    showDialog(context: context, builder: (BuildContext context){
      return const LoginProgressIndicator();
    });
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? userToken = sharePref.getString('token');
    var response = await http.get(Uri.parse('${MyRoutes.BASEURL}/demandeur/job/close/$jobId'),
    headers: <String, String>{
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization': 'Bearer $userToken'
    }
    );
    if(response.statusCode == 200){
      debugPrint('Close this job API is working');
      Navigator.pop(context);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text(
            'Closed this Job Successfully',
            // textAlign: TextAlign.center,
          ),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
      Navigator.of(context).pushReplacement(MaterialPageRoute(
        builder: (context) => MyHomeBottomTabScreen(pageIndex: 1),
      ),);
      notifyListeners();
    }else{
      debugPrint('Close this job API is not working');
    }
  }

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
