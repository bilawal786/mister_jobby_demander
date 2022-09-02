import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class ComputerJobStep extends StatelessWidget {
  const ComputerJobStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Computer_Job_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Computer_Job_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Rid_Clutter_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          TextFormField(
            onChanged: (value) {},
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Rid_Clutter_Step_Item2_Title'.tr(),
              hintText: 'Rid_Clutter_Step_Item2_Title'.tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 5,
          ),
        ],
      ),
    );
  }
}
