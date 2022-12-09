import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../screens/home_screens/home_tabs_screen.dart';
import '../const_widgets/custom_button.dart';

class NoDataFoundWidget extends StatelessWidget {
  const NoDataFoundWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40.0),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Icon(
              Icons.find_in_page_rounded,
              size: 150,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              "Jobs_TapBar_Page1_Title",
              style: Theme.of(context).textTheme.titleSmall,
            ).tr(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Text(
              "Jobs_TabBar_Page1_Description",
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ).tr(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            CustomButton(
              onPress: () {
                Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (ctx)=> MyHomeBottomTabScreen(pageIndex: 0,)), (route) => false);
              },
              buttonName: "I_need_a_favor",
              elevation: 8,
            ),
          ],
        ),
      ),
    );;
  }
}
