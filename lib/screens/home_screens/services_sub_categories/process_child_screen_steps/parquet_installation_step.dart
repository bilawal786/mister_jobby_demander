import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

import '../../../../providers/const_provider/const_provider.dart';

class ParquetInstallationStep extends StatelessWidget {
  const ParquetInstallationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
    Provider.of<ConstProvider>(context, listen: false);
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
            builder: (_,baseBoardInstallValue,child)=> Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: (){
                      baseBoardInstallValue.baseBoardInstallYesFunction();
                    },
                    textTitle: "Yes",
                    border: baseBoardInstallValue.baseBoardInstallYes == false ? false : true,
                    color:baseBoardInstallValue.baseBoardInstallYes == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: baseBoardInstallValue.baseBoardInstallNoFunction,
                    textTitle: "No",
                    border: baseBoardInstallValue.baseBoardInstallNo == false ? false : true,
                    color:baseBoardInstallValue.baseBoardInstallNo == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
              ],
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
            builder: (_,cuttingMaterialValue,child)=> Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: (){
                      cuttingMaterialValue.cuttingMaterialYesFunction();
                    },
                    textTitle: "Yes",
                    border: cuttingMaterialValue.cuttingMaterialYes == false ? false : true,
                    color:cuttingMaterialValue.cuttingMaterialYes == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: cuttingMaterialValue.cuttingMaterialNoFunction,
                    textTitle: "No",
                    border: cuttingMaterialValue.cuttingMaterialNo == false ? false : true,
                    color:cuttingMaterialValue.cuttingMaterialNo == false ?Colors.grey.shade300:Colors.blue.shade50,
                  ),
                ),
              ],
            ),
          ),

        ],
      ),
    );
  }
}
