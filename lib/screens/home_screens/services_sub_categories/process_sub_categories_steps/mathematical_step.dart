import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class MathematicalStep extends StatelessWidget {
  const MathematicalStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Mathematical_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "French_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "French_Step_Item1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, requestFrequencyData, child) => SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemExtent: MediaQuery.of(context).size.width / 1.9,
                itemBuilder: (context, index) => OutlineSelectedButton(
                  onTap: () =>
                      requestFrequencyData.requestFrequencyFunction(index),
                  textTitle: index == 0
                      ? "French_Step_Button1_Title"
                      : index == 1
                          ? "French_Step_Button2_Title"
                          : index == 2
                              ? "French_Step_Button3_Title"
                              : "French_Step_Button4_Title",
                  color: requestFrequencyData.requestFrequencyTrueValue - 1 ==
                          index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: requestFrequencyData.requestFrequencyTrueValue - 1 ==
                          index
                      ? true
                      : false,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "French_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, requestFrequencyData, child) => SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemExtent: MediaQuery.of(context).size.width / 1.9,
                itemBuilder: (context, index) => OutlineSelectedButton(
                  onTap: () =>
                      requestFrequencyData.requestFrequencyFunction(index),
                  textTitle: index == 0
                      ? "French_Step_Button5_Title"
                      : "French_Step_Button6_Title",
                  color: requestFrequencyData.requestFrequencyTrueValue - 1 ==
                          index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: requestFrequencyData.requestFrequencyTrueValue - 1 ==
                          index
                      ? true
                      : false,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Window_Cleaning_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, requestFrequencyData, child) => SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 4,
                itemExtent: MediaQuery.of(context).size.width / 1.9,
                itemBuilder: (context, index) => OutlineSelectedButton(
                  onTap: () =>
                      requestFrequencyData.requestFrequencyFunction(index),
                  textTitle: index == 0
                      ? "Window_Cleaning_Step_Buuton7_Title"
                      : index == 1
                          ? "Window_Cleaning_Step_Buuton8_Title"
                          : index == 2
                              ? "Window_Cleaning_Step_Buuton9_Title"
                              : "Window_Cleaning_Step_Buuton10_Title",
                  color: requestFrequencyData.requestFrequencyTrueValue - 1 ==
                          index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: requestFrequencyData.requestFrequencyTrueValue - 1 ==
                          index
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
