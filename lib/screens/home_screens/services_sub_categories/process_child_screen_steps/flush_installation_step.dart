import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class FlushInstallationStep extends StatelessWidget {
  const FlushInstallationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Flush_Installation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Flush_Installation_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_,shower,child) =>
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    RoundedButton(
                      onTap: shower.fixesAmountDecrement,
                      height: 50,
                      icon: Icons.remove,
                      color: shower.fixesAmount < 1 ? Colors.blueGrey.shade300 : Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    Text('${shower.fixesAmount}', style: Theme.of(context).textTheme.titleMedium,),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 10,
                    ),
                    RoundedButton(
                      onTap: shower.fixesAmountIncrement,
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
