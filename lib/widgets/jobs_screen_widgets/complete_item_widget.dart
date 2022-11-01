import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';

import '../../models/jobs_models/jobs_completed_model.dart';
import '../../screens/jobs_screens/jobs_tab_screens/completed_jobs_details_screen.dart';

class CompleteItemWidget extends StatelessWidget {
  final JobsCompletedModel? jobsCompletedModel;
  const CompleteItemWidget({Key? key, this.jobsCompletedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: (){
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CompletedJobsDetails(jobsCompletedModel: jobsCompletedModel),));
          },
          child: ListTile(
            contentPadding: const EdgeInsets.all(0),
            leading: Container(
              width: MediaQuery.of(context).size.width / 6.5,
              height: MediaQuery.of(context).size.width / 6.5,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(color: Colors.black45),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network(
                  '${MyRoutes.IMAGEURL}/${jobsCompletedModel!.image}',
                  fit: BoxFit.cover,
                ),
              ),
            ),
            title: Text(
              jobsCompletedModel!.title,
              style: Theme.of(context).textTheme.bodyMedium,
            ),
            subtitle: Text(
              jobsCompletedModel!.serviceDate,
              style: Theme.of(context).textTheme.labelMedium,
            ),
            trailing: const Icon(
              Icons.arrow_forward_ios,
              size: 16,
            ),
          ),
        ),
        const Divider(),
      ],
    );
  }
}
