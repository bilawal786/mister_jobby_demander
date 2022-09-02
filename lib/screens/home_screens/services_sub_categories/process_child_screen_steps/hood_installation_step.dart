import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';

class HoodInstallationStep extends StatelessWidget {
  const HoodInstallationStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
        Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Hood_Installation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Hood_Installation_Step_SubTitle",
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
              labelText: 'Hood_Installation_Step_DescriptionTitle'.tr(),
              hintText: 'Hood_Installation_Step_DescriptionTitle'.tr(),
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
