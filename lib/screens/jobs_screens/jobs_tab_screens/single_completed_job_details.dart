import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../helpers/routes.dart';
import '../../../models/jobs_models/jobs_completed_model.dart';
import '../../../providers/jobs_provider/edit_jobs_provider.dart';

class SingleCompletedJobsDetails extends StatefulWidget {
  final JobsCompletedModel? jobsCompletedModel;
  const SingleCompletedJobsDetails({Key? key, this.jobsCompletedModel, })
      : super(key: key);

  @override
  State<SingleCompletedJobsDetails> createState() => _SingleCompletedJobsDetailsState();
}

class _SingleCompletedJobsDetailsState extends State<SingleCompletedJobsDetails> {
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              if (widget.jobsCompletedModel!.detailDescription.isNotEmpty ||
                  widget.jobsCompletedModel!.image1 != "" ||
                  widget.jobsCompletedModel!.image2 != "" ||
                  widget.jobsCompletedModel!.image3 != "") ...[

                if (widget.jobsCompletedModel!.image1 != "" ||
                    widget.jobsCompletedModel!.image2 != "" ||
                    widget.jobsCompletedModel!.image3 != "")
                  Text(
                    "Images",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Row(
                  children: <Widget>[
                    (widget.jobsCompletedModel!.image1 != "")
                        ? Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.black),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (ctx) => ImagePreview(
                            //         imageUrl:
                            //         "${MyRoutes.IMAGEURL}${widget.jobsCompletedModel!.image1}"),
                            //   ),
                            // );
                          },
                          child: Image.network(
                            "${MyRoutes.IMAGEURL}${widget.jobsCompletedModel!.image1}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                        : const SizedBox(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    (widget.jobsCompletedModel!.image2 != "")
                        ? Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.black),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (ctx) => ImagePreview(
                            //         imageUrl:
                            //         "${MyRoutes.IMAGEURL}${widget.jobsCompletedModel!.image2}"),
                            //   ),
                            // );
                          },
                          child: Image.network(
                            "${MyRoutes.IMAGEURL}${widget.jobsCompletedModel!.image2}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                        : const SizedBox(),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    (widget.jobsCompletedModel!.image3 != "")
                        ? Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade200,
                        borderRadius: BorderRadius.circular(5.0),
                        border: Border.all(color: Colors.black),
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(5.0),
                        child: GestureDetector(
                          onTap: () {
                            // Navigator.of(context).push(
                            //   MaterialPageRoute(
                            //     builder: (ctx) => ImagePreview(
                            //         imageUrl:
                            //         "${MyRoutes.IMAGEURL}${widget.jobsCompletedModel!.image3}"),
                            //   ),
                            // );
                          },
                          child: Image.network(
                            "${MyRoutes.IMAGEURL}${widget.jobsCompletedModel!.image3}",
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    )
                        : const SizedBox(),
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                const Divider(),],
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "Service_Date",
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Consumer<EditJobsProvider>(
                builder: (_, selectDate, child) => Text(
                  "${selectDate.selectedDate.day < 10 ? "0${selectDate.selectedDate.day}" : "${selectDate.selectedDate.day}"}-${selectDate.selectedDate.month < 10 ? "0${selectDate.selectedDate.month}" : "${selectDate.selectedDate.month}"}-${selectDate.selectedDate.year}",
                  style: Theme.of(context).textTheme.labelLarge,
                ),
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 30,
              ),
              Text(
                "Service_Time_Start",
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                widget.jobsCompletedModel!.startTime,
                style: Theme.of(context).textTheme.labelLarge,
              ),

              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  (widget.jobsCompletedModel!.childcategoryId == 1 ||
                      widget.jobsCompletedModel!.childcategoryId == 2 ||
                      widget.jobsCompletedModel!.childcategoryId == 19 ||
                      widget.jobsCompletedModel!.childcategoryId == 23)) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Small Size",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                      if (int.parse(widget.jobsCompletedModel!.medium) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Medium Size ",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.medium,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                      if (int.parse(widget.jobsCompletedModel!.large) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Large Size ",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.large,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                      if (int.parse(widget.jobsCompletedModel!.verylarge) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Very Large Size ",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.verylarge,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                      if (widget.jobsCompletedModel!.question.isNotEmpty) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        if (widget.jobsCompletedModel!.childcategoryId == 1 ||
                            widget.jobsCompletedModel!.childcategoryId == 2)
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: Text(
                                  "Do you want the service provider to clear the boxes ?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.question,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        if (widget.jobsCompletedModel!.childcategoryId == 19)
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.8,
                                child: Text(
                                  "Pass two coats?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.question,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 3) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many rods should be installed?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 4) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many Shelves should be fixed?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 5) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many TVs do you need to hang?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 6) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many Shower screens should be installed?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 7) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many paintings should be hung?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 8) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many mirrors should be hung?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  ((widget.jobsCompletedModel!.childcategoryId == 9 ||
                      widget.jobsCompletedModel!.childcategoryId == 10 ||
                      widget.jobsCompletedModel!.childcategoryId == 11 ||
                      widget.jobsCompletedModel!.childcategoryId == 12) &&
                      widget.jobsCompletedModel!.description.isNotEmpty) ||
                  widget.jobsCompletedModel!.childcategoryId == 13) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (widget.jobsCompletedModel!.description.isNotEmpty) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Text(
                          "What is your need?",
                          style: Theme.of(context).textTheme.labelLarge,
                        ).tr(),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Text(
                          widget.jobsCompletedModel!.description,
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                      if (widget.jobsCompletedModel!.childcategoryId == 13) ...[
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.8,
                              child: Text(
                                "Do you want the service provider to clear the boxes?",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ]
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 14) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many outlets should be installed?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 15) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many bulbs do you need to change?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 16) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many lamps should be installed?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  (widget.jobsCompletedModel!.childcategoryId == 17 ||
                      widget.jobsCompletedModel!.childcategoryId == 20)) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (widget.jobsCompletedModel!.question.isNotEmpty &&
                          widget.jobsCompletedModel!.question != 'null') ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        if (widget.jobsCompletedModel!.childcategoryId == 17) ...[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Text(
                                  "Do you want the service provider to clear the boxes?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.question,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Text(
                                  "Equipment(s)?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.question1,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Text(
                                  "Camera?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.question2,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                        if (widget.jobsCompletedModel!.childcategoryId == 20) ...[
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Text(
                                  "Need to install baseboards?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.question,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.4,
                                child: Text(
                                  "Does the jobber have to bring his own cutting material?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.question1,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ]
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  widget.jobsCompletedModel!.childcategoryId == 18) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "How many Ac should be installed?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId == 21 ||
                  widget.jobsCompletedModel!.childcategoryId == 22) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (double.parse(widget.jobsCompletedModel!.surface) > 0)
                        Row(
                          children: <Widget>[
                            Text(
                              "Surface to be laid?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.surface,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId == 24) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (double.parse(widget.jobsCompletedModel!.surface) > 0)
                        Row(
                          children: <Widget>[
                            Text(
                              "Surface to be laid?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.surface,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 1.5,
                            child: Text(
                              "Does the jobber have to bring his own cutting material?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.childcategoryId != null &&
                  (widget.jobsCompletedModel!.childcategoryId == 25 ||
                      widget.jobsCompletedModel!.childcategoryId == 26 ||
                      widget.jobsCompletedModel!.childcategoryId == 27 ||
                      widget.jobsCompletedModel!.childcategoryId == 28 ||
                      widget.jobsCompletedModel!.childcategoryId == 29 ||
                      widget.jobsCompletedModel!.childcategoryId == 30 ||
                      widget.jobsCompletedModel!.childcategoryId == 31)) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (int.parse(widget.jobsCompletedModel!.small) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            if (widget.jobsCompletedModel!.childcategoryId == 25)
                              Text(
                                "How many leaks need to be repaired ?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            if (widget.jobsCompletedModel!.childcategoryId == 26)
                              Text(
                                "How many flushes do you need to be change ?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            if (widget.jobsCompletedModel!.childcategoryId == 27)
                              Text(
                                "How many taps do you need to be change ?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            if (widget.jobsCompletedModel!.childcategoryId == 28)
                              Text(
                                "How many sinks do you need to be unclog ?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            if (widget.jobsCompletedModel!.childcategoryId == 29)
                              Text(
                                "How many washing machines should be connected ?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            if (widget.jobsCompletedModel!.childcategoryId == 30)
                              Text(
                                "How many toilets do you need to fix ?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            if (widget.jobsCompletedModel!.childcategoryId == 31)
                              Text(
                                "How many plugs do you need to change ?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.small,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 5 ||
                  widget.jobsCompletedModel!.subcategoryId == 8) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (double.parse(widget.jobsCompletedModel!.surface) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            if (widget.jobsCompletedModel!.subcategoryId == 5)
                              Text(
                                "Area to mow?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            if (widget.jobsCompletedModel!.subcategoryId == 8)
                              Text(
                                "Area to clear",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.surface,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            if (widget.jobsCompletedModel!.subcategoryId == 5)
                              Text(
                                "Should the jobber bring his own mower?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            if (widget.jobsCompletedModel!.subcategoryId == 8)
                              Text(
                                "Does the jobber have to bring his own brush?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            if (widget.jobsCompletedModel!.subcategoryId == 5)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  "Does the jobber have to remove waste from your home?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsCompletedModel!.subcategoryId == 8)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 1.5,
                                child: Text(
                                  "Does the jobber have to remove waste from your home?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question1,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            if (widget.jobsCompletedModel!.subcategoryId == 5)
                              Text(
                                "Request frequency?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            if (widget.jobsCompletedModel!.subcategoryId == 8)
                              Text(
                                "Demand frequencies?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question2,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 6) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (double.parse(widget.jobsCompletedModel!.surface) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Number of linear meters?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.surface,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        if (int.parse(widget.jobsCompletedModel!.small) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Small size Between 1 and 1.5 meters",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        if (int.parse(widget.jobsCompletedModel!.medium) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Medium size Between 1.5 and 2 meters",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.medium,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        if (int.parse(widget.jobsCompletedModel!.large) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Large size Between 2 and 3 meters",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.large,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        if (int.parse(widget.jobsCompletedModel!.verylarge) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Very large size more than 3 meters",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.verylarge,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                "Should the jobber bring his own hedge trimmer?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Does the jobber have to remove waste?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question1,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 7) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (double.parse(widget.jobsCompletedModel!.surface) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Number of trees to be cut?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.surface,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        if (int.parse(widget.jobsCompletedModel!.small) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Small size",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        if (int.parse(widget.jobsCompletedModel!.medium) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Medium size ",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.medium,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        if (int.parse(widget.jobsCompletedModel!.large) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Large size ",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.large,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        if (int.parse(widget.jobsCompletedModel!.verylarge) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Very large size more than 3 meters",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsCompletedModel!.verylarge,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                "Does the jobber have to bring his material?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Should the jobber remove waste?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question1,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 9) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      if (double.parse(widget.jobsCompletedModel!.surface) > 0) ...[
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Surface to be weeded?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.surface,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 1.5,
                              child: Text(
                                "Does the jobber have to remove waste?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                        Row(
                          children: <Widget>[
                            Text(
                              "Demand Frequencies?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                            const Spacer(),
                            Text(
                              widget.jobsCompletedModel!.question1,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 10 ||
                  widget.jobsCompletedModel!.subcategoryId == 11 ||
                  widget.jobsCompletedModel!.subcategoryId == 12 ||
                  widget.jobsCompletedModel!.subcategoryId == 13) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "What do you need?",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.jobsCompletedModel!.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Demand Frequencies?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 14) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "Pick-up address?",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.jobsCompletedModel!.pickupAddress,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "destination address?",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.jobsCompletedModel!.destinationAddress,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Housing area to move",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.surface,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Does the service provider have to come with his own truck?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 15 ||
                  widget.jobsCompletedModel!.subcategoryId == 16) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "Pick-up address?",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.jobsCompletedModel!.pickupAddress,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "destination address?",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.jobsCompletedModel!.destinationAddress,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          Text(
                            "Number of pieces of furniture",
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Does the service provider have to come with his own truck?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question1,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 17 ||
                  widget.jobsCompletedModel!.subcategoryId == 18 ||
                  widget.jobsCompletedModel!.subcategoryId == 28 ||
                  widget.jobsCompletedModel!.subcategoryId == 37 ||
                  widget.jobsCompletedModel!.subcategoryId == 38 ||
                  widget.jobsCompletedModel!.subcategoryId == 39 ||
                  widget.jobsCompletedModel!.subcategoryId == 40 ||
                  widget.jobsCompletedModel!.subcategoryId == 41 ||
                  widget.jobsCompletedModel!.subcategoryId == 42 ||
                  widget.jobsCompletedModel!.subcategoryId == 43 ||
                  widget.jobsCompletedModel!.subcategoryId == 44 ||
                  widget.jobsCompletedModel!.subcategoryId == 45) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "What do you need?",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.jobsCompletedModel!.description,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.subcategoryId == 17 ||
                              widget.jobsCompletedModel!.subcategoryId == 18)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Does the service provider have to come with his own truck?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.subcategoryId == 28 ||
                              widget.jobsCompletedModel!.subcategoryId == 37 ||
                              widget.jobsCompletedModel!.subcategoryId == 38 ||
                              widget.jobsCompletedModel!.subcategoryId == 39 ||
                              widget.jobsCompletedModel!.subcategoryId == 40 ||
                              widget.jobsCompletedModel!.subcategoryId == 41 ||
                              widget.jobsCompletedModel!.subcategoryId == 42 ||
                              widget.jobsCompletedModel!.subcategoryId == 43 ||
                              widget.jobsCompletedModel!.subcategoryId == 44 ||
                              widget.jobsCompletedModel!.subcategoryId == 45)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Request Frequencies",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 19 ||
                  widget.jobsCompletedModel!.subcategoryId == 20 ||
                  widget.jobsCompletedModel!.subcategoryId == 21 ||
                  widget.jobsCompletedModel!.subcategoryId == 22) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "Pick-up address",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.jobsCompletedModel!.pickupAddress,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Text(
                        "Destination address",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 1.8,
                        child: Text(
                          widget.jobsCompletedModel!.destinationAddress,
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Do I have to assemble the furniture",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Number of floor on arrival",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.small,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 23) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Surface to be cleaned",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.surface,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Window cleaning",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Appliance cleaning",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question1,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Ironing",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question2,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Demand Frequencies",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question3,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 24 ||
                  widget.jobsCompletedModel!.subcategoryId == 25 ||
                  widget.jobsCompletedModel!.subcategoryId == 27) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.subcategoryId == 24)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Select the number of clothes",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.subcategoryId == 25)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Vehicle type",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.subcategoryId == 27)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Number of windows",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Demand Frequencies",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question1,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 26) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Select surface",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.surface,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "How often do you want this job to be done ?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 30 ||
                  widget.jobsCompletedModel!.subcategoryId == 31 ||
                  widget.jobsCompletedModel!.subcategoryId == 32 ||
                  widget.jobsCompletedModel!.subcategoryId == 34) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.subcategoryId == 30 ||
                              widget.jobsCompletedModel!.subcategoryId == 31 ||
                              widget.jobsCompletedModel!.subcategoryId == 32)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Type of gaurd",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.subcategoryId == 34)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Course duration",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 33) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.question == "1")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Free from I escape disk",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "2")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Detection and eradication of viruses and spyware",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "3")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Complete checkup",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          const Text(
                            "True",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Installing Update",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question1,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Data backup",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          Text(
                            widget.jobsCompletedModel!.question2,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 35) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.question == "1")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Local via USB cable",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "2")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Network (Wifi or bluetooth)",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          const Text(
                            "True",
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 36 ||
                  widget.jobsCompletedModel!.subcategoryId == 66 ||
                  widget.jobsCompletedModel!.subcategoryId == 68 ||
                  widget.jobsCompletedModel!.subcategoryId == 69) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "What you need",
                          style: Theme.of(context).textTheme.labelMedium,
                        ).tr(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          widget.jobsCompletedModel!.description,
                          style: Theme.of(context).textTheme.labelMedium,
                        ).tr(),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 46 ||
                  widget.jobsCompletedModel!.subcategoryId == 47 ||
                  widget.jobsCompletedModel!.subcategoryId == 48 ||
                  widget.jobsCompletedModel!.subcategoryId == 49 ||
                  widget.jobsCompletedModel!.subcategoryId == 50 ||
                  widget.jobsCompletedModel!.subcategoryId == 51 ||
                  widget.jobsCompletedModel!.subcategoryId == 52 ||
                  widget.jobsCompletedModel!.subcategoryId == 53 ||
                  widget.jobsCompletedModel!.subcategoryId == 54 ||
                  widget.jobsCompletedModel!.subcategoryId == 55 ||
                  widget.jobsCompletedModel!.subcategoryId == 56 ||
                  widget.jobsCompletedModel!.subcategoryId == 57 ||
                  widget.jobsCompletedModel!.subcategoryId == 58 ||
                  widget.jobsCompletedModel!.subcategoryId == 59 ||
                  widget.jobsCompletedModel!.subcategoryId == 60) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Educational level requested",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Desired course format",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question1,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Request Frequency",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question2,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 61 ||
                  widget.jobsCompletedModel!.subcategoryId == 65) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.subcategoryId == 61)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Photo editing?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.subcategoryId == 65)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Does the jobber have to provider the mixing board?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.subcategoryId == 61)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Discount on USB key?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.subcategoryId == 65)
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "The jobber must provide the sound system?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question1,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 62) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Number of restorations",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.small,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.question == "1")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Sit-down meal",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "2")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "cocktail buffet",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "3")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Meal tray",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const Text(
                              "true",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Does the jobber have to provide the dishes?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question1,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "The jobber must provide the utensils?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question2,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Should the jobber empty the bins?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question3,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 63) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Number of prompts",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.small,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Does the jobber have to provide the dishes?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "The jobber must provide the utensils?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question1,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Should the jobber empty the bins?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question2,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 64) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Number of restorations",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.small,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.question == "1")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Sit-down meal",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "2")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "cocktail buffet",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "3")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Meal tray",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const Text(
                              "true",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Should  the jobber empty the bins?",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.question1,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 67) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 2,
                            child: Text(
                              "Number of flyers",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: Text(
                              widget.jobsCompletedModel!.surface,
                              style: const TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.question == "1")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Street marketing",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "2")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Letter box",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "3")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Windshield",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const Text(
                              "true",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 70) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "Type of repair",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ).tr(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.question == "1")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Drain",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "2")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Tires",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "3")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Braking",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "4")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Windscreen wipers",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "5")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Candles",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "6")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Battery",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "7")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Air conditioner",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const Text(
                              "true",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 71) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "Type of repair",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ).tr(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.question == "1")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Engine part",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "2")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Mechanical piece",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "3")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Body",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "4")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Mirror",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "5")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Chest",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "6")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Door",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "7")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Window",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "8")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Lighting",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "9")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Accessories",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const Text(
                              "true",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              if (widget.jobsCompletedModel!.subcategoryId == 72) ...[
                Padding(
                  padding: const EdgeInsets.all(0.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "Information",
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "Item types",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ).tr(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.question == "1")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Home appliance",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question == "2")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Vehicle",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const Text(
                              "true",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: Text(
                          "Material type of repair",
                          style: Theme.of(context).textTheme.bodyMedium,
                        ).tr(),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 40,
                      ),
                      Row(
                        children: <Widget>[
                          if (widget.jobsCompletedModel!.question1 == "1")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Mechanical",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          if (widget.jobsCompletedModel!.question1 == "2")
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 2,
                              child: Text(
                                "Electric",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                            ),
                          const Spacer(),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 3,
                            child: const Text(
                              "true",
                              style: TextStyle(
                                fontSize: 14,
                                fontFamily: 'Cerebri Sans Bold',
                                fontWeight: FontWeight.bold,
                              ),
                              textAlign: TextAlign.right,
                            ).tr(),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 20,
                ),
                const Divider(
                  height: 2,
                  thickness: 10,
                ),
              ],
              SizedBox(
                height: MediaQuery.of(context).size.width / 30,
              ),
              Text(
                "Budget_Estimate_Step2_Title",
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              Container(
                padding: const EdgeInsets.only(top: 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Row(
                      children: [
                        Text(
                          "Jobber_Ask",
                          style: Theme.of(context).textTheme.labelMedium,
                        ).tr(),
                        const Spacer(),
                        Text(
                          widget.jobsCompletedModel!.jobberRequired.toString(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ).tr(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Row(
                      children: [
                        Text(
                          "Service_Time_Start",
                          style: Theme.of(context).textTheme.labelMedium,
                        ).tr(),
                        const Spacer(),
                        Text(
                          widget.jobsCompletedModel!.startTime,
                          style: Theme.of(context).textTheme.bodySmall,
                        ).tr(),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Row(
                      children: [
                        Text(
                          "Rate per Hour",
                          style: Theme.of(context).textTheme.labelMedium,
                        ).tr(),
                        const Spacer(),
                        Text(
                          "${widget.jobsCompletedModel!.hours}€ /h",
                          style: Theme.of(context).textTheme.bodySmall,
                        ).tr(),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(),
            ],
          ),
        ),
      ),
    );
  }
}
