import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_steps_widgets/step_tiles.dart';

class FurnitureAssembleStep extends StatelessWidget {
  const FurnitureAssembleStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Furniture_Assembly_Step_Title",
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
            "Select the number of pieces of furniture to assemble",
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
          StepTile(
            tileTitle: "Small_Size_Tile_Title",
            tileSubTitle: ""
                "Small_Size_Tile_SubTitle",
            inputValue: 0,
            onPressAdd: () {},
            buttonColorSubTract: Theme.of(context).primaryColor,
            onPressSubTract: () {},
          ),
          const Divider(),

        ],
      ),
    );
  }
}
