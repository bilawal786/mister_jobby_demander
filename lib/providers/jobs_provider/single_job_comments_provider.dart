import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/accounts_providers/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:http/http.dart' as http;

import '../../helpers/routes.dart';
import '../../models/jobs_models/single_job_comments.dart';

class SingleJobCommentsProvider with ChangeNotifier {
  List<SingleJobCommentsModel>? singleJobComments;

  Future<void> getSingleJobComments(context,jobId) async {
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? userToken = sharePref.getString('token');
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/demandeur/getComments/$jobId'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
    );
    if (response.statusCode == 200) {
      debugPrint('Single Job Comments Api is working perfectly.');
      singleJobComments = singleJobCommentsModelFromJson(response.body);
      notifyListeners();
    }  else if(response.statusCode == 401){
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
      debugPrint('Single Job Comments Api is not working correctly');
    }
    notifyListeners();
  }

  void postSingleComment(BuildContext context, SingleJobCommentsModel sComments, int jobId) async {
    final profileData = Provider.of<ProfileProvider>(context,listen: false).myProfile;
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? userToken = sharedPrefs.getString("token");
    var response = await http.post(
      Uri.parse('${MyRoutes.BASEURL}/demandeur/comments'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${userToken!}',
      },
      body: jsonEncode(<String, String>{
        'job_id': jobId.toString(),
        'comment': sComments.message
      }),
    );
    if (response.statusCode == 200) {
      final newComment = SingleJobCommentsModel(
          id: 0,
          userId: profileData!.demandeurId!,
          name: "${profileData.firstName} ${profileData.lastName}",
          image: profileData.image!,
          message: sComments.message,
          date: sComments.date,
      );
      singleJobComments!.add(newComment);
      print("Comment Post API WORKS");
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
      debugPrint("Comment Post API NOT WORKS");
    }
    // print(response.body);
    notifyListeners();
  }
}
