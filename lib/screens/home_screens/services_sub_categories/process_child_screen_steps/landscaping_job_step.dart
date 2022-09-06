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
          Text(
            "Landscaping_Job_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),

          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),

          TextFormField(
            onChanged: (value) {
              constProviderData.needWork = value;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
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
