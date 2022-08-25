import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class SearchInputField extends StatefulWidget {
  const SearchInputField({Key? key}) : super(key: key);

  @override
  State<SearchInputField> createState() => _SearchInputFieldState();
}

class _SearchInputFieldState extends State<SearchInputField> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10.0),
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Row(
        children: <Widget>[
          Icon(
            Icons.search,
            color: Theme.of(context).iconTheme.color,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            "Search_Hint_Text",
            style: Theme.of(context).textTheme.labelLarge,
          ).tr(),
        ],
      ),
    );
  }
}
