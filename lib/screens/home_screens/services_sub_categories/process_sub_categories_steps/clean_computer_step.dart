import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_steps_widgets/step_tiles.dart';

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
                  smallFurnitureSize.smallFurnitureAmountIncrement(),
              buttonColorSubTract:
              smallFurnitureSize.smallSizedFurnitureAmount == 0
                  ? Colors.blueGrey
                  : Theme.of(context).primaryColor,
              onPressSubTract: () =>
                  smallFurnitureSize.smallFurnitureAmountDecrement(),
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
                  onTap: checkBoxData.checkUrgentJobFunction,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: checkBoxData.checkUrgentJob
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: checkBoxData.checkUrgentJob
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
                  onTap: checkBoxData.checkUrgentJobFunction,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: checkBoxData.checkUrgentJob
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: checkBoxData.checkUrgentJob
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
        ],
      ),
    );
  }
}
