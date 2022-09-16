import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/categories_provider/main_categories_provider.dart';
import 'package:provider/provider.dart';

import '../home_screen_widgets/popular_services_list_item.dart';

class PopularServicesListView extends StatelessWidget {
  const PopularServicesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCategoryData = Provider.of<MainCategoriesProvider>(context, listen: false);
    final extractData = mainCategoryData.mainCategories;
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (ctx, index) => PopularServicesListItems(childCategory: extractData![0].subCategories[0].childCategories[index]),
      ),
    );
  }
}
