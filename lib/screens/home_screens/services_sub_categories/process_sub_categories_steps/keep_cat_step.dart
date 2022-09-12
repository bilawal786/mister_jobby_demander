import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class KeepCatStep extends StatelessWidget {
  const KeepCatStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Keep_Cat_Step_Title",
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
            "Dog_Sitting_Step_Item1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, animalSitterData, child) => SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 3,
                itemExtent: MediaQuery.of(context).size.width / 1.9,
                itemBuilder: (context, index) => OutlineSelectedButton(
                  onTap: () => animalSitterData.animalThingsFunction(index),
                  textTitle: index == 0
                      ? "Dog_Sitting_Step_Item1_Button1_Title"
                      : index == 1
                      ? "Dog_Sitting_Step_Item1_Button2_Title"
                      : "Dog_Sitting_Step_Item1_Button3_Title",
                  color: animalSitterData.animalGuardTrueValue - 1 == index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border:
                  animalSitterData.animalGuardTrueValue - 1 == index
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
