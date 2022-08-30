import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';

class FurnitureRepairStep extends StatelessWidget {
  const FurnitureRepairStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
    Provider.of<ConstProvider>(context, listen: false);
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
            height: MediaQuery.of(context).size.width / 40,
          ),

        TextFormField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Titre de la demande',
            hintText: 'Resparation meuble'
          ),
        ),






        ],
      ),
    );
  }
}
