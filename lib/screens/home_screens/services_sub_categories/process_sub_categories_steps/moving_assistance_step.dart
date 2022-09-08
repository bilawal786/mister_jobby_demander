import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';

class MovingAssistanceStep extends StatefulWidget {
  const MovingAssistanceStep({Key? key}) : super(key: key);

  @override
  State<MovingAssistanceStep> createState() => _MovingAssistanceStepState();
}

class _MovingAssistanceStepState extends State<MovingAssistanceStep> {
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
            "Moving_Assistance_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Moving_Assistance_Step_SubTitle",
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
          Consumer<ConstProvider>(
            builder: (_, rangeSliderData, child) => Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Moving_Assistance_Step_Itme1_Title".tr(),
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                    Text(
                      '${rangeSliderData.areaOfMoveSliderValue}m²',
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ],
                ),
                Row(
                  children: [
                    Icon(
                      Icons.cast_outlined,
                      color: Theme.of(context).primaryColor,
                      size: 25,
                    ),
                    Expanded(
                      child: RangeSliderCLass(
                        rangeValue: rangeSliderData.areaOfMoveSliderValue,
                        minRange: 25,
                        maxRange: 205,
                        division: 18,
                        onChanged: (value) =>
                            rangeSliderData.areaOfMoveSliderFunction(value),
                      ),
                    ),
                    Icon(
                      Icons.cast_connected,
                      color: Theme.of(context).primaryColor,
                      size: 25,
                    ),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Moving_Assistance_Step_Itme2_Title".tr(),
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
