import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../providers/categories_provider/search_categories_provider.dart';


class SearchInputField extends StatefulWidget {
  const SearchInputField({Key? key}) : super(key: key);

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {

  @override
  Widget build(BuildContext context) {
      final filterData = Provider.of<SearchCategoriesProvider>(context);
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        onChanged: (value){
          debugPrint(value);
          filterData.filterCategories(value);
        },
        style: Theme.of(context).textTheme.labelMedium,
        decoration: InputDecoration(
          iconColor: Colors.grey,
          focusColor: Colors.grey,
          prefixIcon: const Icon(Icons.search),
          prefixIconColor: Colors.grey,
          border: InputBorder.none,
          hintText: "Search_Hint_Text".tr(),
          hintStyle: Theme.of(context).textTheme.labelLarge,
          contentPadding: const EdgeInsets.fromLTRB(15, 13, 15, 10),
        ),
      ),
    );
  }
}
