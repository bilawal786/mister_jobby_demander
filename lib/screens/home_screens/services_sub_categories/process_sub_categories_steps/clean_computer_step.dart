import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';

class CleanComputerStep extends StatelessWidget {
  const CleanComputerStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Clean_Computer_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Clean_Computer_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Clean_Computer_Step_Item1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 5,
          ),

          Text(
            "Clean_Computer_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, checkBoxData, child) => Row(
              children: [
                Text(
                  "Clean_Computer_Step_Item3_Title",
                  style: Theme.of(context).textTheme.bodyMedium,
                ).tr(),
                const Spacer(),
                InkWell(
                  onTap: checkBoxData.checkUrgentJobFunction,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: checkBoxData.checkUrgentJob
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: checkBoxData.checkUrgentJob
                        ? const Icon(
                            Icons.check,
                            size: 17,
                            color: Colors.white,
                          )
                        : const SizedBox(),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          Consumer<ConstProvider>(
            builder: (_, checkBoxData, child) => Row(
              children: [
                Text(
                  "Clean_Computer_Step_Item4_Title",
                  style: Theme.of(context).textTheme.bodyMedium,
                ).tr(),
                const Spacer(),
                InkWell(
                  onTap: checkBoxData.checkUrgentJobFunction,
                  child: Container(
                    margin: const EdgeInsets.all(2),
                    height: 20,
                    width: 20,
                    decoration: BoxDecoration(
                      color: checkBoxData.checkUrgentJob
                          ? Theme.of(context).primaryColor
                          : Colors.white,
                      border: Border.all(
                          width: 2, color: Theme.of(context).primaryColor),
                      borderRadius: BorderRadius.circular(4),
                    ),
                    child: checkBoxData.checkUrgentJob
                        ? const Icon(
                            Icons.check,
                            size: 17,
                            color: Colors.white,
                          )
                        : const SizedBox(),
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
