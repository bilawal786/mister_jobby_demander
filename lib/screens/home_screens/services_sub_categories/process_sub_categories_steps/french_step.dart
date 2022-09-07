import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class FrenchStep extends StatelessWidget {
  const FrenchStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                      requestFrequencyData.educationLevelFunction(index),
                  textTitle: index == 0
                      ? "French_Step_Button1_Title"
                      : index == 1
                      ? "French_Step_Button2_Title"
                      : index == 2
                      ? "French_Step_Button3_Title"
                      : "French_Step_Button4_Title",
                  color: requestFrequencyData.educationLevelTrueValue - 1 ==
                      index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: requestFrequencyData.educationLevelTrueValue - 1 ==
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
            builder: (_, courseFormatData, child) => SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 2,
                itemExtent: MediaQuery.of(context).size.width / 1.9,
                itemBuilder: (context, index) => OutlineSelectedButton(
                  onTap: () {
                      courseFormatData.courseFormatFunction(index);},
                  textTitle: index == 0
                      ? "French_Step_Button5_Title"
                      : "French_Step_Button6_Title",
                  color: courseFormatData.courseFormatTrueValue - 1 ==
                      index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: courseFormatData.courseFormatTrueValue - 1 ==
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
                    onTap: () => requestFrequencyData
                        .frequencyFunction(index),
                    textTitle: index == 0
                        ? "Request_Frequency_Button_Title1"
                        : index == 1
                        ? "Request_Frequency_Button_Title2"
                        : index == 2
                        ? "Request_Frequency_Button_Title3"
                        : "Request_Frequency_Button_Title4",
                    color: requestFrequencyData.frequencyTrueValue -
                        1 ==
                        index
                        ? Colors.blue.shade50
                        : Colors.grey.shade300,
                    border: requestFrequencyData.frequencyTrueValue -
                        1 ==
                        index
                        ? true
                        : false,
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
