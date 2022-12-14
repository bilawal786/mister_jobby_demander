import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../helpers/routes.dart';
import '../../models/categories_models/main_categories_model.dart';

class MainCategoriesProvider with ChangeNotifier {
  List<MainCategoriesModel>? mainCategories;
  List<SubCategory>? subCategory;
  // String value = 'bricolage';

  Future<void> getMainCategories() async {
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      debugPrint('Main Categories Api is working perfectly.');
      // final extractMainCategories = json.decode();
      mainCategories = mainCategoriesModelFromJson(response.body);
      notifyListeners();
    } else {
      debugPrint('Main Categories Api is not working correctly');
    }
    // print(response.body);
  }

  List<MainCategoriesModel>? searchPost;

  void findByCategories(String title) {
    if (title.isEmpty) {
      searchPost = null;
      debugPrint(title);
    }
    searchPost = mainCategories!
        .where((
          cate,
        ) =>
            cate.title.toLowerCase().contains(title))
        .toList();
    debugPrint('search categories print:${searchPost?[0].title}');
    notifyListeners();
  }
}
