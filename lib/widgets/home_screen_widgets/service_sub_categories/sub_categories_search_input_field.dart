import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/categories_provider/main_categories_provider.dart';
import 'package:provider/provider.dart';


class SubSearchInputField extends StatefulWidget {
  const SubSearchInputField({Key? key}) : super(key: key);

  @override
  State<SubSearchInputField> createState() => _SubSearchInputFieldState();
}

class _SubSearchInputFieldState extends State<SubSearchInputField> {

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
          filterData.findBySubCategories(value);
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