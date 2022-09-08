import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_steps_widgets/step_tiles.dart';

class CutTreeStep extends StatelessWidget {
  const CutTreeStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Cut_Tree_Step_Title",
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
                      "Cut_Tree_Step_Item1_Title".tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      '${rangeSliderData.numberOfTreesSliderValue}',
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
                        rangeValue:
                            rangeSliderData.numberOfTreesSliderValue,
                        minRange: 1,
                        maxRange: 30,
                        division: 29,
                        onChanged: (value) => rangeSliderData
                            .numberOfTreesSliderFunction(value),
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
          Consumer<ConstProvider>(
            builder: (_, smallFurnitureSize, child) => StepTile(
              tileTitle: "Small_Size_Tile_Title",
              tileSubTitle: ""
                  "",
              inputValue: smallFurnitureSize.smallSizedFurnitureAmount,
              onPressAdd: () =>
                  smallFurnitureSize.smallFurnitureAmountIncrement(),
              buttonColorSubTract:
              smallFurnitureSize.smallSizedFurnitureAmount == 0
                      ? Colors.blueGrey
                      : Theme.of(context).primaryColor,
              onPressSubTract: () =>
                  smallFurnitureSize.smallFurnitureAmountDecrement(),
            ),
          ),
          const Divider(),
          Consumer<ConstProvider>(
            builder: (_, mediumFurnitureSize, child) => StepTile(
              tileTitle: "Medium_Size_Tile_Title",
              tileSubTitle: ""
                  "",
              inputValue: mediumFurnitureSize.mediumSizedFurnitureAmount,
              onPressAdd: () =>
                  mediumFurnitureSize.mediumFurnitureAmountIncrement(),
              buttonColorSubTract:
              mediumFurnitureSize.mediumSizedFurnitureAmount == 0
                      ? Colors.blueGrey
                      : Theme.of(context).primaryColor,
              onPressSubTract: () =>
                  mediumFurnitureSize.mediumFurnitureAmountDecrement(),
            ),
          ),
          const Divider(),
          Consumer<ConstProvider>(
            builder: (_, largeFurnitureSize, child) => StepTile(
              tileTitle: "Big_Size_Tile_Title",
              tileSubTitle: ""
                  "",
              inputValue: largeFurnitureSize.largeSizedFurnitureAmount,
              onPressAdd: () =>
                  largeFurnitureSize.largeFurnitureAmountIncrement(),
              buttonColorSubTract:
              largeFurnitureSize.largeSizedFurnitureAmount == 0
                      ? Colors.blueGrey
                      : Theme.of(context).primaryColor,
              onPressSubTract: () =>
                  largeFurnitureSize.largeFurnitureAmountDecrement(),
            ),
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Cut_Tree_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, jobberData, child) => SizedBox(height:45,child: ListView.builder(
              itemCount: 2,
              itemExtent: MediaQuery.of(context).size.width / 2.25,
              physics:const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                onTap: ()=>jobberData.jobberBringMaterialFunction(index),
                textTitle: index == 0?"Yes":"No",
                color:jobberData.jobberBringMaterialValue-1 == index ?Colors.blue.shade50: Colors.grey.shade300,
                border: jobberData.jobberBringMaterialValue-1 == index ? true : false,
              ),
            ),),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Cut_Tree_Step_Item3_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, jobberData, child) => SizedBox(height:45,child: ListView.builder(
              itemCount: 2,
              itemExtent: MediaQuery.of(context).size.width / 2.25,
              physics:const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                onTap: ()=>jobberData.jobberRemoveWasteFunction(index),
                textTitle: index == 0?"Yes":"No",
                color:jobberData.jobberRemoveWasteValue-1 == index ?Colors.blue.shade50: Colors.grey.shade300,
                border: jobberData.jobberRemoveWasteValue-1 == index ? true : false,
              ),
            ),),
          ),
        ],
      ),
    );
  }
}
