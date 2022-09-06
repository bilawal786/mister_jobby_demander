import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../providers/const_provider/const_provider.dart';

class PhotographyStep extends StatelessWidget {
  const PhotographyStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Photography_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Photography_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Photography_Step_Text1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_,photoEditingValue,child)=> Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: (){
                      photoEditingValue.photoEditingYesFunction();
                    },
                    textTitle: "Yes",
                    border: photoEditingValue.photoEditingYes == false ? false : true,
                    color:photoEditingValue.photoEditingYes == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: photoEditingValue.photoEditingNoFunction,
                    textTitle: "No",
                    border: photoEditingValue.photoEditingNo == false ? false : true,
                    color:photoEditingValue.photoEditingNo == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Photography_Step_Text2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_,discountValue,child)=> Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: (){
                      discountValue.discountYesFunction();
                    },
                    textTitle: "Yes",
                    border: discountValue.discountYes == false ? false : true,
                    color:discountValue.discountYes == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: discountValue.discountNoFunction,
                    textTitle: "No",
                    border: discountValue.discountNo == false ? false : true,
                    color:discountValue.discountNo == false ?Colors.grey.shade300:Colors.blue.shade50,
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
