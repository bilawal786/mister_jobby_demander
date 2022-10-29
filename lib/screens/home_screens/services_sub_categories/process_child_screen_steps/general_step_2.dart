import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/categories_provider/main_categories_provider.dart';
import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class GeneralStep2Screen extends StatelessWidget {
  final int mainCategoryId;
  final int subCategoryId;
  final int? childCategoryId;
  const GeneralStep2Screen({
    Key? key,
    required this.mainCategoryId,
    required this.subCategoryId,
    this.childCategoryId,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCategoryData =
        Provider.of<MainCategoriesProvider>(context, listen: false);
    final extractedMainCategory = mainCategoryData.mainCategories;
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
          // Consumer<ConstProvider>(
          //   builder: (_, selectTime, child) => GestureDetector(
          //     onTap: () {
          //       selectTime.selectTimeProvider(context);
          //     },
          //     child: Container(
          //       padding: const EdgeInsets.only(left: 30, right: 10),
          //       alignment: Alignment.centerLeft,
          //       width: MediaQuery.of(context).size.width,
          //       height: 45,
          //       decoration: BoxDecoration(
          //         color: Colors.white,
          //         border: Border.all(color: Colors.grey.shade300),
          //         boxShadow: [
          //           BoxShadow(
          //             color: Colors.grey.withOpacity(0.2),
          //             spreadRadius: 0.2,
          //             blurRadius: 1,
          //             offset:
          //             const Offset(0.5, 1), // changes position of shadow
          //           ),
          //         ],
          //         borderRadius: BorderRadius.circular(7),
          //       ),
          //       child: Text(
          //         "${selectTime.pickedTime.hour < 10 ? "0${selectTime.pickedTime.hour}" : "${selectTime.pickedTime.hour}"} : ${selectTime.pickedTime.minute < 10 ? "0${selectTime.pickedTime.minute}" : "${selectTime.pickedTime.minute}"}",
          //         style: Theme.of(context).textTheme.labelLarge,
          //       ),
          //     ),
          //   ),
          // ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 30,
          ),
          Text(
            "Service_Duration_Hour",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 30,
          ),
          Consumer<ConstProvider>(
            builder: (_, duration, child) => SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RoundedButton(
                    onTap: () {
                      duration.durationDecrement();
                      duration.calculateBudget();
                      duration.calculateAdminCost();
                      duration.totalBudget();
                      },
                    icon: Icons.remove,
                    color: duration.duration == 0.0
                        ? Colors.blueGrey
                        : Theme.of(context).primaryColor,
                    // color: buttonColorSubTract,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  Text(
                    "${duration.duration}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 20,
                  ),
                  RoundedButton(
                    onTap: () {
                      duration.durationIncrement();
                      duration.calculateBudget();
                      duration.calculateAdminCost();
                      duration.totalBudget();
                    },
                    icon: Icons.add,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
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
            "Service_Hourly_Rate",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 30,
          ),
          Consumer<ConstProvider>(
            builder: (_, hourlyRateData, child) => SizedBox(
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  RoundedButton(
                    onTap: () {
                      hourlyRateData.hourlyRateDecrement();
                      hourlyRateData.calculateBudget();
                      hourlyRateData.calculateAdminCost();
                      hourlyRateData.totalBudget();
                    },
                    icon: Icons.remove,
                    color: hourlyRateData.hourlyRate == 0
                        ? Colors.blueGrey
                        : Theme.of(context).primaryColor,
                    // color: buttonColorSubTract,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 13.5,
                  ),
                  Text(
                    "${hourlyRateData.hourlyRate}",
                    style: Theme.of(context).textTheme.titleMedium,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 13.5,
                  ),
                  RoundedButton(
                    onTap: (){
                      hourlyRateData.hourlyRateIncrement();
                      hourlyRateData.calculateBudget();
                      hourlyRateData.calculateAdminCost();
                      hourlyRateData.totalBudget();
                      },
                    icon: Icons.add,
                    color: Theme.of(context).primaryColor,
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
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
          Row(
            children: <Widget>[
              Text(
                "Requested_services",
                style: Theme.of(context).textTheme.bodySmall,
              ).tr(),
              const Spacer(),
              if (subCategoryId < 5)
                if (childCategoryId! < 14)
                  Text(
                    "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 1].childCategories[childCategoryId! - 1].price}€",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
              if (childCategoryId! > 13 && childCategoryId! < 19)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 1].childCategories[childCategoryId! - 14].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (childCategoryId! > 18 && childCategoryId! < 25)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 1].childCategories[childCategoryId! - 19].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (childCategoryId! > 24 && childCategoryId! <= 31)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 1].childCategories[childCategoryId! - 25].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 4 && subCategoryId < 14)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 5].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 13 && subCategoryId < 23)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 14].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 22 && subCategoryId < 29)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 23].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 28 && subCategoryId < 30)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 29].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 29 && subCategoryId < 33)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 30].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 32 && subCategoryId < 37)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 33].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 36 && subCategoryId < 46)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 37].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 45 && subCategoryId < 61)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 46].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 60 && subCategoryId < 69)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 61].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 68 && subCategoryId < 70)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 69].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              if (subCategoryId > 69 && subCategoryId < 72)
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 70].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 20,
          ),
          Row(
            children: [
              Text(
                'Budget_Estimate_Step2_Title',
                style: Theme.of(context).textTheme.bodyLarge,
              ).tr(),
              const Spacer(),
              Consumer<ConstProvider>(
                builder: (_, budget, child) => Text(
                  '${budget.estimateBudge}€',
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Row(
            children: [
              Text(
                'Administrative_Cost_Step2_Title',
                style: Theme.of(context).textTheme.labelMedium,
              ).tr(),
              const Spacer(),
              Consumer <ConstProvider>(
                builder: (_,adminCost,child)=> Text(
                  '${adminCost.adminCost}€',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Row(
            children: [
              Text(
                'Total_Step2_Title',
                style: Theme.of(context).textTheme.labelMedium,
              ).tr(),
              const Spacer(),
              Consumer<ConstProvider>(
                builder:  (_,total, child)=> Text(
                  '${total.totalCost}€',
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ),
            ],
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
