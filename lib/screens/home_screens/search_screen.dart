import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../helpers/routes.dart';
import '../../widgets/const_widgets/search_input_field.dart';

import '../../../providers/categories_provider/main_categories_provider.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCategoryData =
        Provider.of<MainCategoriesProvider>(context, listen: false);
    final extractMainCategory = mainCategoryData.mainCategories;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black38,
        ),
        title: Text(
          "Search_Screen_AppBar_Title",
          style: Theme.of(context).textTheme.bodyLarge,
        ).tr(),
        bottom: const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchInputField(),
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              ListView.builder(
                padding: const EdgeInsets.only(
                    left: 0.0, top: 10.0, right: 0.0, bottom: 10.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: extractMainCategory!.length,
                itemBuilder: (ctx, index) => InkWell(
                  onTap: () => Navigator.of(context).pushNamed(
                    MyRoutes.SUBCATEGORYROUTE,
                    arguments: {
                      'index': index,
                      'mainId': extractMainCategory[index].id,
                    },
                  ),
                  child: ListTile(
                    contentPadding: const EdgeInsets.only(
                        left: 0.0, bottom: 10.0, top: 10.0, right: 0.0),
                    leading: Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.0),
                        // color: Colors.green,
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(10.0),
                        child: Image.network(
                          '${MyRoutes.IMAGEURL}/${extractMainCategory[index].image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    title: Text(
                      extractMainCategory[index].title,
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                    trailing: const Icon(
                      Icons.arrow_forward_ios_outlined,
                      size: 20,
                    ),
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
