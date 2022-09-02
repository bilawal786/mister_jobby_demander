import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';

class PoolWashingStep extends StatelessWidget {
  const PoolWashingStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Pool_Washing_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Pool_Washing_Step_SubTitle",
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
                      "Pool_Washing_Step_Item1_Title".tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      '${rangeSliderData.surfaceInstallationSliderValue}m²',
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
                        rangeValue: rangeSliderData.surfaceInstallationSliderValue,
                        minRange: 10,
                        maxRange: 50,
                        division: 40,
                        onChanged: (value) =>
                            rangeSliderData.surfaceInstallationSliderFunction(value),
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
            "Pool_Washing_Step_Item2_Title".tr(),
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
                      ? "Pool_Washing_Step_Button1_Title"
                      : index == 1
                          ? "Pool_Washing_Step_Button2_Title"
                          : index == 2
                              ? "Pool_Washing_Step_Button3_Title"
                              : "Pool_Washing_Step_Button4_Title",
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
