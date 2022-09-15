import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:mister_jobby/models/jobs_models/jobs_in_progress_model.dart';

import '../const_widgets/custom_button.dart';

class InProgressItemWidget extends StatelessWidget {
  final JobsInProgressModel? jobsInProgress;
  const InProgressItemWidget({Key? key, this.jobsInProgress,}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black12,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.network(
                '${MyRoutes.IMAGEURL}/${jobsInProgress!.image}',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            jobsInProgress!.title,
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 80,
          ),
          Text(
            '${jobsInProgress!.serviceDate} from ${jobsInProgress!.startTime}',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: <Widget>[
                Icon(
                  Icons.notifications_outlined,
                  size: 22,
                  color: Theme.of(context).primaryColor,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "Received_Offer_Notification",
                  style: TextStyle(
                    fontFamily: 'Cerebri Sans Bold',
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                ).tr(),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  '${jobsInProgress!.totalOffers}',
                  style: TextStyle(
                    fontFamily: 'Cerebri Sans Bold',
                    color: Theme.of(context).primaryColor,
                    fontSize: 16,
                  ),
                )
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          CustomButton(onPress: () {}, buttonName: "Manage_Request"),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
