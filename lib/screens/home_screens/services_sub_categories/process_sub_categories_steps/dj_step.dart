import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../providers/const_provider/const_provider.dart';

class DJStep extends StatelessWidget {
  const DJStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Dj_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Dj_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Dj_Step_Text1_Title".tr(),
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
            "Dj_Step_Text2_Title".tr(),
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
                      jobberData.jobberOwnMoverYesFunction();
                    },
                    textTitle: "Yes",
                    border: jobberData.jobberOwnMoverYes == false
                        ? false
                        : true,
                    color: jobberData.jobberOwnMoverYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: jobberData.jobberOwnMoverNoFunction,
                    textTitle: "No",
                    border: jobberData.jobberOwnMoverNo == false
                        ? false
                        : true,
                    color: jobberData.jobberOwnMoverNo == false
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
