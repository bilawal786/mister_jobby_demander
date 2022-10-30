import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../helpers/routes.dart';
import '../../models/categories_models/main_categories_model.dart';

class MainCategoriesProvider with ChangeNotifier {
  List<MainCategoriesModel>? mainCategories;
  String value = 'bricolage';
  void searchFilter(){
    var result =
    mainCategories!.where((element) => element.title==value.toLowerCase());
    print('result $result');
  }

  Future<void> getMainCategories() async {
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if(response.statusCode == 200) {
      print('Main Categories Api is working perfectly.');
      // final extractMainCategories = json.decode();
      mainCategories = mainCategoriesModelFromJson(response.body);
      notifyListeners();
    }else{
      print('Main Categories Api is not working correctly');
    }
    // print(response.body);
  }


}