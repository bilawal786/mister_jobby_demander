import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/jobs_provider/jobs_in_progress_provider.dart';
import '../../../widgets/const_widgets/custom_button.dart';
import '../../../widgets/jobs_screen_widgets/in_progress_item_widget.dart';

class InProgressTab extends StatefulWidget {
  const InProgressTab({Key? key}) : super(key: key);

  @override
  State<InProgressTab> createState() => _InProgressTabState();
}

class _InProgressTabState extends State<InProgressTab> {
  var isInit = true;
  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<JobsInProgressProvider>(context, listen: false).getInProgressJobs();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final inProgressJobsData =
        Provider.of<JobsInProgressProvider>(context,);
    final extractedInProgressJobs = inProgressJobsData.inProgressJobs;
    return extractedInProgressJobs == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : extractedInProgressJobs.isEmpty
            ? //   SingleChildScrollView(
            Container(
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
                      onPress: () {},
                      buttonName: "I_need_a_favor",
                      elevation: 8,
                    ),
                  ],
                ),
              )
            : Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(5.0),
                child: RefreshIndicator(
                  onRefresh: ()async{
                    Provider.of<JobsInProgressProvider>(context, listen: false).getInProgressJobs();
                  },
                  child: ListView.builder(
                    padding: const EdgeInsets.all(0.0),
                    shrinkWrap: false,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: extractedInProgressJobs.length,
                    itemBuilder: (ctx, index) => InProgressItemWidget(
                      jobsInProgress: extractedInProgressJobs[index],
                    ),
                  ),
                ),
              );
  }
}
