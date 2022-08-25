import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/categories_provider/main_categories_provider.dart';

class SubCategoriesScreen extends StatelessWidget {
  const SubCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final mainCategoryId = routeArgs['id'];
    final mainCategoryData =
        Provider.of<MainCategoriesProvider>(context, listen: false);
    final extractedCategory = mainCategoryData.mainCategories;
    return Scaffold(
      appBar: AppBar(
        title: Text(extractedCategory![mainCategoryId].title),
      ),
      body: Center(
        child: Text(extractedCategory[mainCategoryId]
            .subCategories[mainCategoryId]
            .title),
      ),
    );
  }
}
