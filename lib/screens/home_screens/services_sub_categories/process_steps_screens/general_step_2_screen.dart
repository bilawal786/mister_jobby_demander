import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';



class GeneralStep2Screen extends StatelessWidget {
  const GeneralStep2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Text(
              "Information_about_Need_Step2_SubTitle",
              style: Theme.of(context).textTheme.titleMedium,
            ).tr(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Text(
              "Service_Date",
              style: Theme.of(context).textTheme.titleSmall,
            ).tr(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Consumer<ConstProvider>(
              builder: (_, selectDate, child) => GestureDetector(
                onTap: () {
                  selectDate.selectDateProvider(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.2,
                        blurRadius: 1,
                        offset: const Offset(
                            0.5, 1), // changes position of shadow
                      ),
                    ],
                    border: Border.all(color: Colors.grey.shade300),
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    "${selectDate.selectedDate.day < 10 ? "0${selectDate.selectedDate.day}" : "${selectDate.selectedDate.day}"}-${selectDate.selectedDate.month < 10 ? "0${selectDate.selectedDate.month}" : "${selectDate.selectedDate.month}"}-${selectDate.selectedDate.year}",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Text(
              "Service_Time_Start",
              style: Theme.of(context).textTheme.titleSmall,
            ).tr(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Consumer<ConstProvider>(
              builder: (_, selectTime, child) => GestureDetector(
                onTap: () {
                  selectTime.selectTimeProvider(context);
                },
                child: Container(
                  padding: const EdgeInsets.only(left: 30, right: 10),
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  height: 45,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey.shade300),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 0.2,
                        blurRadius: 1,
                        offset: const Offset(
                            0.5, 1), // changes position of shadow
                      ),
                    ],
                    borderRadius: BorderRadius.circular(7),
                  ),
                  child: Text(
                    "${selectTime.pickedTime.hour < 10 ? "0${selectTime.pickedTime.hour}" : "${selectTime.pickedTime.hour}"} : ${selectTime.pickedTime.minute < 10 ? "0${selectTime.pickedTime.minute}" : "${selectTime.pickedTime.minute}"}",
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Text(
              "Service_Duration_Hour",
              style: Theme.of(context).textTheme.titleSmall,
            ).tr(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Consumer<ConstProvider>(
              builder: (_, duration, child) => SizedBox(
                width: MediaQuery.of(context).size.width / 2.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundedButton(
                      onTap: duration.durationDecrement,
                      icon: Icons.remove,
                      color: duration.duration == 0.0
                          ? Colors.blueGrey
                          : Theme.of(context).primaryColor,
                      // color: buttonColorSubTract,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "${duration.duration}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    RoundedButton(
                      onTap: duration.durationIncrement,
                      icon: Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Text(
              "Service_Hourly_Rate",
              style: Theme.of(context).textTheme.titleSmall,
            ).tr(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Consumer<ConstProvider>(
              builder: (_, hourlyRateData, child) => SizedBox(
                width: MediaQuery.of(context).size.width / 2.8,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    RoundedButton(
                      onTap: hourlyRateData.hourlyRateDecrement,
                      icon: Icons.remove,
                      color: hourlyRateData.hourlyRate == 0
                          ? Colors.blueGrey
                          : Theme.of(context).primaryColor,
                      // color: buttonColorSubTract,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "${hourlyRateData.hourlyRate}",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    RoundedButton(
                      onTap: hourlyRateData.hourlyRateIncrement,
                      icon: Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),
                  ],
                ),
              ),
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Consumer<ConstProvider>(
              builder: (_,checkBoxData,child)=>
                  Row(
                    children: [
                      Text(
                        "Service_do_you_need_urgent_job",
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
                            color: checkBoxData.checkUrgentJob ? Theme.of(context).primaryColor : Colors.white,
                            border: Border.all(width: 2, color: Theme.of(context).primaryColor ),
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
            const Divider(),
          ],
        ),
      ),
    );
  }
}
