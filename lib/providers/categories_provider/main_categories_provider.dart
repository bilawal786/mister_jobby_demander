import 'package:flutter/material.dart';

import '../../models/categories_models/main_categories_model.dart';

class MainCategoriesProvider with ChangeNotifier {
  List<MainCategoriesModel> _mainCategories = [];

  List<MainCategoriesModel> get mainCategories {
    return [..._mainCategories];
  }



}