import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_steps_widgets/step_tiles.dart';

class HedgeTrimmingStep extends StatelessWidget {
  const HedgeTrimmingStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
    Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hedge_Trimming_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Hedge_Trimming_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Hedge_Trimming_Step_Item1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 10,
          ),
          Text(
            "Hedge_Trimming_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, smallFurnitureSize, child) => StepTile(
              tileTitle: "Small_Size_Tile_Title",
              tileSubTitle: ""
                  "Hedge_Trimming_Step_Item3_Title",
              inputValue: smallFurnitureSize.smallSizedFurnitureAmount,
              onPressAdd: () =>
                  constProviderData.smallFurnitureAmountIncrement(),
              buttonColorSubTract:
              constProviderData.smallSizedFurnitureAmount == 0
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
                  "Hedge_Trimming_Step_Item4_Title",
              inputValue: mediumFurnitureSize.mediumSizedFurnitureAmount,
              onPressAdd: () =>
                  constProviderData.mediumFurnitureAmountIncrement(),
              buttonColorSubTract:
              constProviderData.mediumSizedFurnitureAmount == 0
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
                  "Hedge_Trimming_Step_Item5_Title",
              inputValue: largeFurnitureSize.largeSizedFurnitureAmount,
              onPressAdd: () =>
                  constProviderData.largeFurnitureAmountIncrement(),
              buttonColorSubTract:
              constProviderData.largeSizedFurnitureAmount == 0
                  ? Colors.blueGrey
                  : Theme.of(context).primaryColor,
              onPressSubTract: () =>
                  largeFurnitureSize.largeFurnitureAmountDecrement(),
            ),
          ),
          const Divider(),
          Consumer<ConstProvider>(
            builder: (_, veryLargeFurnitureSize, child) => StepTile(
              tileTitle: "Very_Big_Size_Tile_Title",
              tileSubTitle: ""
                  "Hedge_Trimming_Step_Item6_Title",
              inputValue: veryLargeFurnitureSize.veryLargeSizedFurnitureAmount,
              onPressAdd: () =>
                  constProviderData.veryLargeFurnitureAmountIncrement(),
              buttonColorSubTract:
              constProviderData.veryLargeSizedFurnitureAmount == 0
                  ? Colors.blueGrey
                  : Theme.of(context).primaryColor,
              onPressSubTract: () =>
                  veryLargeFurnitureSize.veryLargeFurnitureAmountDecrement(),
            ),
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Hedge_Trimming_Step_Item7_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),

          Consumer<ConstProvider>(
            builder: (_,cleanBoxValue,child)=> Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: (){
                      cleanBoxValue.cleanBoxFurnitureYesFunction();
                    },
                    textTitle: "Yes",
                    border: cleanBoxValue.cleanBoxFurnitureYes == false ? false : true,
                    color:cleanBoxValue.cleanBoxFurnitureYes == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: cleanBoxValue.cleanBoxFurnitureNoFunction,
                    textTitle: "No",
                    border: cleanBoxValue.cleanBoxFurnitureNo == false ? false : true,
                    color:cleanBoxValue.cleanBoxFurnitureNo == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 10,
          ),
          Text(
            "Hedge_Trimming_Step_Item8_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_,cleanBoxValue,child)=> Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: (){
                      cleanBoxValue.cleanBoxFurnitureYesFunction();
                    },
                    textTitle: "Yes",
                    border: cleanBoxValue.cleanBoxFurnitureYes == false ? false : true,
                    color:cleanBoxValue.cleanBoxFurnitureYes == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: cleanBoxValue.cleanBoxFurnitureNoFunction,
                    textTitle: "No",
                    border: cleanBoxValue.cleanBoxFurnitureNo == false ? false : true,
                    color:cleanBoxValue.cleanBoxFurnitureNo == false ?Colors.grey.shade300:Colors.blue.shade50,
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
