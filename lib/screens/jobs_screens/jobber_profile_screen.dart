import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../helpers/routes.dart';
import '../../models/jobs_models/job_proposals_model.dart';

class JobberProfileScreen extends StatelessWidget {
  final Jobber? jobber;
  const JobberProfileScreen({
    Key? key,
    required this.jobber,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 25,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                width: MediaQuery.of(context).size.width / 4,
                height: MediaQuery.of(context).size.width / 4,
                decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.black12,
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(50),
                  child: Image.network(
                    "${MyRoutes.IMAGEURL}/${jobber!.image}",
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                '${jobber!.firstName} ${jobber!.lastName}',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  const Icon(
                    Icons.star,
                    size: 12,
                    color: Colors.amber,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 80,
                  ),
                  Text(
                    "${jobber!.rating}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 80,
                  ),
                  Text(
                    "(${jobber!.totalReview}",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 80,
                  ),
                  Text(
                    "Views)",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 80,
              ),
              Text(
                "${jobber!.memberSince}",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "About".tr(),
                      style: Theme.of(context).textTheme.titleSmall,
                    ).tr(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width /40,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width /
                              10,
                          height:
                          MediaQuery.of(context).size.width /
                              10,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            FontAwesomeIcons.clipboardCheck,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              40,
                        ),
                        Text(
                          "${jobber!.completedJobs}",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 80,
                        ),
                        Text(
                          "Jobs_Performed",
                          style: Theme.of(context).textTheme.bodySmall,
                        ).tr(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width /
                              10,
                          height:
                          MediaQuery.of(context).size.width /
                              10,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            FontAwesomeIcons.clipboardList,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              40,
                        ),
                        Expanded(
                          child: Text(
                            "${jobber!.cancelJobs} Jobs Canceled",
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
                        Container(
                          width: MediaQuery.of(context).size.width /
                              10,
                          height:
                          MediaQuery.of(context).size.width /
                              10,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            FontAwesomeIcons.checkDouble,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              40,
                        ),
                        Expanded(
                          child: Text(
                            "${jobber!.totalJobs} Total Jobs",
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
                        Container(
                          width: MediaQuery.of(context).size.width /
                              10,
                          height:
                          MediaQuery.of(context).size.width /
                              10,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            FontAwesomeIcons.locationCrosshairs,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              40,
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Text(
                              "Address",
                              style: Theme.of(context).textTheme.labelMedium,
                            ),
                            SizedBox(height: MediaQuery.of(context).size.width / 80,),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.3,
                              child: Text(
                                jobber!.address,
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                            ),
                          ],
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
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Skills",
                      style: Theme.of(context).textTheme.titleSmall,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width * 1.2,
                      child: ListView.builder(
                        itemCount: jobber!.skills.length,
                        scrollDirection: Axis.horizontal,
                        itemBuilder: (ctx, index) => Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20.0),
                          ),
                          color: Colors.primaries[Random().nextInt(Colors.primaries.length)].shade300,
                          elevation: 5,
                          child: Container(
                            padding: const EdgeInsets.all(20.0),
                            width: MediaQuery.of(context).size.width / 1.2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  jobber!.skills[index].mainCategory.toString(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Cerebri Sans Bold',
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 40,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              10,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.businessTime,
                                        size: 20,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          40,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Experience".tr(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Cerebri Sans Regular',
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              80,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: Text(
                                            jobber!.skills[index].experience,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.8,
                                              fontFamily: 'Cerebri Sans Regular',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 40,
                                ),
                                Text(
                                  "Information".tr(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Cerebri Sans Bold',
                                  ),
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 40,
                                ),
                                  Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              10,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.graduationCap,
                                        size: 20,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          40,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Diploma".tr(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Cerebri Sans Regular',
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              80,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: Text(
                                            (jobber!.skills[index].diplomaName != "") ? jobber!.skills[index].diplomaName : "No diploma",
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.8,
                                              fontFamily: 'Cerebri Sans Regular',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 40,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              10,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.screwdriverWrench,
                                        size: 20,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          40,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Equipments".tr(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Cerebri Sans Regular',
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              80,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: Text(
                                            jobber!.skills[index].equipments,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.8,
                                              fontFamily: 'Cerebri Sans Regular',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                      MediaQuery.of(context).size.width / 40,
                                ),
                                Row(
                                  children: <Widget>[
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          10,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              10,
                                      decoration: BoxDecoration(
                                        color: Colors.blue.shade50,
                                        shape: BoxShape.circle,
                                      ),
                                      child: Icon(
                                        FontAwesomeIcons.groupArrowsRotate,
                                        size: 20,
                                        color: Theme.of(context).primaryColor,
                                      ),
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          40,
                                    ),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: <Widget>[
                                        Text(
                                          "Engagements".tr(),
                                          style: const TextStyle(
                                            fontSize: 14,
                                            color: Colors.white70,
                                            fontWeight: FontWeight.w700,
                                            fontFamily: 'Cerebri Sans Regular',
                                          ),
                                        ),
                                        SizedBox(
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              80,
                                        ),
                                        SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              1.8,
                                          child: Text(
                                            jobber!.skills[index].engagments,
                                            style: const TextStyle(
                                              fontSize: 14,
                                              color: Colors.white,
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 0.8,
                                              fontFamily: 'Cerebri Sans Regular',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.width / 40,
                                ),
                                Text(
                                  "Description".tr(),
                                  style: const TextStyle(
                                    fontSize: 16,
                                    color: Colors.white,
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'Cerebri Sans Bold',
                                  ),
                                ),
                                SizedBox(
                                  height:
                                  MediaQuery.of(context).size.width / 40,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context)
                                      .size
                                      .width /
                                      1.4,
                                  child: Text(
                                    jobber!.skills[index].engagments,
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w600,
                                      letterSpacing: 0.8,
                                      fontFamily: 'Cerebri Sans Regular',
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
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
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Text(
                  "Reviews:",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: jobber!.reviews.length,
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
                                "${MyRoutes.IMAGEURL}/${jobber!.reviews[index].image}",
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
                                jobber!.reviews[index].name,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                              Row(
                                children: <Widget>[
                                  for (int i = 0; i < jobber!.reviews[index].star; i++)
                                    const Icon(Icons.star,
                                        size: 14, color: Colors.amber),
                                  SizedBox(width: MediaQuery.of(context).size.width / 40,),
                                  Text("(${jobber!.reviews[index].star}.0)", style: Theme.of(context).textTheme.bodySmall,),
                                ],
                              ),
                            ],
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 90),
                          const Spacer(),
                          Text(
                            jobber!.reviews[index].date,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        child: Text(
                          jobber!.reviews[index].message,
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
            ],
          ),
        ),
      ),
    );
  }
}
