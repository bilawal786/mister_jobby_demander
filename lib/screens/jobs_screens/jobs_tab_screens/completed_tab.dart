import 'package:flutter/material.dart';
import 'package:mister_jobby/widgets/jobs_screen_widgets/complete_item_widget.dart';
import 'package:provider/provider.dart';

import '../../../providers/jobs_provider/jobs_compleleted_provider.dart';
import '../../../widgets/jobs_screen_widgets/no_data_found_widget.dart';

class CompletedTab extends StatefulWidget {
  const CompletedTab({Key? key}) : super(key: key);

  @override
  State<CompletedTab> createState() => _CompletedTabState();
}

class _CompletedTabState extends State<CompletedTab> {
  var isInit = true;
  @override
  void didChangeDependencies() {
    if(isInit){
      Provider.of<JobsCompletedProvider>(context).getJobsCompleted(context);
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final jobsCompletedData = Provider.of<JobsCompletedProvider>(context,listen: false);
    final extractJobsCompleted = jobsCompletedData.jobsCompletedModel;
    return extractJobsCompleted == null ?
    const Center(
      child: CircularProgressIndicator(),
    ):extractJobsCompleted.isEmpty ?
         const NoDataFoundWidget()
        : RefreshIndicator(
          onRefresh: ()async{
            Provider.of<JobsCompletedProvider>(context, listen: false).getJobsCompleted(context);
          },
          child: ListView.builder(
              clipBehavior: Clip.none,
              itemCount: extractJobsCompleted.length,
              padding: const EdgeInsets.all(10),
              itemBuilder: (context, index) => CompleteItemWidget(jobsCompletedModel: extractJobsCompleted[index]),
            ),
        );
  }
}
