import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_steps_widgets/step_tiles.dart';
import '../../../../providers/const_provider/const_provider.dart';

class DisassembleFurnitureStep extends StatelessWidget {
  const DisassembleFurnitureStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Disassemble_Furniture_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "What_You_Need_Title",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Select_Number_Furniture_Assemble_Step_SubTitle".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          Consumer<ConstProvider>(
            builder: (_, smallFurnitureSize, child) => StepTile(
              tileTitle: "Small_Size_Tile_Title",
              tileSubTitle: ""
                  "Small_Size_Tile_SubTitle",
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
                  "Medium_Size_Tile_SubTitle",
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
                  "Big_Size_Tile_SubTitle",
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
          Consumer<ConstProvider>(
            builder: (_, veryLargeFurnitureSize, child) => StepTile(
              tileTitle: "Very_Big_Size_Tile_Title",
              tileSubTitle: ""
                  "Very_Big_Size_Tile_SubTitle",
              inputValue: veryLargeFurnitureSize.veryLargeSizedFurnitureAmount,
              onPressAdd: () =>
                  veryLargeFurnitureSize.veryLargeFurnitureAmountIncrement(),
              buttonColorSubTract:
              veryLargeFurnitureSize.veryLargeSizedFurnitureAmount == 0
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
            "Do_You_Want_Service_Provider_Clear_Boxes".tr(),
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
