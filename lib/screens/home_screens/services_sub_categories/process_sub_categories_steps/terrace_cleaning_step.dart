import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class TerraceCleaningStep extends StatelessWidget {
  const TerraceCleaningStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Terrace_Cleaning_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Terrace_Cleaning_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          TextFormField(
            initialValue: 'Terrace_Cleaning_Step_Item1_Title'.tr(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Titre de la demande',
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            enabled: false,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Terrace_Cleaning_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),

          TextFormField(
            onChanged: (value){},
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Terrace_Cleaning_Step_Item2_Title'.tr(),
              hintText: 'Terrace_Cleaning_Step_Item2_Title'.tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 5,
          ),


          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Weeding_Step_Item3_Title".tr(),
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
                    onTap: () => requestFrequencyData
                        .requestFrequencyFunction(index),
                    textTitle: index == 0
                        ? "Request_Frequency_Button_Title1"
                        : index == 1
                        ? "Request_Frequency_Button_Title2"
                        : index == 2
                        ? "Request_Frequency_Button_Title3"
                        : "Request_Frequency_Button_Title4",
                    color: requestFrequencyData.requestFrequencyTrueValue -
                        1 ==
                        index
                        ? Colors.blue.shade50
                        : Colors.grey.shade300,
                    border: requestFrequencyData.requestFrequencyTrueValue -
                        1 ==
                        index
                        ? true
                        : false,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
