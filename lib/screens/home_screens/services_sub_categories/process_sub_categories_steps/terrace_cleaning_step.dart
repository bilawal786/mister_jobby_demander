import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class TerraceCleaningStep extends StatelessWidget {
  const TerraceCleaningStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final constProviderData =
    Provider.of<ConstProvider>(context, listen: false);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Terrace_Cleaning_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Terrace_Cleaning_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 10,
          ),
          TextFormField(
            initialValue: 'Terrace_Cleaning_Step_Item1_Title'.tr(),
            decoration: const InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Titre de la demande',
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            enabled: false,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 10,
          ),
          Text(
            "Terrace_Cleaning_Step_Item2_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),

          TextFormField(
            onChanged: (value)  => constProviderData.getExplainWork(value),
            decoration: InputDecoration(
              border: const OutlineInputBorder(),
              labelText: 'Terrace_Cleaning_Step_Item2_Title'.tr(),
              hintText: 'Terrace_Cleaning_Step_Item2_Title'.tr(),
              isDense: true,
            ),
            style: Theme.of(context).textTheme.bodySmall,
            maxLines: 5,
          ),


          SizedBox(
            height: MediaQuery.of(context).size.width / 10,
          ),
          Text(
            "Terrace_Cleaning_Step_Item3_Title".tr(),
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
              builder: (_,cleanBoxValue,child)=>
                  SizedBox(
                    height: 50,
                    child: ListView.builder(
                      shrinkWrap: true,
                      scrollDirection: Axis.horizontal,
                      itemCount: 4,
                      itemBuilder: (context, index) =>
                          OutlineSelectedButton(
                              onTap: (){},
                              color: Colors.grey.shade300,
                              textTitle: 'Juste cette fois'),
                    ),
                  )
          ),



        ],
      ),
    );
  }
}