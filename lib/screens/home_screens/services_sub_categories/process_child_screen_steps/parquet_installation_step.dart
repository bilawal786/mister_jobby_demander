import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

import '../../../../providers/const_provider/const_provider.dart';

class ParquetInstallationStep extends StatelessWidget {
  const ParquetInstallationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Parquet_Installation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Parquet_Installation_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Parquet_Installation_Step_Item1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, baseBoardData, child) => SizedBox(
              height: 45,
              child: ListView.builder(
                itemCount: 2,
                itemExtent: MediaQuery.of(context).size.width / 2.25,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    OutlineSelectedButton(
                  onTap: () => baseBoardData.baseBoardInstallFunction(index),
                  textTitle: index == 0 ? "Yes" : "No",
                  color: baseBoardData.baseBoardInstallValue - 1 == index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: baseBoardData.baseBoardInstallValue - 1 == index
                      ? true
                      : false,
                ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 10,
          ),
          Text(
            "Parquet_Installation_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, cuttingMaterialData, child) => SizedBox(
              height: 45,
              child: ListView.builder(
                itemCount: 2,
                itemExtent: MediaQuery.of(context).size.width / 2.25,
                physics: const NeverScrollableScrollPhysics(),
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    OutlineSelectedButton(
                  onTap: () =>
                      cuttingMaterialData.cuttingMaterialFunction(index),
                  textTitle: index == 0 ? "Yes" : "No",
                  color: cuttingMaterialData.cuttingMaterialValue - 1 == index
                      ? Colors.blue.shade50
                      : Colors.grey.shade300,
                  border: cuttingMaterialData.cuttingMaterialValue - 1 == index
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
