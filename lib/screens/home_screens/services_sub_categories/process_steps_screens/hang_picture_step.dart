import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class HangPictureStep extends StatelessWidget {
  const HangPictureStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
    Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hang_Picture_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Hang_Picture_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              RoundedButton(onTap: (){},
                height: 50,
                icon: Icons.remove,
                color: Theme.of(context).primaryColor,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 40,
              ),
              Text('0', style: Theme.of(context).textTheme.titleMedium,),
              SizedBox(
                width: MediaQuery.of(context).size.width / 40,
              ),
              RoundedButton(onTap: (){},
                height: 50,
                icon: Icons.add,
                color: Theme.of(context).primaryColor,
              ),

            ],
          ),
        ],
      ),
    );
  }
}
