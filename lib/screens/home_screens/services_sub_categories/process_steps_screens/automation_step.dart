import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class AutomationStep extends StatelessWidget {
  const AutomationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Automation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Automation_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Do_You_Want_Service_Provider_Clear_Boxes".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_,cleanBoxValue,child)=> Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: (){
                      cleanBoxValue.cleanBoxFurnitureYesFunction();
                    },
                    textTitle: "Yes",
                    border: cleanBoxValue.cleanBoxFurnitureYes == false ? false : true,
                    color:cleanBoxValue.cleanBoxFurnitureYes == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: cleanBoxValue.cleanBoxFurnitureNoFunction,
                    textTitle: "No",
                    border: cleanBoxValue.cleanBoxFurnitureNo == false ? false : true,
                    color:cleanBoxValue.cleanBoxFurnitureNo == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          Text(
            "Automation_Step_Equipment_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, automationStep, child) => Row(
              children: <Widget>[
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationStep.equipments1,
                    textTitle: "One",
                    color: Colors.grey.shade300,
                    border: automationStep.equipmentsNo1 == 1 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationStep.equipments2,
                    textTitle: "Two",
                    color: Colors.grey.shade300,
                    border: automationStep.equipmentsNo2 == 2 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationStep.equipments3,
                    textTitle: "Three",
                    color: Colors.grey.shade300,
                    border: automationStep.equipmentsNo3 == 3 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationStep.equipments4,
                    textTitle: "Four",
                    color: Colors.grey.shade300,
                    border: automationStep.equipmentsNo4 == 4 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationStep.equipments5,
                    textTitle: "Five",
                    color: Colors.grey.shade300,
                    border: automationStep.equipmentsNo5 == 5 ? true : false,
                  ),
                ),
              ],
            ),
          ),

          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          Text(
            "Automation_Step_Camera_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, automationCamera, child) => Row(
              children: <Widget>[
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationCamera.automationCamera1,
                    textTitle: "One",
                    color: Colors.grey.shade300,
                    border: automationCamera.automationCameraNo1 == 1 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationCamera.automationCamera2,
                    textTitle: "Two",
                    color: Colors.grey.shade300,
                    border: automationCamera.automationCameraNo2 == 2 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationCamera.automationCamera3,
                    textTitle: "Three",
                    color: Colors.grey.shade300,
                    border: automationCamera.automationCameraNo3 == 3 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationCamera.automationCamera4,
                    textTitle: "Four",
                    color: Colors.grey.shade300,
                    border: automationCamera.automationCameraNo4 == 4 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: automationCamera.automationCamera5,
                    textTitle: "Five",
                    color: Colors.grey.shade300,
                    border: automationCamera.automationCameraNo5 == 5 ? true : false,
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
