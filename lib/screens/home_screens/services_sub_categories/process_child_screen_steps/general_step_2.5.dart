import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/categories_provider/main_categories_provider.dart';
import '../../../../providers/categories_provider/search_categories_provider.dart';
import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class GeneralStep02 extends StatelessWidget {
  final int mainCategoryId;
  final int subCategoryId;
  final int? childCategoryId;
  final int? price;
  const GeneralStep02({
    Key? key,
    required this.mainCategoryId,
    required this.subCategoryId,
    this.childCategoryId,
    this.price,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final mainCategoryData =
        Provider.of<MainCategoriesProvider>(context, listen: false);
    final extractedMainCategory = mainCategoryData.mainCategories;
    final searchData =
    Provider.of<SearchCategoriesProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
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
                    color: hourlyRateData.hourlyRate == 9
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
                    onTap: () {
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
          (searchData.isSearch == true) ? Row(
            children: <Widget>[
              Text(
                "Requested_services",
                style: Theme.of(context).textTheme.bodySmall,
              ).tr(),
              const Spacer(),
              Text(price.toString(),style: Theme.of(context).textTheme.bodySmall,),
            ],
          ) :
          Row(
            children: <Widget>[
              Text(
                "Requested_services",
                style: Theme.of(context).textTheme.bodySmall,
              ).tr(),
              const Spacer(),
              if (subCategoryId < 5) ...[
                if (childCategoryId! < 14) ...[
                  Text(
                    "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 1].childCategories[childCategoryId! - 1].price}€",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ] else if (childCategoryId! > 13 && childCategoryId! < 19) ...[
                  Text(
                    "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 1].childCategories[childCategoryId! - 14].price}€",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ] else if (childCategoryId! > 18 && childCategoryId! < 25) ...[
                  Text(
                    "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 1].childCategories[childCategoryId! - 19].price}€",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ] else if (childCategoryId! > 24 && childCategoryId! <= 31) ...[
                  Text(
                    "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 1].childCategories[childCategoryId! - 25].price}€",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ] else if (subCategoryId > 4 && subCategoryId < 14) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 5].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 13 && subCategoryId < 23) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 14].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 22 && subCategoryId < 29) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 23].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 28 && subCategoryId < 30) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 29].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 29 && subCategoryId < 33) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 30].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 32 && subCategoryId < 37) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 33].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 36 && subCategoryId < 46) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 37].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 45 && subCategoryId < 61) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 46].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 60 && subCategoryId < 69) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 61].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 68 && subCategoryId < 70) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 69].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ] else if (subCategoryId > 69 && subCategoryId < 72) ...[
                Text(
                  "${extractedMainCategory![mainCategoryId - 1].subCategories[subCategoryId - 70].price}€",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
              ],
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
              Consumer<ConstProvider>(
                builder: (_, adminCost, child) => Text(
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
                builder: (_, total, child) => Text(
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
