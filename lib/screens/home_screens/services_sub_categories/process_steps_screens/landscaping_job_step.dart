import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class LandscapingJobStep extends StatelessWidget {
  const LandscapingJobStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
    Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Landscaping_Job_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Landscaping_Job_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 20,
          ),

          TextFormField(
            initialValue: 'Landscaping_Job_Step_Title'.tr(),
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Titre de la demande',
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            enabled: false,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 20,
          ),

          Text(
            "Do_You_Want_Service_Provider_Clear_Boxes".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 50,
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
            height: MediaQuery.of(context).size.width / 10,
          ),

          TextFormField(
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Hood_Installation_Step_DescriptionTitle'.tr(),
              hintText: 'Hood_Installation_Step_DescriptionTitle'.tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 5,
          ),

        ],
      ),
    );
  }
}