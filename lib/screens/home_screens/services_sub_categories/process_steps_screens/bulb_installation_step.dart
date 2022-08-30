import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class BulbInstallationStep extends StatelessWidget {
  const BulbInstallationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Bulb_Installation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Bulb_Installation_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_,bulbInstallation,child) =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundedButton(
                      onTap: bulbInstallation.bulbInstallationDecrement,
                      height: 50,
                      icon: Icons.remove,
                      color: bulbInstallation.bulbInstallationAmount < 1 ? Colors.blueGrey.shade300 : Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    Text('${bulbInstallation.bulbInstallationAmount}', style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    RoundedButton(
                      onTap: bulbInstallation.bulbInstallationAmountIncrement,
                      height: 50,
                      icon: Icons.add,
                      color: Theme.of(context).primaryColor,
                    ),

                  ],
                ),
          ),
        ],
      ),
    );
  }
}
