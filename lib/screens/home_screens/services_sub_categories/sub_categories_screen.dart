import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:provider/provider.dart';

import '../../../providers/categories_provider/main_categories_provider.dart';
import '../../../widgets/const_widgets/search_button.dart';
import '../../../widgets/home_screen_widgets/service_sub_categories/sub_categories_items.dart';

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
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black38,
        ),
        title: Text(
          extractedCategory![mainCategoryId].title,
          style: Theme.of(context).textTheme.bodyLarge,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              const SearchButton(),
              ListView.builder(
                padding: const EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount:
                    extractedCategory[mainCategoryId].subCategories.length,
                itemBuilder: (ctx, index) => InkWell(
                  onTap: () {
                    Navigator.of(context)
                        .pushNamed(MyRoutes.CHILDCATEGORYROUTE, arguments: {
                      'subCategoryId': extractedCategory[mainCategoryId]
                              .subCategories[index]
                              .id -
                          1,
                      'mainCategoryId': mainCategoryId,
                    });
                  },
                  child: SubCategoriesItems(
                    subCategory:
                        extractedCategory[mainCategoryId].subCategories[index],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
