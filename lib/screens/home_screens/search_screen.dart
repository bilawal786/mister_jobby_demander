import 'package:flutter/material.dart';

import 'package:easy_localization/easy_localization.dart';

import '../../widgets/const_widgets/search_input_field.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
        bottom:const PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SearchInputField(),
        ),
      ),
      body: SingleChildScrollView(
        child:Column() ,
      ),
    );
  }
}
