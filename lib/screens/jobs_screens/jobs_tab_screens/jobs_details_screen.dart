import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mister_jobby/screens/jobs_screens/jobs_tab_screens/edit_job_screen.dart';

import '../../../helpers/routes.dart';
import '../../../widgets/const_widgets/custom_button.dart';
import '../../../widgets/jobs_screen_widgets/jobs_proposals_widget.dart';
import '../../../../models/jobs_models/jobs_in_progress_model.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class JobsDetailsScreen extends StatefulWidget {
  final JobsInProgressModel? jobsInProgressDetail;
  const JobsDetailsScreen({Key? key, this.jobsInProgressDetail})
      : super(key: key);

  @override
  State<JobsDetailsScreen> createState() => _JobsDetailsScreenState();
}

class _JobsDetailsScreenState extends State<JobsDetailsScreen> {
  void openSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height / 4.8,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Edit_Job",
                  style: Theme.of(context).textTheme.titleSmall,
                ).tr(),
                const Divider(),
                InkWell(
                  onTap: () {
                    print('open date and time editor');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (ctx) => const EditJobScreen(),
                      ),
                    );
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      Icon(
                        Icons.watch_later_outlined,
                        color: Theme.of(context).primaryColor,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Change_Date",
                        style: Theme.of(context).textTheme.bodySmall,
                      ).tr(),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.delete,
                        color: Colors.red,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Delete_Job",
                        style: Theme.of(context).textTheme.bodySmall,
                      ).tr(),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }

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
            expandedHeight: 180,
            pinned: true,
            floating: true,
            snap: true,
            flexibleSpace: FlexibleSpaceBar(
              centerTitle: true,
              background: Image.network(
                "${MyRoutes.IMAGEURL}/${widget.jobsInProgressDetail!.image}",
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
                  widget.jobsInProgressDetail!.title,
                  style: Theme.of(context).textTheme.titleMedium,
                ),
                Text(
                  '${widget.jobsInProgressDetail!.serviceDate} ${widget.jobsInProgressDetail!.startTime}',
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
                            size: 22,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.3,
                            child: Text(
                              widget.jobsInProgressDetail!.address,
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
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
                            size: 22,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Text(
                            "${widget.jobsInProgressDetail!.jobberRequired}",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Text(
                            "Jobber_Asks",
                            style: Theme.of(context).textTheme.bodySmall,
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
                            size: 22,
                            color: Theme.of(context).primaryColor,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Text(
                            '${widget.jobsInProgressDetail!.estimateBudget} € ',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Text(
                            'Proposed_Compensation',
                            style: Theme.of(context).textTheme.bodySmall,
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
                          onTap: () {
                            openSheet();
                          },
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
                  onTap: () => Navigator.of(context)
                      .pushNamed(MyRoutes.COMMENTSCREENROUTE, arguments: {
                    'jobId': widget.jobsInProgressDetail!.id.toString(),
                  }),
                  leading: Icon(
                    Icons.message_rounded,
                    size: 20,
                    color: Theme.of(context).primaryColor,
                  ),
                  title: Text(
                    "View Comments (${widget.jobsInProgressDetail!.totalComments})",
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
                      "Reservations",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "(1)",
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
                              width: MediaQuery.of(context).size.width / 6,
                              height: MediaQuery.of(context).size.width / 6,
                              decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.black12,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(50),
                                child: Image.network(
                                  "https://www.erc.com.pk/wp-content/uploads/person4.jpg",
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 40,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  "Name here",
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
                                      width:
                                          MediaQuery.of(context).size.width / 80,
                                    ),
                                    Text(
                                      "5",
                                      style:
                                          Theme.of(context).textTheme.bodySmall,
                                    ),
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 80,
                                    ),
                                    Row(
                                      children: [
                                        Text(
                                          "(20",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ),
                                        SizedBox(
                                          width:
                                              MediaQuery.of(context).size.width /
                                                  100,
                                        ),
                                        Text(
                                          "Views)",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
                                        ).tr(),
                                      ],
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            const Spacer(),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.phone_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                                IconButton(
                                  onPressed: () {},
                                  icon: Icon(
                                    Icons.chat_outlined,
                                    color: Theme.of(context).primaryColor,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        CustomButton(
                          onPress: () => Navigator.of(context).pushNamed(MyRoutes.VIEWREQUESTROUTE),
                          buttonName: "View Request",
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        OutlineSelectedButton(
                          onTap: () {},
                          textTitle: "Change or cancel",
                          border: true,
                          width: double.infinity,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        const Divider(
                          color: Colors.black12,
                          thickness: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Row(
                  children: <Widget>[
                    Text(
                      "Offers",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Text(
                      "(${widget.jobsInProgressDetail!.totalOffers})",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                JobsProposalsWidget(jobId: widget.jobsInProgressDetail!.id),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
