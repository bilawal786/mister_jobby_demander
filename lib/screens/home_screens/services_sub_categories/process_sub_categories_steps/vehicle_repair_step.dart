import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/group_radio_tile.dart';

class VehicleRepairStep extends StatelessWidget {
  const VehicleRepairStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Vehicle_Repair_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Information_about_Need_Step2_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Vehicle_Repair_Step_Text1_Title".tr(),
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
                  title: "Vehicle_Repair_Step_Radio1_Title",
                  value: 1,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Vehicle_Repair_Step_Radio2_Title",
                  value: 2,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Vehicle_Repair_Step_Radio3_Title",
                  value: 3,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Vehicle_Repair_Step_Radio4_Title",
                  value: 4,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Vehicle_Repair_Step_Radio5_Title",
                  value: 5,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Vehicle_Repair_Step_Radio6_Title",
                  value: 6,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Vehicle_Repair_Step_Radio7_Title",
                  value: 7,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Vehicle_Repair_Step_Radio8_Title",
                  value: 8,
                  groupValue: cleanComputer.groupValue,
                  onClick: cleanComputer.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Vehicle_Repair_Step_Radio9_Title",
                  value: 9,
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
