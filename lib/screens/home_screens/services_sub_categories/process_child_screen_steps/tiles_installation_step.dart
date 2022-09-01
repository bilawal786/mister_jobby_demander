import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';

class TilesInstallationStep extends StatelessWidget {
  const TilesInstallationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    //     Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Tiles_Installation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Tiles_Installation_Step_SubTitle",
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
                      "Tiles_Installation_Step_Item1_Title".tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      '${rangeSliderData.tileInstallationSliderValue}m²',
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
                        rangeValue: rangeSliderData.tileInstallationSliderValue,
                        minRange: 10,
                        maxRange: 100,
                        division: 9,
                        onChanged: (value) => rangeSliderData
                            .tileInstallationSliderFunction(value),
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
        ],
      ),
    );
  }
}
