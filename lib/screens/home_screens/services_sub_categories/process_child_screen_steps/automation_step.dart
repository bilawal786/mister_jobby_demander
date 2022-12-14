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
            "What_You_Need_Title",
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
            builder: (_, cleanBoxValue, child) => SizedBox(height:45,child: ListView.builder(
              itemCount: 2,
              itemExtent: MediaQuery.of(context).size.width / 2.25,
              physics:const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                onTap: ()=>cleanBoxValue.cleanBoxFurnitureFunction(index),
                textTitle: index == 0?"Yes":"No",
                color:cleanBoxValue.cleanBoxFurniture-1 == index ?Colors.blue.shade50: Colors.grey.shade300,
                border: cleanBoxValue.cleanBoxFurniture-1 == index ? true : false,
              ),
            ),),
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
            builder: (_, automationData, child) => SizedBox(height:45,child: ListView.builder(
              itemCount: 5,
              padding:const EdgeInsets.only(left: 15,right: 15),
              itemExtent: MediaQuery.of(context).size.width / 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                onTap: ()=>automationData.automationEquipmentsFunction(index),
                textTitle: index == 0?"One":index==1?"Two":index==2?"Three":index==3?"Four":"Five",
                color: Colors.grey.shade300,
                // height: 40,
                // width: 45,
                border: automationData.automationEquipmentsNo-1 == index ? true : false,
              ),
            ),),
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
            builder: (_, automationData, child) => SizedBox(height:45,child: ListView.builder(
              itemCount: 5,
              padding:const EdgeInsets.only(left: 15,right: 15),
              itemExtent: MediaQuery.of(context).size.width / 5,
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                onTap: ()=>automationData.automationCameraFunction(index),
                textTitle: index == 0?"One":index==1?"Two":index==2?"Three":index==3?"Four":"Five",
                color: Colors.grey.shade300,
                // height: 40,
                // width: 45,
                border: automationData.automationCameraNo-1 == index ? true : false,
              ),
            ),),
          ),
        ],
      ),
    );
  }
}
