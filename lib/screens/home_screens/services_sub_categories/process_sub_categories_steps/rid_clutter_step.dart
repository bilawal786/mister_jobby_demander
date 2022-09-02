import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class RidClutterStep extends StatelessWidget {
  const RidClutterStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
        Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Rid_Clutter_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Rid_Clutter_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          // TextFormField(
          //   initialValue: 'Rid_Clutter_Step_Item1_Title'.tr(),
          //   decoration: const InputDecoration(
          //     border: OutlineInputBorder(),
          //     labelText: 'Titre de la demande',
          //     isDense: true,
          //   ),
          //   style: Theme.of(context).textTheme.bodySmall,
          //   enabled: false,
          // ),
          Text(
            "Rid_Clutter_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          TextFormField(
            onChanged: (value) {
              constProviderData.needWork = value;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Rid_Clutter_Step_Item2_Title'.tr(),
              hintText: 'Rid_Clutter_Step_Item2_Title'.tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 5,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 10,
          ),
          Text(
            "Rid_Clutter_Step_Item3_Title".tr(),
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
        ],
      ),
    );
  }
}
