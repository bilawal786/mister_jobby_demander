import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/group_radio_tile.dart';

class TroubleShootingStep extends StatelessWidget {
  const TroubleShootingStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "TroubleShooting_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "TroubleShooting_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "TroubleShooting_Step_Text1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, cleanComputer, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GroupRadioTile(
                  title: "TroubleShooting_Step_Radio1_Title",
                  value: 1,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "TroubleShooting_Step_Radio2_Title",
                  value: 2,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "TroubleShooting_Step_Text2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, cleanComputer, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GroupRadioTile(
                  title: "TroubleShooting_Step_Radio3_Title",
                  value: 1,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "TroubleShooting_Step_Radio4_Title",
                  value: 2,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
