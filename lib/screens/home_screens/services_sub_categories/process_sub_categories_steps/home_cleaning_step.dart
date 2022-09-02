import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';

class HomeCleaningStep extends StatelessWidget {
  const HomeCleaningStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Home_Cleaning_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Home_Cleaning_Step_SubTitle",
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
                      "Home_Cleaning_Step_Item1_Title".tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      rangeSliderData.surfaceCleanSliderValue == 35
                          ? '<${rangeSliderData.surfaceCleanSliderValue}m²'
                          : rangeSliderData.surfaceCleanSliderValue == 205
                              ? '>${rangeSliderData.surfaceCleanSliderValue}m²'
                              : '${rangeSliderData.surfaceCleanSliderValue}m²',
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
                        rangeValue: rangeSliderData.surfaceCleanSliderValue,
                        minRange: 35,
                        maxRange: 205,
                        division: 17,
                        onChanged: (value) =>
                            rangeSliderData.surfaceCleanSliderFunction(value),
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
            "Home_Cleaning_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, checkBoxData, child) => Row(
              children: [
                Text(
                  "Home_Cleaning_Step_Check1_Title",
                  style: Theme.of(context).textTheme.bodyMedium,
                ).tr(),
                const Spacer(),
                InkWell(
                  onTap: checkBoxData.checkApplianceCleaningFunction,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: checkBoxData.checkApplianceCleaning
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: checkBoxData.checkApplianceCleaning
                        ? const Icon(
                            Icons.check,
                            size: 17,
                            color: Colors.white,
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          Consumer<ConstProvider>(
            builder: (_, checkBoxData, child) => Row(
              children: [
                Text(
                  "Home_Cleaning_Step_Check2_Title",
                  style: Theme.of(context).textTheme.bodyMedium,
                ).tr(),
                const Spacer(),
                InkWell(
                  onTap: checkBoxData.checkWindowCleaningFunction,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: checkBoxData.checkWindowCleaning
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: checkBoxData.checkWindowCleaning
                        ? const Icon(
                            Icons.check,
                            size: 17,
                            color: Colors.white,
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          Consumer<ConstProvider>(
            builder: (_, checkBoxData, child) => Row(
              children: [
                Text(
                  "Home_Cleaning_Step_Check3_Title",
                  style: Theme.of(context).textTheme.bodyMedium,
                ).tr(),
                const Spacer(),
                InkWell(
                  onTap: checkBoxData.checkIroningFunction,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: checkBoxData.checkIroning
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: checkBoxData.checkIroning
                        ? const Icon(
                            Icons.check,
                            size: 17,
                            color: Colors.white,
                          )
                        : const SizedBox(),
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
            "Home_Cleaning_Step_Item3_Title".tr(),
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
