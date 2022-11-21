import 'dart:io';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../../providers/country_provider/country_list_provider.dart';
import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_steps_widgets/places_selected_input_widget.dart';

class GeneralStep3Screen extends StatefulWidget {
  const GeneralStep3Screen({Key? key}) : super(key: key);

  @override
  State<GeneralStep3Screen> createState() => _GeneralStep3ScreenState();
}

class _GeneralStep3ScreenState extends State<GeneralStep3Screen> {
  TextEditingController postalCodeController = TextEditingController();


  @override
  void dispose() {
    postalCodeController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final constProviderData = Provider.of<ConstProvider>(context);
    final countryData = Provider.of<CountryProvider>(context, listen: false);
    final extractCountry = countryData.countryList;
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Information_about_Need_Step2_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Address_Title",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const GooglePlacesApi(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Postal_Code",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          TextFormField(
            controller: postalCodeController,
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: "Postal_Code".tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            enabled: true,
            onChanged: (pValue) {
              constProviderData.postalCode = pValue;
            },
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Country_Title",
            style: Theme.of(context).textTheme.titleSmall,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
                Consumer<ConstProvider>(
                  builder: (_,dropDownData,child)=>
                   Container(
                    height: 50.0,
                    padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey, width: 1),
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    child: DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                        hintText: "Select Country",
                        hintStyle: Theme.of(context).textTheme.bodyMedium,
                        isCollapsed: true,
                        enabledBorder: InputBorder.none,
                        focusedBorder: InputBorder.none,
                      ),
                      isExpanded: true,
                      iconSize: 30.0,
                      items:extractCountry?.map(
                            (val) {
                          return DropdownMenuItem<String>(
                            value: val.id.toString(),
                            child: Text(
                              val.name,
                              style:
                              Theme.of(context).textTheme.bodySmall,
                            ),
                          );
                        },
                      ).toList(),
                      onChanged: (val) {
                        dropDownData.countryDropDownFunction(val);
                        // print("drop down value ${dropDownData.countryDropDownValue}");
                      },
                    ),
                  ),
                ),

          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
        ],
      ),
    );
  }
}
