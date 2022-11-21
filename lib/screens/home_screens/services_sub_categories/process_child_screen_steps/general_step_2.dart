import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class GeneralStep2Screen extends StatelessWidget {
  final int? mainCategoryId;
  final int? subCategoryId;
  final int? childCategoryId;
  const GeneralStep2Screen({
    Key? key,
    this.mainCategoryId,
    this.subCategoryId,
    this.childCategoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 80,
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
                      offset:
                          const Offset(0.5, 1), // changes position of shadow
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
            height: MediaQuery.of(context).size.width / 30,
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
                selectTime.statusPicker(context);
              },
              child: Container(
                padding: const EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                  color: Colors.grey.shade300,
                  borderRadius: BorderRadius.circular(7.0),
                ),
                child: Row(
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(left: 22,),
                      child: Text(
                        selectTime.statusName,
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_drop_down_rounded,
                      size: 30,
                      color: Colors.black,
                    ),
                  ],
                ),
              ),
            ),
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 30,
          ),
          Consumer<ConstProvider>(
            builder: (_, checkBoxData, child) => Row(
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
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Service_How_Many_Provider_Do_You_Need",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 30,
          ),
          Consumer<ConstProvider>(
            builder: (_, providerCountData, child) => Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                RoundedButton(
                  onTap: providerCountData.providerAmountDecrement,
                  icon: Icons.remove,
                  color: providerCountData.providersAmount == 1
                      ? Colors.blueGrey
                      : Theme.of(context).primaryColor,
                  // color: buttonColorSubTract,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 13.5,
                ),
                Text(
                  "${providerCountData.providersAmount}",
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 13.5,
                ),
                RoundedButton(
                  onTap: providerCountData.providerAmountIncrement,
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
        ],
      ),
    );
  }
}
