import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class ComputerCoursesStep extends StatelessWidget {
  const ComputerCoursesStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // final constProviderData =
    // Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Computer_Courses_Step_Title",
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
            "Computer_Courses_Step_Item1_Title".tr(),
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
                itemCount: 8,
                itemExtent: MediaQuery.of(context).size.width / 1.9,
                itemBuilder: (context, index) => OutlineSelectedButton(
                  onTap: () =>
                      requestFrequencyData.courseHourFunction(index),
                  textTitle: index == 0
                      ? "Computer_Courses_Step_Button1_Title"
                      : index == 1
                          ? "Computer_Courses_Step_Button2_Title"
                          : index == 2
                              ? "Computer_Courses_Step_Button3_Title"
                              : index == 3
                                  ? "Computer_Courses_Step_Button4_Title"
                                  : index == 4
                                      ? "Computer_Courses_Step_Button5_Title"
                                      : index == 5
                                          ? "Computer_Courses_Step_Button6_Title"
                                          : index == 6
                                              ? "Computer_Courses_Step_Button7_Title"
                                              : "Computer_Courses_Step_Button8_Title",
                  color: requestFrequencyData.courseHourTrueValue - 1 ==
                          index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: requestFrequencyData.courseHourTrueValue - 1 ==
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
