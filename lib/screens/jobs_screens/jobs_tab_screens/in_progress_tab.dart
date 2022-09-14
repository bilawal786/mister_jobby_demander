import 'package:flutter/material.dart';
import 'package:mister_jobby/widgets/jobs_screen_widgets/in_progress_item_widget.dart';


class InProgressTab extends StatelessWidget {
  const InProgressTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //   SingleChildScrollView(
        //   child: Container(
        //     padding: const EdgeInsets.all(40.0),
        //     margin: const EdgeInsets.all(10.0),
        //     child: Column(
        //       children: [
        //         const SizedBox(
        //           height: 100,
        //         ),
        //         Icon(
        //           Icons.find_in_page_rounded,
        //           size: 150,
        //           color: Theme.of(context).primaryColor,
        //         ),
        //         Text(
        //           "Jobs_TapBar_Page1_Title",
        //           style: Theme.of(context).textTheme.titleSmall,
        //         ).tr(),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.height / 40,
        //         ),
        //         Text(
        //           "Jobs_TabBar_Page1_Description",
        //           style: Theme.of(context).textTheme.labelLarge,
        //           textAlign: TextAlign.center,
        //         ).tr(),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.height / 40,
        //         ),
        //         CustomButton(
        //           onPress: () {},
        //           buttonName: "I_need_a_favor",
        //           elevation: 8,
        //         ),
        //       ],
        //     ),
        //   ),
        // );

        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(5.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (ctx, index) => const InProgressItemWidget(),
          ),
        );
  }
}
