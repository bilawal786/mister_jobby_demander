import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../models/notification_model/notification_model.dart';

class NotificationProvider with ChangeNotifier {
  List<NotificationModel>? notificationItems;

  Future<void> getNotification() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('token');
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/notification'),
      headers: <String, String>{
        'Accept': 'application/json',
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $userToken'
      },
    );
    if(response.statusCode == 200) {
      debugPrint('Notifications Api is working');
      notificationItems = notificationModelFromJson(response.body);
    }else{
      debugPrint('Notifications Api is not working');
    }
  }

}