import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/screens/jobs_screens/rating_reviews_screen.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../helpers/routes.dart';
import '../../models/jobs_models/job_reservations_model.dart';
import '../../widgets/const_widgets/custom_button.dart';
import '../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../messages_screens/chat_screen.dart';

class ViewRequestScreen extends StatelessWidget {
  final JobReservationsModel? reservation;
  const ViewRequestScreen({Key? key, required this.reservation})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "View Request",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                reservation!.job.title,
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 4.8,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4.8,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4.8,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4.8,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "The job was paid on ${reservation!.date}",
                style: const TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cerebri Sans Bold',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
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
                        "${MyRoutes.IMAGEURL}/${reservation!.jobberProfile.image}",
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
                        'Client'.tr(),
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 80,
                      ),
                      Text(
                        '${reservation!.jobberProfile.firstName} ${reservation!.jobberProfile.lastName}',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
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
                            builder: (ctx) => const ChatScreen(),
                          ),
                        );
                      },
                      textTitle: "Message",
                      border: true,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Expanded(
                    child: OutlineSelectedButton(
                      onTap: () {
                        _makePhoneCall(reservation!.jobberProfile
                            .phone);
                      },
                      textTitle: "Call",
                      border: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              Row(
                children: <Widget>[
                  Text(
                    "Job details".tr(),
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(
                    reservation!.contractNo,
                    style: TextStyle(
                      fontSize: 14,
                      fontFamily: 'Cerebri Sans Bold',
                      color: Colors.green.shade700,
                      fontWeight: FontWeight.bold,
                    ),
                  )
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Date",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "${reservation!.job.serviceDate} at ${reservation!.job.startTime}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.watch_later_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Initial duration",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "${reservation!.job.duration} h",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Hourly rate".tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "${reservation!.hourlyRate} €",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Remuneration".tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "${reservation!.price} €",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Administration tax".tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "${((double.parse(reservation!.price) * 10) / 100)} €",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Total Amount".tr(),
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "${(((double.parse(reservation!.price) * 10) / 100) + double.parse(reservation!.price))} €",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 10,
              ),
              Text(
                "Evaluation".tr(),
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: reservation!.jobberProfile.reviews.length,
                itemBuilder: (ctx, index) => Container(
                  padding: const EdgeInsets.all(10.0),
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Container(
                            width: MediaQuery.of(context).size.width / 10,
                            height: MediaQuery.of(context).size.width / 10,
                            decoration: const BoxDecoration(
                              shape: BoxShape.circle,
                              color: Colors.black12,
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(50),
                              child: Image.network(
                                "${MyRoutes.IMAGEURL}/${reservation!.jobberProfile.reviews[index].image}",
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 40),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                reservation!.jobberProfile.reviews[index].name,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Text(
                                reservation!.jobberProfile.reviews[index].date,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              Row(
                                children: <Widget>[
                                  for (int i = 0;
                                      i <
                                          reservation!.jobberProfile
                                              .reviews[index].star;
                                      i++)
                                    const Icon(Icons.star,
                                        size: 14, color: Colors.amber),
                                  SizedBox(
                                    width:
                                        MediaQuery.of(context).size.width / 40,
                                  ),
                                  Text(
                                    "(${reservation!.jobberProfile.reviews[index].star}.0)",
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                ],
                              ),
                            ],
                          ),
                          const Spacer(),

                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          reservation!.jobberProfile.reviews[index].message,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      const Divider(),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              const Divider(),
              if(reservation!.status != 2)
              CustomButton(
                onPress: () =>
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) => RatingReviewsScreen(reservation: reservation),),),
                buttonName: 'Complete Job',
              ),
            ],
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
