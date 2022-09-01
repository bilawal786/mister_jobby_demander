import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class HangTVStep extends StatelessWidget {
  const HangTVStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
          Consumer<ConstProvider>(
            builder: (_, tvData, child) => SizedBox(height:45,child: ListView.builder(
              itemCount: 5,
              padding:const EdgeInsets.only(left: 15,right: 15),
              itemExtent: MediaQuery.of(context).size.width / 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                  onTap: ()=>tvData.tvHangFunction(index),
                  textTitle: index == 0?"One":index==1?"Two":index==2?"Three":index==3?"Four":"Five",
                  color: Colors.grey.shade300,
                  // height: 40,
                  // width: 45,
                  border: tvData.tvHangNo-1 == index ? true : false,
              ),
            ),),
          ),
        ],
      ),
    );
  }
}
