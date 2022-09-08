import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button.dart';

class FurnitureDeliveryStep extends StatefulWidget {
  const FurnitureDeliveryStep({Key? key}) : super(key: key);

  @override
  State<FurnitureDeliveryStep> createState() => _FurnitureDeliveryStepState();
}

class _FurnitureDeliveryStepState extends State<FurnitureDeliveryStep> {
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
    final constProviderData = Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Furniture_Delivery_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Furniture_Delivery_Step_SubTitle",
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
            "Furniture_Delivery_Step_Item1_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, cleanBoxValue, child) => SizedBox(height:45,child: ListView.builder(
              itemCount: 2,
              itemExtent: MediaQuery.of(context).size.width / 2.25,
              physics:const NeverScrollableScrollPhysics(),
              scrollDirection: Axis.horizontal,
              itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                onTap: ()=>cleanBoxValue.cleanBoxFurnitureFunction(index),
                textTitle: index == 0?"Yes":"No",
                color:cleanBoxValue.cleanBoxFurniture-1 == index ?Colors.blue.shade50: Colors.grey.shade300,
                border: cleanBoxValue.cleanBoxFurniture-1 == index ? true : false,
              ),
            ),),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Furniture_Delivery_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, floorsArrivalData, child) => Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RoundedButton(
                  onTap: floorsArrivalData.fixesAmountDecrement,
                  height: 50,
                  icon: Icons.remove,
                  color: floorsArrivalData.fixesAmount < 1
                      ? Colors.blueGrey.shade300
                      : Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                Text(
                  '${floorsArrivalData.fixesAmount}',
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 10,
                ),
                RoundedButton(
                  onTap: floorsArrivalData.fixesAmountIncrement,
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
