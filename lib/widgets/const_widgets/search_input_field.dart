import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/models/categories_models/main_categories_model.dart';
import 'package:mister_jobby/providers/categories_provider/main_categories_provider.dart';
import 'package:provider/provider.dart';


class SearchInputField extends StatefulWidget {
  const SearchInputField({Key? key}) : super(key: key);

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {

  @override
  Widget build(BuildContext context) {
      final filterData = Provider.of<MainCategoriesProvider>(context);
    return Container(
      margin: const EdgeInsets.only(left: 15, right: 15),
      decoration: BoxDecoration(
          color: Colors.grey.shade200, borderRadius: BorderRadius.circular(10)),
      child: TextFormField(
        onChanged: (value){
          print(value);
          filterData.findByCategories(value);
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
