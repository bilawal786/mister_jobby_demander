import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/group_radio_tile.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';

class FlyersDistributionStep extends StatelessWidget {
  const FlyersDistributionStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Flyers_Distribution_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Information_about_Need_Step2_SubTitle",
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
                      "Flyers_Distribution_Step_Text1_Title".tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      '${rangeSliderData.numberOfFlyersSliderValue.toStringAsFixed(0)}m²',
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
                        rangeValue: rangeSliderData.numberOfFlyersSliderValue,
                        minRange: 100,
                        maxRange: 5000,
                        division:4900,
                        onChanged: (value) =>
                            rangeSliderData.numberOfFlyersSliderFunction(value),
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
            "Flyers_Distribution_Step_Text2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_,cleanComputer, child) =>
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    GroupRadioTile(
                      title: "Flyers_Distribution_Step_Radio1_Title",
                      value: 1,
                      groupValue: cleanComputer.groupValue,
                      onClick: cleanComputer.checkGroupValue,
                    ),
                    GroupRadioTile(
                      title: "Flyers_Distribution_Step_Radio2_Title",
                      value: 2,
                      groupValue: cleanComputer.groupValue,
                      onClick: cleanComputer.checkGroupValue,
                    ),
                    GroupRadioTile(
                      title: "Flyers_Distribution_Step_Radio3_Title",
                      value: 3,
                      groupValue: cleanComputer.groupValue,
                      onClick: cleanComputer.checkGroupValue,
                    ),
                  ],
                ),
          ),
        ],
      ),
    );
  }
}
