import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class DeliverGroceriesStep extends StatelessWidget {
  const DeliverGroceriesStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Deliver_Groceries_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Computer_Job_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Rid_Clutter_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          TextFormField(
            onChanged: (value) {},
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
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Window_Cleaning_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, requestFrequencyData, child) => SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemExtent: MediaQuery.of(context).size.width / 1.9,
                itemBuilder: (context, index) => OutlineSelectedButton(
                  onTap: () =>
                      requestFrequencyData.requestFrequencyFunction(index),
                  textTitle: index == 0
                      ? "Window_Cleaning_Step_Buuton7_Title"
                      : index == 1
                          ? "Window_Cleaning_Step_Buuton8_Title"
                          : index == 2
                              ? "Window_Cleaning_Step_Buuton9_Title"
                              : "Window_Cleaning_Step_Buuton10_Title",
                  color: requestFrequencyData.requestFrequencyTrueValue - 1 ==
                          index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: requestFrequencyData.requestFrequencyTrueValue - 1 ==
                          index
                      ? true
                      : false,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
