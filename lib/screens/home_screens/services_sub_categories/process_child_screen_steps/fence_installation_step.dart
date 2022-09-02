import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';


class FenceInstallationStep extends StatelessWidget {
  const FenceInstallationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Fence_Installation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Fence_Installation_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 20,
          ),
          TextFormField(
            onChanged: (value) {
              constProviderData.needWork = value;
            },
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Small_Repair_Step_DescriptionTitle'.tr(),
              hintText: 'Small_Repair_Step_DescriptionTitle'.tr(),
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
