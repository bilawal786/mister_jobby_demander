import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class HangTVStep extends StatelessWidget {
  const HangTVStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
        Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Curtain_Installation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Hang_TV_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: OutlineSelectedButton(onTap: () {}, textTitle: "One", color: Colors.grey.shade300,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 40,
              ),
              Expanded(
                child: OutlineSelectedButton(onTap: () {}, textTitle: "Two", color: Colors.grey.shade300,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 40,
              ),
              Expanded(
                child: OutlineSelectedButton(onTap: () {}, textTitle: "Three", color: Colors.grey.shade300,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 40,
              ),
              Expanded(
                child: OutlineSelectedButton(onTap: () {}, textTitle: "Four", color: Colors.grey.shade300,),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 40,
              ),
              Expanded(
                child: OutlineSelectedButton(onTap: () {}, textTitle: "Five", color: Colors.grey.shade300,),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
