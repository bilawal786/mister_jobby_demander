import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class MovingFurnitureStep extends StatelessWidget {
  const MovingFurnitureStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
        Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Moving_Furniture_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Moving_Furniture_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Moving_Furniture_Step_Item1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, tvData, child) => SizedBox(
              height: 45,
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(left: 15, right: 15),
                itemExtent: 65,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    OutlineSelectedButton(
                  onTap: () => tvData.tvHangFunction(index),
                  textTitle: index == 0
                      ? "One"
                      : index == 1
                          ? "Two"
                          : index == 2
                              ? "Three"
                              : index == 3
                                  ? "Four"
                      : index == 4
                      ? "Five"
                      : index == 5
                      ? "Six"
                      : index == 6
                      ? "Seven"
                      : index == 7
                      ? "Eight"
                      : index == 8
                      ? "Nine"
                      : "Ten",
                  color: Colors.grey.shade300,
                  // height: 40,
                  // width: 45,
                  border: tvData.tvHangNo - 1 == index ? true : false,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Moving_Furniture_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, cuttingMaterialValue, child) => Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: () {
                      cuttingMaterialValue.cuttingMaterialYesFunction();
                    },
                    textTitle: "Yes",
                    border: cuttingMaterialValue.cuttingMaterialYes == false
                        ? false
                        : true,
                    color: cuttingMaterialValue.cuttingMaterialYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: cuttingMaterialValue.cuttingMaterialNoFunction,
                    textTitle: "No",
                    border: cuttingMaterialValue.cuttingMaterialNo == false
                        ? false
                        : true,
                    color: cuttingMaterialValue.cuttingMaterialNo == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
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
