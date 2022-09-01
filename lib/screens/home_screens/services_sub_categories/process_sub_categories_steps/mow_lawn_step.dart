import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';

class MowLawnStep extends StatelessWidget {
  const MowLawnStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Mow_Lawn_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Mow_Lawn_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, rangeSliderData, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Mow_Lawn_Step_Item1_Title".tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      '${rangeSliderData.areaToMowSliderValue}m²',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.cast_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 25,
                    ),
                    Expanded(
                      child: RangeSliderCLass(
                        rangeValue: rangeSliderData.areaToMowSliderValue,
                        minRange: 250,
                        maxRange: 5000,
                        division: 19,
                        onChanged: (value) =>
                            rangeSliderData.areaToMowSliderFunction(value),
                      ),
                    ),
                    Icon(
                      Icons.cast_connected,
                      color: Theme.of(context).primaryColor,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Mow_Lawn_Step_Item2_Title".tr(),
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
                    border:
                        jobberData.jobberOwnMoverYes == false ? false : true,
                    color: jobberData.jobberOwnMoverYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: jobberData.jobberOwnMoverNoFunction,
                    textTitle: "No",
                    border: jobberData.jobberOwnMoverNo == false ? false : true,
                    color: jobberData.jobberOwnMoverNo == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Mow_Lawn_Step_Item3_Title".tr(),
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
                      jobberData.jobberRemoveWasteYesFunction();
                    },
                    textTitle: "Yes",
                    border:
                        jobberData.jobberRemoveWasteYes == false ? false : true,
                    color: jobberData.jobberRemoveWasteYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: jobberData.jobberRemoveWasteNoFunction,
                    textTitle: "No",
                    border:
                        jobberData.jobberRemoveWasteNo == false ? false : true,
                    color: jobberData.jobberRemoveWasteNo == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Mow_Lawn_Step_Item4_Title".tr(),
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
