import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text("Search_Hint_Text", style: Theme.of(context).textTheme.titleMedium,).tr(),),
    );
  }
}
