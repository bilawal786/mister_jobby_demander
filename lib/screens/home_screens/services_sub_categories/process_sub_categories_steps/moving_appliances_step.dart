import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class MovingAppliancesStep extends StatefulWidget {
  const MovingAppliancesStep({Key? key}) : super(key: key);

  @override
  State<MovingAppliancesStep> createState() => _MovingAppliancesStepState();
}

class _MovingAppliancesStepState extends State<MovingAppliancesStep> {
  TextEditingController pickAddressController = TextEditingController();
  TextEditingController destinationAddressController = TextEditingController();

  @override
  void dispose() {
    pickAddressController.dispose();
    destinationAddressController.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    final constProviderData =
    Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Moving_Appliances_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "What_You_Need_Title",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Pick-up_address",
            style: Theme.of(context).textTheme.labelMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          TextFormField(
            controller: pickAddressController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: "Pick-up_address".tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            enabled: true,
            onChanged: (pValue) {
              constProviderData.pickupAddress = pValue;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Destination_address",
            style: Theme.of(context).textTheme.labelMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          TextFormField(
            controller: destinationAddressController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: "Destination_address".tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            enabled: true,
            onChanged: (pValue) {
              constProviderData.destinationAddress = pValue;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Moving_Appliances_Step_Item1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, appliancesData, child) => SizedBox(
              height: 45,
              child: ListView.builder(
                itemCount: 10,
                padding: const EdgeInsets.only(left: 15, right: 15),
                itemExtent: MediaQuery.of(context).size.width / 5,
                scrollDirection: Axis.horizontal,
                itemBuilder: (BuildContext context, int index) =>
                    OutlineSelectedButton(
                      onTap: () => appliancesData.tvHangFunction(index),
                      textTitle: index == 0
                          ? "One"
                          : index == 1
                          ? "Two"
                          : index == 2
                          ? "Three"
                          : index == 3
                          ? "Four"
                          : index == 4
                          ? "Five"
                          : index == 5
                          ? "Six"
                          : index == 6
                          ? "Seven"
                          : index == 7
                          ? "Eight"
                          : index == 8
                          ? "Nine"
                          : "Ten",
                      color: appliancesData.tvHangNo - 1 == index ?Colors.blue.shade50:Colors.grey.shade300,
                      // height: 40,
                      // width: 45,
                      border: appliancesData.tvHangNo - 1 == index ? true : false,
                    ),
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Moving_Appliances_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, jobberData, child) => SizedBox(height:45,child: ListView.builder(
              itemCount: 2,
              itemExtent: MediaQuery.of(context).size.width / 2.25,
              physics:const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                onTap: ()=>jobberData.jobberBringMaterialFunction(index),
                textTitle: index == 0?"Yes":"No",
                color:jobberData.jobberBringMaterialValue-1 == index ?Colors.blue.shade50: Colors.grey.shade300,
                border: jobberData.jobberBringMaterialValue-1 == index ? true : false,
              ),
            ),),
          ),
        ],
      ),
    );
  }
}
