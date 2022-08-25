import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/categories_provider/main_categories_provider.dart';
import '../../../widgets/const_widgets/search_input_field.dart';
import '../../../widgets/home_screen_widgets/service_sub_categories/child_category_items.dart';

class ChildCategoriesScreen extends StatelessWidget {
  const ChildCategoriesScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final routeArgs =
        ModalRoute.of(context)!.settings.arguments as Map<String, dynamic>;
    final mainCategoryId = routeArgs['mainCategoryId'];
    final subCategoryId = routeArgs['subCategoryId'];
    final mainCategoryData =
        Provider.of<MainCategoriesProvider>(context, listen: false);
    final extractedCategory = mainCategoryData.mainCategories;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black38,
        ),
        title: Text(
          extractedCategory![mainCategoryId].subCategories[subCategoryId].title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SearchInputField(),
              ListView.builder(
                padding: const EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: extractedCategory[mainCategoryId]
                    .subCategories[subCategoryId]
                    .childCategories
                    .length,
                itemBuilder: (ctx, index) => ChildCategoriesItems(
                  childCategory: extractedCategory[mainCategoryId]
                      .subCategories[subCategoryId]
                      .childCategories[index],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
