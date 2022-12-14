import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:http/http.dart' as http;

import '../../models/categories_models/search_categories_model.dart';

class SearchCategoriesProvider with ChangeNotifier {

  List<SearchCategoriesModel>? searchCategoriesModel;

  Future<void> getSearchCategories() async {
    var response = await http.get(
      Uri.parse('${MyRoutes.BASEURL}/search/categories'),
      headers: <String, String>{
        'Content-Type': 'application/json; charset=UTF-8',
        'Accept': 'application/json',
      },
    );
    if (response.statusCode == 200) {
      debugPrint('Search Categories Api is working.');
      searchCategoriesModel = searchCategoriesModelFromJson(response.body);
      notifyListeners();
    } else {
      debugPrint('Search Categories Api is not working');
    }
  }

  bool isSearch = false;

  List<SearchCategoriesModel>? searchCat;
  void filterCategories(String title) {
    if(title.isEmpty || title == "null")
    {
      searchCat = null;
      debugPrint(title);
      notifyListeners();
    }
    searchCat = searchCategoriesModel?.where((cate) => cate.title.toLowerCase().contains(title.toLowerCase())).toList();
    // debugPrint('sub search categories print:${searchCat![0].title}');
    isSearch = true;
    notifyListeners();
  }

  clearSearchData(context){
    searchCat = null;
    FocusScope.of(context).unfocus();
    isSearch = false;
    notifyListeners();
  }

}