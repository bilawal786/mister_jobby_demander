import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/group_radio_tile.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class HomeChefStep extends StatelessWidget {
  const HomeChefStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Home_Chef_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Home_Chef_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Home_Chef_Step_Text1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, restorationData, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  onTap: restorationData.fixesAmountDecrement,
                  height: 50,
                  icon: Icons.remove,
                  color: restorationData.fixesAmount < 1
                      ? Colors.blueGrey.shade300
                      : Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                Text(
                  '${restorationData.fixesAmount}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                RoundedButton(
                  onTap: restorationData.fixesAmountIncrement,
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
            "Home_Chef_Step_Text2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_,restoreModeData, child) =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GroupRadioTile(
                      title: "Home_Chef_Step_Radio1_Title",
                      value: 1,
                      groupValue: restoreModeData.groupValue,
                      onClick: restoreModeData.checkGroupValue,
                    ),
                    GroupRadioTile(
                      title: "Home_Chef_Step_Radio2_Title",
                      value: 2,
                      groupValue: restoreModeData.groupValue,
                      onClick: restoreModeData.checkGroupValue,
                    ),
                    GroupRadioTile(
                      title: "Home_Chef_Step_Radio3_Title",
                      value: 3,
                      groupValue: restoreModeData.groupValue,
                      onClick: restoreModeData.checkGroupValue,
                    ),
                  ],
                ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Home_Chef_Step_Button1_Title".tr(),
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
                      jobberData.jobberBringMaterialYesFunction();
                    },
                    textTitle: "Yes",
                    border: jobberData.jobberBringMaterialYes == false
                        ? false
                        : true,
                    color: jobberData.jobberBringMaterialYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: jobberData.jobberBringMaterialNoFunction,
                    textTitle: "No",
                    border: jobberData.jobberBringMaterialNo == false
                        ? false
                        : true,
                    color: jobberData.jobberBringMaterialNo == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 30,
          ),
          Text(
            "Home_Chef_Step_Button2_Title".tr(),
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
                      jobberData.jobberHedgeTimerYesFunction();
                    },
                    textTitle: "Yes",
                    border: jobberData.jobberHedgeTimerYes == false
                        ? false
                        : true,
                    color: jobberData.jobberHedgeTimerYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: jobberData.jobberHedgeTimerNoFunction,
                    textTitle: "No",
                    border: jobberData.jobberHedgeTimerNo == false
                        ? false
                        : true,
                    color: jobberData.jobberHedgeTimerNo == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 30,
          ),
          Text(
            "Home_Chef_Step_Button3_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, jobberData, child) => SizedBox(height:45,child: ListView.builder(
              itemCount: 2,
              itemExtent: MediaQuery.of(context).size.width / 2.25,
              physics:const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                onTap: ()=>jobberData.jobberRemoveWasteFunction(index),
                textTitle: index == 0?"Yes":"No",
                color:jobberData.jobberRemoveWasteValue-1 == index ?Colors.blue.shade50: Colors.grey.shade300,
                border: jobberData.jobberRemoveWasteValue-1 == index ? true : false,
              ),
            ),),
          ),
        ],
      ),
    );
  }
}
