import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import '../../helpers/routes.dart';
import '../../models/categories_models/main_categories_model.dart';
import '../../models/search_model.dart';

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

  List searchAll = [];

  getSearchData() {
    print("Get Search is working");
    var mData;
    var sData;
    var cData;
    for (int i = 0; i < mainCategories!.length; i++) {
      mData = SearchMainCategoryModel(
        mainCategoryId: mainCategories![i].id,
        mainCategoryImageUrl: mainCategories![i].image,
        mainCategoryTitle: mainCategories![i].title,
      );
      searchAll.add(mData);
      for(int j = 0; j< mainCategories![i].subCategories.length; j++){
        sData = SearchSubCategoryModel(
            subCategoryId: mainCategories![i].subCategories[j].id,
            subCategoryTitle: mainCategories![i].subCategories[j].title,
            subCategoryImageUrl: mainCategories![i].subCategories[j].image,
        );
        searchAll.add(sData);
        for(int k = 0; k< mainCategories![i].subCategories[j].childCategories.length ; k++){
           cData = SearchChildCategoryModel(
              childCategoryId: mainCategories![i].subCategories[j].childCategories[k].id,
              childCategoryTitle: mainCategories![i].subCategories[j].childCategories[k].title,
              childCategoryImageUrl: mainCategories![i].subCategories[j].childCategories[k].img,
          );
           searchAll.add(cData);
        }
      }
    }
    print("search all  + ${searchAll.length}");
    print("search all  + ${searchAll[0].toString()}");
    // print("search all  + ${searchAll[0]}");
    // print("main  + ${mData}");
    // print("sub  + ${sData}");
    notifyListeners();
  }
}
