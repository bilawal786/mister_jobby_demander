import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';

import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class HangTVStep extends StatelessWidget {
  const HangTVStep({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            "Curtain_Installation_Step_Title",
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            "Hang_TV_Step_SubTitle",
            style: Theme.of(context).textTheme.titleMedium,
          ).tr(),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Consumer<ConstProvider>(
            builder: (_, tv, child) => Row(
              children: <Widget>[
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: tv.tvHang1,
                    textTitle: "One",
                    color: Colors.grey.shade300,
                    border: tv.tvHangNo1 == 1 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: tv.tvHang2,
                    textTitle: "Two",
                    color: Colors.grey.shade300,
                    border: tv.tvHangNo2 == 2 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: tv.tvHang3,
                    textTitle: "Three",
                    color: Colors.grey.shade300,
                    border: tv.tvHangNo3 == 3 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: tv.tvHang4,
                    textTitle: "Four",
                    color: Colors.grey.shade300,
                    border: tv.tvHangNo4 == 4 ? true : false,
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: tv.tvHang5,
                    textTitle: "Five",
                    color: Colors.grey.shade300,
                    border: tv.tvHangNo5 == 5 ? true : false,
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
