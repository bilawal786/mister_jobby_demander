import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mister_jobby/providers/jobs_provider/job_proposals_provider.dart';
import 'package:mister_jobby/providers/jobs_provider/jobs_in_progress_provider.dart';
import 'package:mister_jobby/screens/jobs_screens/jobs_tab_screens/edit_job_screen.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:mister_jobby/screens/jobs_screens/jobs_tab_screens/single_jobs_details.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../helpers/routes.dart';
import '../../../providers/jobs_provider/cancel_reservation_provider.dart';
import '../../../providers/jobs_provider/job_reservation_provider.dart';
import '../../../widgets/const_widgets/custom_button.dart';
import '../../../widgets/jobs_screen_widgets/jobs_proposals_widget.dart';
import '../../../../models/jobs_models/jobs_in_progress_model.dart';
import '../../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../messages_screens/chat_screen.dart';
import '../request_view.dart';
import 'jobber_profile_reservation.dart';

class JobsDetailsScreen extends StatefulWidget {
  final JobsInProgressModel? jobsInProgressDetail;
  const JobsDetailsScreen({Key? key, this.jobsInProgressDetail})
      : super(key: key);

  @override
  State<JobsDetailsScreen> createState() => _JobsDetailsScreenState();
}

class _JobsDetailsScreenState extends State<JobsDetailsScreen> {
  var isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<JobReservationProvider>(context)
          .getJobReservations(widget.jobsInProgressDetail!.id.toString());
    }
    isInit = false;
    super.didChangeDependencies();
  }

  void openSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.width / 1.8,
            margin: const EdgeInsets.all(10),
            padding: const EdgeInsets.all(10),
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Edit_Job",
                    style: Theme.of(context).textTheme.titleSmall,
                  ).tr(),
                  const SizedBox(
                    height: 10,
                  ),
                  InkWell(
                    onTap: () {
                      debugPrint('open date and time editor');
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (ctx) => EditJobScreen(
                              jobsDetail: widget.jobsInProgressDetail),
                        ),
                      );
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.blue),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: Icon(
                              Icons.watch_later_outlined,
                              color: Theme.of(context).primaryColor,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Center(
                              child: Text(
                                "Change_Date",
                                style: Theme.of(context).textTheme.bodySmall,
                              ).tr(),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        border: Border.all(width: 1, color: Colors.blue),
                      ),
                      child: Row(
                        children: [
                          Container(
                            width: 60,
                            height: 60,
                            decoration: BoxDecoration(
                              color: Colors.blueGrey.shade100,
                              borderRadius: BorderRadius.circular(3),
                            ),
                            child: const Icon(
                              Icons.delete,
                              color: Colors.red,
                              size: 25,
                            ),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.4,
                            child: Center(
                              child: Text(
                                "Delete_Job",
                                style: Theme.of(context).textTheme.bodySmall,
                              ).tr(),
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
        );
      },
    );
  }

  void closeJobOpenSheet() {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.width / 6,
            margin: const EdgeInsets.all(10),
            // padding: const EdgeInsets.all(10,),
            child: InkWell(
              onTap: () {
                Provider.of<JobsInProgressProvider>(context, listen: false)
                    .closeThisJob(
                        context, widget.jobsInProgressDetail!.id.toString());
              },
              child: Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(width: 1, color: Colors.blue),
                ),
                child: Row(
                  children: [
                    Container(
                      width: 60,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.blueGrey.shade100,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Icon(
                        FontAwesomeIcons.personCircleXmark,
                        color: Colors.red.shade400,
                        size: 25,
                      ),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 1.4,
                      child: Center(
                        child: Text(
                          "Close_Job",
                          style: Theme.of(context).textTheme.bodySmall,
                        ).tr(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final reservationData =
        Provider.of<JobReservationProvider>(context, listen: false);
    final extractedReservation = reservationData.jobReservations;
    return Scaffold(
      body: NestedScrollView(
        floatHeaderSlivers: true,
        headerSliverBuilder: (context, innerBoxIsScrolled) => [
          SliverAppBar(
            title: InkWell(
              onTap: () {
                closeJobOpenSheet();
              },
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                      padding: const EdgeInsets.all(5),
                      decoration: const BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.white,
                      ),
                      child: const Icon(
                        Icons.more_vert,
                      ))
                ],
              ),
            ),
            backgroundColor: Colors.white,
            iconTheme: const IconThemeData(color: Colors.black, size: 25),
            elevation: 0,
            expandedHeight: 140,
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
                          onTap: () {
                            Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (ctx) => SingleJobsDetails(
                                    jobsDetail: widget.jobsInProgressDetail),
                              ),
                            );
                          },
                          textTitle: "Details",
                          border: true),
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
                  ).tr(),
                  subtitle: Text(
                    "You haven't received any comments yet.",
                    style: Theme.of(context).textTheme.labelMedium,
                  ).tr(),
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
                if (extractedReservation != null &&
                    extractedReservation.isNotEmpty) ...[
                  Row(
                    children: <Widget>[
                      Text(
                        "Reservations",
                        style: Theme.of(context).textTheme.titleMedium,
                      ).tr(),
                      Text(
                        "(${extractedReservation.length})",
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
                    itemCount: extractedReservation.length,
                    itemBuilder: (ctx, index) => Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Column(
                        children: <Widget>[
                          Row(
                            children: [
                              Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (ctx) =>
                                                  JobberProfileReservationScreen(
                                                    jobber:
                                                        extractedReservation[
                                                                index]
                                                            .jobberProfile,
                                                  )));
                                    },
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 6,
                                      height:
                                          MediaQuery.of(context).size.width / 6,
                                      decoration: const BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.black12,
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(50),
                                        child: Image.network(
                                          "${MyRoutes.IMAGEURL}/${extractedReservation[index].jobberProfile.image}",
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  if (extractedReservation[index]
                                          .jobberProfile
                                          .verified ==
                                      2)
                                    Positioned(
                                      right: -2,
                                      child: Icon(
                                        Icons.verified_user_sharp,
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
                                      Padding(
                                        padding:
                                            const EdgeInsets.only(right: 28),
                                        child: Text(
                                          "${extractedReservation[index].jobberProfile.firstName} ${extractedReservation[index].jobberProfile.lastName}",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodyMedium,
                                        ),
                                      ),
                                      if (extractedReservation[index]
                                              .jobberProfile
                                              .pro ==
                                          2)
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
                                            MediaQuery.of(context).size.width /
                                                80,
                                      ),
                                      Text(
                                        "${extractedReservation[index].jobberProfile.rating}",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                      SizedBox(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                80,
                                      ),
                                      Row(
                                        children: [
                                          Text(
                                            "(${extractedReservation[index].jobberProfile.reviews.length}",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                          SizedBox(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width /
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
                              Row(
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      _makePhoneCall(extractedReservation[index]
                                          .jobberProfile
                                          .phone);
                                    },
                                    icon: Icon(
                                      Icons.phone_outlined,
                                      color: Theme.of(context).primaryColor,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) => const ChatScreen(),
                                        ),
                                      );
                                    },
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
                          Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 4),
                            child: (extractedReservation[index].status != 2)
                                ? CustomButton(
                                    onPress: () => Navigator.of(context).push(
                                      MaterialPageRoute(
                                        builder: (ctx) => ViewRequestScreen(
                                          reservation:
                                              extractedReservation[index],
                                        ),
                                      ),
                                    ),
                                    buttonName: "View Request",
                                  )
                                : OutlinedButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(
                                          builder: (ctx) => ViewRequestScreen(
                                            reservation:
                                                extractedReservation[index],
                                          ),
                                        ),
                                      );
                                    },
                                    style: OutlinedButton.styleFrom(
                                      backgroundColor: Colors.green,
                                      minimumSize: const Size.fromHeight(50),
                                    ),
                                    child: Text(
                                      "View Request".tr(),
                                      style: const TextStyle(
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
                          if (extractedReservation[index].status == 1)
                            OutlineSelectedButton(
                              onTap: () {
                                Provider.of<CancelReservationProvider>(context,
                                        listen: false)
                                    .cancelJobReservations(
                                  context,
                                  extractedReservation[index].id.toString(),
                                  widget.jobsInProgressDetail!.id.toString(),
                                );
                              },
                              textTitle: "Request For Cancellation",
                              border: true,
                              width: double.infinity,
                            ),
                          if (extractedReservation[index].status == 4)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                              width: MediaQuery.of(context).size.width / 1.15,
                              decoration: BoxDecoration(
                                color: Colors.amber,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text("Waiting for approvel", style: Theme.of(context).textTheme.bodyMedium,
                              textAlign: TextAlign.center,).tr(),
                            ),
                          if (extractedReservation[index].status == 3)
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 15),
                              width: MediaQuery.of(context).size.width / 1.15,
                              decoration: BoxDecoration(
                                color: Colors.red,
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                              child: Text("Cancelled", style: Theme.of(context).textTheme.bodyMedium,
                                textAlign: TextAlign.center,).tr(),
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
                ],
                Row(
                  children: <Widget>[
                    Text(
                      "Offers",
                      style: Theme.of(context).textTheme.titleMedium,
                    ),
                    Consumer<JobProposalsProvider>(
                      builder: (_, extractOffer, child) => Text(
                        "(${extractOffer.jobProposal?.length})",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
                    const Spacer(),
                    Consumer<JobProposalsProvider>(
                      builder: (_, offers, child) => InkWell(
                        onTap: () {
                          offers.setCheckApi();
                          offers
                              .getJobProposals(widget.jobsInProgressDetail!.id);
                        },
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: offers.checkApi == false
                              ? const SizedBox(
                                  width: 25,
                                  height: 25,
                                  child: CircularProgressIndicator())
                              : const Icon(
                                  Icons.refresh,
                                  size: 25,
                                  color: Colors.black,
                                ),
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                AbsorbPointer(
                  absorbing: (widget.jobsInProgressDetail!.isHired ==
                          widget.jobsInProgressDetail!.jobberRequired)
                      ? true
                      : false,
                  child: JobsProposalsWidget(
                      jobId: widget.jobsInProgressDetail!.id),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> _makePhoneCall(String url) async {
    if (await canLaunchUrl(Uri(scheme: 'tel', path: url))) {
      await launchUrl(Uri(scheme: 'tel', path: url));
    } else {
      throw 'Could not launch $url';
    }
  }
}
