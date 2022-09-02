import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';

class LiningInstallationStep extends StatelessWidget {
  const LiningInstallationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Lining_Installation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Lining_Installation_Step_SubTitle",
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
                      "Lining_Installation_Step_Item1_Title".tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      '${rangeSliderData.liningInstallationSliderValue}m²',
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
                        rangeValue: rangeSliderData.liningInstallationSliderValue,
                        minRange: 3,
                        maxRange: 30,
                        division: 9,
                        onChanged: (value) => rangeSliderData
                            .liningInstallationSliderFunction(value),
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
            height: MediaQuery.of(context).size.width / 20,
          ),
          Text(
            "Lining_Installation_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_,cuttingMaterialValue,child)=> Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: (){
                      cuttingMaterialValue.cuttingMaterialYesFunction();
                    },
                    textTitle: "Yes",
                    border: cuttingMaterialValue.cuttingMaterialYes == false ? false : true,
                    color:cuttingMaterialValue.cuttingMaterialYes == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: cuttingMaterialValue.cuttingMaterialNoFunction,
                    textTitle: "No",
                    border: cuttingMaterialValue.cuttingMaterialNo == false ? false : true,
                    color:cuttingMaterialValue.cuttingMaterialNo == false ?Colors.grey.shade300:Colors.blue.shade50,
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
