import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';

class FurnitureRepairStep extends StatefulWidget {
  const FurnitureRepairStep({Key? key}) : super(key: key);

  @override
  State<FurnitureRepairStep> createState() => _FurnitureRepairStepState();
}

class _FurnitureRepairStepState extends State<FurnitureRepairStep> {
  TextEditingController needWorkController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final constProviderData = Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Furniture_Repair_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Furniture_Repair_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 20,
          ),
          TextFormField(
            controller: needWorkController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Furniture_Repair_Step_DescriptionTitle'.tr(),
              hintText: 'Furniture_Repair_Step_DescriptionTitle'.tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 5,
            onChanged: (value) {
              constProviderData.needWork = value;
            },
          ),
        ],
      ),
    );
  }
}
