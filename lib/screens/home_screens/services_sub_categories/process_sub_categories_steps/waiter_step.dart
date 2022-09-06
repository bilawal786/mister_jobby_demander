import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/group_radio_tile.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class WaiterStep extends StatelessWidget {
  const WaiterStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Waiter_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Waiter_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Waiter_Step_Text1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, promptsData, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  onTap: promptsData.fixesAmountDecrement,
                  height: 50,
                  icon: Icons.remove,
                  color: promptsData.fixesAmount < 1
                      ? Colors.blueGrey.shade300
                      : Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                Text(
                  '${promptsData.fixesAmount}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                RoundedButton(
                  onTap: promptsData.fixesAmountIncrement,
                  height: 50,
                  icon: Icons.add,
                  color: Theme.of(context).primaryColor,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Waiter_Step_Text2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
              builder: (_, restoreData, child) => Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                GroupRadioTile(
                  title: "Home_Chef_Step_Radio1_Title",
                  value: 1,
                  groupValue: restoreData.groupValue,
                  onClick: restoreData.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Home_Chef_Step_Radio2_Title",
                  value: 2,
                  groupValue: restoreData.groupValue,
                  onClick: restoreData.checkGroupValue,
                ),
                GroupRadioTile(
                  title: "Home_Chef_Step_Radio3_Title",
                  value: 3,
                  groupValue: restoreData.groupValue,
                  onClick: restoreData.checkGroupValue,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Waiter_Step_Text3_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, jobberData, child) => Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: () {
                      jobberData.jobberRemoveWasteYesFunction();
                    },
                    textTitle: "Yes",
                    border: jobberData.jobberRemoveWasteYes == false
                        ? false
                        : true,
                    color: jobberData.jobberRemoveWasteYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: jobberData.jobberRemoveWasteNoFunction,
                    textTitle: "No",
                    border: jobberData.jobberRemoveWasteNo == false
                        ? false
                        : true,
                    color: jobberData.jobberRemoveWasteNo == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
