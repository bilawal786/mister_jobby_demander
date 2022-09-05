import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class BartenderStep extends StatelessWidget {
  const BartenderStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Bartender_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Bartender_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Bartender_Step_Text1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, floorsArrivalData, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  onTap: floorsArrivalData.fixesAmountDecrement,
                  height: 50,
                  icon: Icons.remove,
                  color: floorsArrivalData.fixesAmount < 1
                      ? Colors.blueGrey.shade300
                      : Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                Text(
                  '${floorsArrivalData.fixesAmount}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                RoundedButton(
                  onTap: floorsArrivalData.fixesAmountIncrement,
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
            "Bartender_Step_Button1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, cleanBoxValue, child) => Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: () {
                      cleanBoxValue.cleanBoxFurnitureYesFunction();
                    },
                    textTitle: "Yes",
                    border: cleanBoxValue.cleanBoxFurnitureYes == false
                        ? false
                        : true,
                    color: cleanBoxValue.cleanBoxFurnitureYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: cleanBoxValue.cleanBoxFurnitureNoFunction,
                    textTitle: "No",
                    border: cleanBoxValue.cleanBoxFurnitureNo == false
                        ? false
                        : true,
                    color: cleanBoxValue.cleanBoxFurnitureNo == false
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
            "Bartender_Step_Button2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, cleanBoxValue, child) => Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: () {
                      cleanBoxValue.cleanBoxFurnitureYesFunction();
                    },
                    textTitle: "Yes",
                    border: cleanBoxValue.cleanBoxFurnitureYes == false
                        ? false
                        : true,
                    color: cleanBoxValue.cleanBoxFurnitureYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: cleanBoxValue.cleanBoxFurnitureNoFunction,
                    textTitle: "No",
                    border: cleanBoxValue.cleanBoxFurnitureNo == false
                        ? false
                        : true,
                    color: cleanBoxValue.cleanBoxFurnitureNo == false
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
            "Bartender_Step_Button3_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, cleanBoxValue, child) => Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: () {
                      cleanBoxValue.cleanBoxFurnitureYesFunction();
                    },
                    textTitle: "Yes",
                    border: cleanBoxValue.cleanBoxFurnitureYes == false
                        ? false
                        : true,
                    color: cleanBoxValue.cleanBoxFurnitureYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: cleanBoxValue.cleanBoxFurnitureNoFunction,
                    textTitle: "No",
                    border: cleanBoxValue.cleanBoxFurnitureNo == false
                        ? false
                        : true,
                    color: cleanBoxValue.cleanBoxFurnitureNo == false
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
