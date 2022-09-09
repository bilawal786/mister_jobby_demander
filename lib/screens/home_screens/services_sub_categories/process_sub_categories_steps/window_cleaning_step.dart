import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class WindowCleaningStep extends StatelessWidget {
  const WindowCleaningStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Window_Cleaning_Step_Title",
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
            "Window_Cleaning_Step_Item1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, windowsData, child) => SizedBox(
              height: 50,
              child: ListView.builder(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                itemCount: 6,
                itemExtent: MediaQuery.of(context).size.width / 1.9,
                itemBuilder: (context, index) => OutlineSelectedButton(
                  onTap: () => windowsData.windowCleaningFunction(index),
                  textTitle: index == 0
                      ? "Window_Cleaning_Step_Button1_Title"
                      : index == 1
                          ? "Window_Cleaning_Step_Button2_Title"
                          : index == 2
                              ? "Window_Cleaning_Step_Button3_Title"
                              : index == 3
                                  ? "Window_Cleaning_Step_Button4_Title"
                                  : index == 4
                                      ? "Window_Cleaning_Step_Button5_Title"
                                      : "Window_Cleaning_Step_Button6_Title",
                  color: windowsData.windowCleaningTrueValue - 1 == index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: windowsData.windowCleaningTrueValue - 1 == index
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
                      requestFrequencyData.frequencyFunction(index),
                  textTitle: index == 0
                      ? "Request_Frequency_Button_Title1"
                      : index == 1
                          ? "Request_Frequency_Button_Title2"
                          : index == 2
                              ? "Request_Frequency_Button_Title3"
                              : "Request_Frequency_Button_Title4",
                  color: requestFrequencyData.frequencyTrueValue - 1 ==
                          index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: requestFrequencyData.frequencyTrueValue - 1 ==
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
