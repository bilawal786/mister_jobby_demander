import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../../helpers/routes.dart';
import '../../../../models/jobs_models/jobs_in_progress_model.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class JobsDetailsScreen extends StatelessWidget {
  final JobsInProgressModel? jobsInProgressDetail;
  const JobsDetailsScreen({Key? key, this.jobsInProgressDetail})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black, size: 25),
            elevation: 0,
            expandedHeight: 200,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                "${MyRoutes.IMAGEURL}/${jobsInProgressDetail!.image}",
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
        body: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  jobsInProgressDetail!.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '${jobsInProgressDetail!.serviceDate} ${jobsInProgressDetail!.startTime}',
                  style: Theme.of(context).textTheme.labelMedium,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.location_on_outlined,
                            size: 25,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Text(
                            jobsInProgressDetail!.address,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.person,
                            size: 25,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Text(
                            "${jobsInProgressDetail!.jobberRequired}",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Text(
                            "Jobber_Asks",
                            style: Theme.of(context).textTheme.bodyMedium,
                          ).tr(),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          Icon(
                            Icons.account_balance_wallet,
                            size: 25,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Text(
                            '${jobsInProgressDetail!.estimateBudget} € ',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Text(
                            'Proposed_Compensation',
                            style: Theme.of(context).textTheme.bodyMedium,
                          ).tr(),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Row(
                  children: <Widget>[
                    Expanded(
                      child: OutlineSelectedButton(
                          onTap: () {}, textTitle: "Details", border: true),
                    ),
                    Expanded(
                      child: OutlineSelectedButton(
                          onTap: () {},
                          textTitle: "Modifier",
                          color: Colors.blueGrey.shade100),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                const Divider(),
                ListTile(
                  dense: true,
                  horizontalTitleGap: 0,
                  onTap: () {},
                  leading: Icon(
                    Icons.message_rounded,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    "View Comments \(${jobsInProgressDetail!.comments}\)",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  subtitle: Text(
                    "You haven't received any comments yet.",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios,
                    size: 14,
                    color: Colors.black,
                  ),
                ),
                const Divider(
                  color: Colors.black12,
                  thickness: 10,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Offers",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "\(${jobsInProgressDetail!.totalOffers}\)",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                ListView.builder(
                  padding: const EdgeInsets.all(0.0),
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 1,
                  itemBuilder: (ctx, index) => Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      children: <Widget>[
                        Row(
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width / 5.5,
                              height: MediaQuery.of(context).size.width / 5.5,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black12,
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Name Here",
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                                Row(
                                  children: <Widget>[
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 20,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          80,
                                    ),
                                    Text(
                                      "5",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          80,
                                    ),
                                    Text(
                                      "\(views\)",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Text(
                              "285 €",
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            children: <Widget>[
                              Row(
                                children: <Widget>[
                                  Icon(Icons.person)
                                ],
                              )
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
