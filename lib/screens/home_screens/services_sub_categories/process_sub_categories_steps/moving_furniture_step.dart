import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class MovingFurnitureStep extends StatelessWidget {
  const MovingFurnitureStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    //     Provider.of<ConstProvider>(context, listen: false);
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
            builder: (_, furnitureData, child) => SizedBox(
              height: 45,
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(left: 15, right: 15),
                itemExtent: MediaQuery.of(context).size.width / 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    OutlineSelectedButton(
                  onTap: () => furnitureData.tvHangFunction(index),
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

                  // height: 40,
                  // width: 45,
                  border: furnitureData.tvHangNo - 1 == index ? true : false,
                      color: furnitureData.tvHangNo - 1 == index ? Colors.blue.shade50 :Colors.grey.shade300,
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
            builder: (_, jobberData, child) => Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: () {
                      jobberData.jobberBringMaterialYesFunction();
                    },
                    textTitle: "Yes",
                    border: jobberData.jobberBringMaterialYes == false
                        ? false
                        : true,
                    color: jobberData.jobberBringMaterialYes == false
                        ? Colors.grey.shade300
                        : Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: jobberData.jobberBringMaterialNoFunction,
                    textTitle: "No",
                    border: jobberData.jobberBringMaterialNo == false
                        ? false
                        : true,
                    color: jobberData.jobberBringMaterialNo == false
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
