import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mister_jobby/widgets/const_widgets/custom_button.dart';

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
          color: Colors.black45,
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
                height: MediaQuery.of(context).size.width / 80,
              ),
              Row(
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  Text(
                    "${jobber!.completedJobs}",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 80,
                  ),
                  Text(
                    "Jobs_Performed",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ).tr(),
                ],
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
                      "DIY",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.width / 20,
                          decoration: BoxDecoration(
                            color: Colors.red.shade100,
                            shape: BoxShape.circle,
                          ),
                          child: const Icon(
                            Icons.stars,
                            size: 14,
                            color: Colors.red,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 80,
                        ),
                        Text(
                          jobber!.experince,
                          style: Theme.of(context).textTheme.displaySmall,
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
                      "Information",
                      style: Theme.of(context).textTheme.labelLarge,
                    ).tr(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 10,
                          height: MediaQuery.of(context).size.width / 10,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.business_center,
                            size: 20,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                        Expanded(
                          child: Text(
                            jobber!.personalDescription,
                            style: Theme.of(context).textTheme.bodySmall,
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
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "About",
                      style: Theme.of(context).textTheme.labelLarge,
                    ).tr(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Row(
                      children: <Widget>[
                        Container(
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.width / 20,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.home_work_rounded,
                            size: 14,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                        Expanded(
                          child: Text(
                            jobber!.address,
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
                          width: MediaQuery.of(context).size.width / 20,
                          height: MediaQuery.of(context).size.width / 20,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            shape: BoxShape.circle,
                          ),
                          child: Icon(
                            Icons.location_history,
                            size: 14,
                            color: Theme.of(context).primaryColor,
                          ),
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                        Text(
                          jobber!.country,
                          style: Theme.of(context).textTheme.bodySmall,
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
                          Text(
                            jobber!.reviews[index].name,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                          SizedBox(
                              width: MediaQuery.of(context).size.width / 90),
                          for(int i = 1; i < jobber!.reviews[index].star; i++)
                            const Icon(Icons.star, size: 14, color: Colors.yellow),
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
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              CustomButton(onPress: (){}, buttonName: "Continue")
            ],
          ),
        ),
      ),
    );
  }
}
