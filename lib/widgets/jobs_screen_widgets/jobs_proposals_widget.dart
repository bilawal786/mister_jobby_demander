import 'package:flutter/material.dart';
import 'package:mister_jobby/screens/jobs_screens/jobber_continue_screen.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../helpers/routes.dart';

import '../../providers/jobs_provider/job_proposals_provider.dart';
import '../../widgets/const_widgets/custom_button.dart';
import '../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../screens/jobs_screens/jobber_profile_screen.dart';

class JobsProposalsWidget extends StatefulWidget {
  final int jobId;
  const JobsProposalsWidget({Key? key, required this.jobId}) : super(key: key);

  @override
  State<JobsProposalsWidget> createState() => _JobsProposalsWidgetState();
}

class _JobsProposalsWidgetState extends State<JobsProposalsWidget> {
  var isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<JobProposalsProvider>(context).getJobProposals(widget.jobId);
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final jobProposalsData =
        Provider.of<JobProposalsProvider>(context, listen: false);
    final extractProposal = jobProposalsData.jobProposal;
    return extractProposal == null
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : extractProposal.isEmpty
            ? Center(
                child: Column(
                  children: <Widget>[
                    Icon(
                      Icons.find_in_page_rounded,
                      size: 150,
                      color: Theme.of(context).primaryColor,
                    ),
                    Text(
                      "Jobs_TapBar_Page1_Title",
                      style: Theme.of(context).textTheme.titleSmall,
                    ).tr(),
                  ],
                ),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(0.0),
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: extractProposal.length,
                itemBuilder: (ctx, index) => Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: [
                          Stack(
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
                                      "${MyRoutes.IMAGEURL}/${extractProposal[index].jobber.image}",
                                      fit: BoxFit.cover,
                                    )),
                              ),
                              if (extractProposal[index].jobber.verified ==
                                  true)
                                Positioned(
                                  right: -2,
                                  child: Icon(
                                    Icons.verified_user,
                                    color: Colors.green.shade700,
                                    size: 23,
                                  ),
                                ),
                            ],
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Stack(
                                children: [
                                  Container(
                                    padding: const EdgeInsets.only(right: 28),
                                    child: Text(
                                      "${extractProposal[index].jobber.firstName} ${extractProposal[index].jobber.lastName}",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium,
                                    ),
                                  ),
                                  if (extractProposal[index].jobber.pro == 2)
                                    Positioned(
                                      right: 0,
                                      top: 3,
                                      child: Container(
                                        decoration: BoxDecoration(
                                          color: Colors.blue,
                                          borderRadius:
                                              BorderRadius.circular(2),
                                        ),
                                        padding: const EdgeInsets.only(
                                          left: 1,
                                          right: 1,
                                        ),
                                        child: const Text(
                                          'PRO',
                                          style: TextStyle(
                                            fontSize: 12,
                                            color: Colors.white,
                                            fontFamily: 'Cerebri Sans Bold',
                                          ),
                                        ),
                                      ),
                                    ),
                                ],
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
                                    "${extractProposal[index].jobber.rating}",
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
                                        "(${extractProposal[index].jobber.totalReview}",
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
                                        "Reviews)",
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
                          Text(
                            "${extractProposal[index].price} €",
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
                                const Icon(
                                  Icons.stars,
                                  size: 20,
                                  color: Colors.black54,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                Expanded(
                                  child: Text(
                                    extractProposal[index].jobber.equipements,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.left,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 40,
                            ),
                            Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.business_center_sharp,
                                  size: 20,
                                  color: Colors.black54,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                Expanded(
                                  child: Text(
                                    extractProposal[index].jobber.engagments,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                    textAlign: TextAlign.justify,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      const Divider(),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "\"${extractProposal[index].jobber.description}\"",
                        style: Theme.of(context).textTheme.labelMedium,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        child: (extractProposal[index].status != 2)
                            ? CustomButton(
                                onPress: () {
                                  Navigator.of(context).push(MaterialPageRoute(
                                      builder: (ctx) => ContinueJobber(
                                            proposel: extractProposal[index],
                                          ),),);
                                },
                                buttonName: "Continue")
                            : OutlinedButton(
                                onPressed: () {},
                                style: OutlinedButton.styleFrom(
                                  backgroundColor: Colors.green,
                                  minimumSize: const Size.fromHeight(50),
                                ),
                                child: const Text(
                                  "Hired",
                                  style: TextStyle(
                                      fontSize: 20,
                                      fontFamily: 'Cerebri Sans Regular',
                                      fontWeight: FontWeight.normal,
                                      color: Colors.white,
                                      letterSpacing: 0.8),
                                ),
                              ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if(extractProposal[index].status != 2)
                      OutlineSelectedButton(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (ctx) => JobberProfileScreen(
                                    jobber: extractProposal[index].jobber,
                                  )));
                        },
                        textTitle: "See_Profile",
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
              );
  }
}
