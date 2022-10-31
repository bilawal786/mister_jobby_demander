import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mister_jobby/models/jobs_models/jobs_in_progress_model.dart';
import 'package:provider/provider.dart';

import '../../../providers/jobs_provider/edit_jobs_provider.dart';
import '../../../widgets/const_widgets/custom_button.dart';

class EditJobScreen extends StatefulWidget {
  final JobsInProgressModel? jobsDetail;
  const EditJobScreen({Key? key, required this.jobsDetail}) : super(key: key);

  @override
  State<EditJobScreen> createState() => _EditJobScreenState();
}

class _EditJobScreenState extends State<EditJobScreen> {
  @override
  Widget build(BuildContext context) {
    final editJobsData = Provider.of<EditJobsProvider>(context);

    return WillPopScope(
      onWillPop: () async {
        editJobsData.clearEditJobData();
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          title: Text(
            "Edit Job",
            style: Theme.of(context).textTheme.bodyLarge,
          ),
          iconTheme: const IconThemeData(
            color: Colors.black45,
            size: 25,
          ),
        ),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Service_Do_You_Want_To_Add_Photos",
                  style: Theme.of(context).textTheme.titleSmall,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 5,
                      ),
                      Consumer<EditJobsProvider>(
                        builder: (index, imageFileData, child) => SizedBox(
                          child: imageFileData.imageFile0 != null
                              ? Stack(
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(
                                      imageFileData.imageFile0 ?? "",
                                    ).absolute,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 6,
                                top: 8,
                                child: InkWell(
                                  onTap: () {
                                    imageFileData.removeImage(0);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.clear,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                              : InkWell(
                            onTap: () {
                              imageFileData.showPicker(context, 0);
                            },
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: const Icon(Icons.camera_alt),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Consumer<EditJobsProvider>(
                        builder: (index, imageFileData, child) => SizedBox(
                          child: imageFileData.imageFile1 != null
                              ? Stack(
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(
                                      imageFileData.imageFile1 ?? "",
                                    ).absolute,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 6,
                                top: 8,
                                child: InkWell(
                                  onTap: () {
                                    imageFileData.removeImage(1);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.clear,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                              : InkWell(
                            onTap: () {
                              imageFileData.showPicker(context, 1);
                            },
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: const Icon(Icons.camera_alt),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Consumer<EditJobsProvider>(
                        builder: (index, imageFileData, child) => SizedBox(
                          child: imageFileData.imageFile2 != null
                              ? Stack(
                            children: [
                              Container(
                                height: 130,
                                width: 130,
                                decoration: BoxDecoration(
                                    color: Colors.grey.shade300,
                                    borderRadius: BorderRadius.circular(10)),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: Image.file(
                                    File(
                                      imageFileData.imageFile2 ?? "",
                                    ).absolute,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 6,
                                top: 8,
                                child: InkWell(
                                  onTap: () {
                                    imageFileData.removeImage(2);
                                  },
                                  child: Container(
                                    height: 30,
                                    width: 30,
                                    decoration: BoxDecoration(
                                      color: Colors.grey.shade400,
                                      shape: BoxShape.circle,
                                    ),
                                    child: const Icon(
                                      Icons.clear,
                                      size: 20,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          )
                              : InkWell(
                            onTap: () {
                              imageFileData.showPicker(context, 2);
                            },
                            child: Container(
                              height: 130,
                              width: 130,
                              decoration: BoxDecoration(
                                color: Colors.grey.shade300,
                                borderRadius: BorderRadius.circular(7),
                                border: Border.all(
                                  color: Colors.grey,
                                  width: 1,
                                ),
                              ),
                              child: const Icon(Icons.camera_alt),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
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
                  "Service_Date",
                  style: Theme.of(context).textTheme.titleSmall,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<EditJobsProvider>(
                  builder: (_, selectDate, child) => GestureDetector(
                    onTap: () {
                      selectDate.selectDateProvider(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 30, right: 10),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0.2,
                            blurRadius: 1,
                            offset:
                                const Offset(0.5, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "${selectDate.selectedDate.day < 10 ? "0${selectDate.selectedDate.day}" : "${selectDate.selectedDate.day}"}-${selectDate.selectedDate.month < 10 ? "0${selectDate.selectedDate.month}" : "${selectDate.selectedDate.month}"}-${selectDate.selectedDate.year}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 30,
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
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<EditJobsProvider>(
                  builder: (_, checkStatus, child) => InkWell(
                    onTap: () {
                      checkStatus.statusPicker(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(10.0),
                      decoration: BoxDecoration(
                        color: Colors.grey.shade300,
                        borderRadius: BorderRadius.circular(7.0),
                      ),
                      child: Row(
                        children: <Widget>[
                          Padding(
                            padding: const EdgeInsets.only(left: 22,),
                            child: Text(
                              checkStatus.statusName,
                              style: Theme.of(context).textTheme.labelLarge,
                            ),
                          ),
                          const Spacer(),
                          const Icon(
                            Icons.arrow_drop_down_rounded,
                            size: 30,
                            color: Colors.black,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),

                if (widget.jobsDetail!.childcategoryId != null &&
                    (widget.jobsDetail!.childcategoryId == 1 ||
                        widget.jobsDetail!.childcategoryId == 2 ||
                        widget.jobsDetail!.childcategoryId == 19 ||
                        widget.jobsDetail!.childcategoryId == 23)) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                        if (int.parse(widget.jobsDetail!.medium) > 0) ...[
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
                                widget.jobsDetail!.medium,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                        if (int.parse(widget.jobsDetail!.large) > 0) ...[
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
                                widget.jobsDetail!.large,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                        if (int.parse(widget.jobsDetail!.verylarge) > 0) ...[
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
                                widget.jobsDetail!.verylarge,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                        if (widget.jobsDetail!.question.isNotEmpty) ...[
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 40,
                          ),
                          if (widget.jobsDetail!.childcategoryId == 1 ||
                              widget.jobsDetail!.childcategoryId == 2)
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.8,
                                  child: Text(
                                    "Do you want the service provider to clear the boxes ?",
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ).tr(),
                                ),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.question,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          if (widget.jobsDetail!.childcategoryId == 19)
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.8,
                                  child: Text(
                                    "Pass two coats?",
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ).tr(),
                                ),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.question,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 3) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 4) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 5) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 6) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 7) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 8) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    ((widget.jobsDetail!.childcategoryId == 9 ||
                        widget.jobsDetail!.childcategoryId == 10 ||
                        widget.jobsDetail!.childcategoryId == 11 ||
                        widget.jobsDetail!.childcategoryId == 12) &&
                        widget.jobsDetail!.description.isNotEmpty) ||
                    widget.jobsDetail!.childcategoryId == 13) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (widget.jobsDetail!.description.isNotEmpty) ...[
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
                            widget.jobsDetail!.description,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                        if (widget.jobsDetail!.childcategoryId == 13) ...[
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
                                widget.jobsDetail!.question,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ]
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],

                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 14) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 15) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 16) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    (widget.jobsDetail!.childcategoryId == 17 ||
                        widget.jobsDetail!.childcategoryId == 20)) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (widget.jobsDetail!.question.isNotEmpty &&
                            widget.jobsDetail!.question != 'null') ...[
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 40,
                          ),
                          if (widget.jobsDetail!.childcategoryId == 17) ...[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.4,
                                  child: Text(
                                    "Do you want the service provider to clear the boxes?",
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ).tr(),
                                ),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.question,
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
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ).tr(),
                                ),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.question1,
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
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ).tr(),
                                ),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.question2,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          ],
                          if (widget.jobsDetail!.childcategoryId == 20) ...[
                            Row(
                              children: <Widget>[
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.4,
                                  child: Text(
                                    "Need to install baseboards?",
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ).tr(),
                                ),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.question,
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
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ).tr(),
                                ),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.question1,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    widget.jobsDetail!.childcategoryId == 18) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
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
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId == 21 ||
                    widget.jobsDetail!.childcategoryId == 22) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (double.parse(widget.jobsDetail!.surface) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Surface to be laid?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsDetail!.surface,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId == 24) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (double.parse(widget.jobsDetail!.surface) > 0)
                          Row(
                            children: <Widget>[
                              Text(
                                "Surface to be laid?",
                                style: Theme.of(context).textTheme.labelMedium,
                              ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsDetail!.surface,
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
                              widget.jobsDetail!.question,
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.childcategoryId != null &&
                    (widget.jobsDetail!.childcategoryId == 25 ||
                        widget.jobsDetail!.childcategoryId == 26 ||
                        widget.jobsDetail!.childcategoryId == 27 ||
                        widget.jobsDetail!.childcategoryId == 28 ||
                        widget.jobsDetail!.childcategoryId == 29 ||
                        widget.jobsDetail!.childcategoryId == 30 ||
                        widget.jobsDetail!.childcategoryId == 31)) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (int.parse(widget.jobsDetail!.small) > 0) ...[
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 40,
                          ),
                          Row(
                            children: <Widget>[
                              if (widget.jobsDetail!.childcategoryId == 25)
                                Text(
                                  "How many leaks need to be repaired ?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              if (widget.jobsDetail!.childcategoryId == 26)
                                Text(
                                  "How many flushes do you need to be change ?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              if (widget.jobsDetail!.childcategoryId == 27)
                                Text(
                                  "How many taps do you need to be change ?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              if (widget.jobsDetail!.childcategoryId == 28)
                                Text(
                                  "How many sinks do you need to be unclog ?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              if (widget.jobsDetail!.childcategoryId == 29)
                                Text(
                                  "How many washing machines should be connected ?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              if (widget.jobsDetail!.childcategoryId == 30)
                                Text(
                                  "How many toilets do you need to fix ?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              if (widget.jobsDetail!.childcategoryId == 31)
                                Text(
                                  "How many plugs do you need to change ?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsDetail!.small,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],

                if (widget.jobsDetail!.subcategoryId == 5 ||
                    widget.jobsDetail!.subcategoryId == 8) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (double.parse(widget.jobsDetail!.surface) > 0) ...[
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 40,
                          ),
                          Row(
                            children: <Widget>[
                              if (widget.jobsDetail!.subcategoryId == 5)
                                Text(
                                  "Area to mow?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              if (widget.jobsDetail!.subcategoryId == 8)
                                Text(
                                  "Area to clear",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsDetail!.surface,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              if (widget.jobsDetail!.subcategoryId == 5)
                                Text(
                                  "Should the jobber bring his own mower?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              if (widget.jobsDetail!.subcategoryId == 8)
                                Text(
                                  "Does the jobber have to bring his own brush?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsDetail!.question,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              if (widget.jobsDetail!.subcategoryId == 5)
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  child: Text(
                                    "Does the jobber have to remove waste from your home?",
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ).tr(),
                                ),
                              if (widget.jobsDetail!.subcategoryId == 8)
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 1.5,
                                  child: Text(
                                    "Does the jobber have to remove waste from your home?",
                                    style:
                                    Theme.of(context).textTheme.labelMedium,
                                  ).tr(),
                                ),
                              const Spacer(),
                              Text(
                                widget.jobsDetail!.question1,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          Row(
                            children: <Widget>[
                              if (widget.jobsDetail!.subcategoryId == 5)
                                Text(
                                  "Request frequency?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              if (widget.jobsDetail!.subcategoryId == 8)
                                Text(
                                  "Demand frequencies?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              const Spacer(),
                              Text(
                                widget.jobsDetail!.question2,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 6) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (double.parse(widget.jobsDetail!.surface) > 0) ...[
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
                                widget.jobsDetail!.surface,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          if (int.parse(widget.jobsDetail!.small) > 0)
                            Row(
                              children: <Widget>[
                                Text(
                                  "Small size Between 1 and 1.5 meters",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.small,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          if (int.parse(widget.jobsDetail!.medium) > 0)
                            Row(
                              children: <Widget>[
                                Text(
                                  "Medium size Between 1.5 and 2 meters",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.medium,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          if (int.parse(widget.jobsDetail!.large) > 0)
                            Row(
                              children: <Widget>[
                                Text(
                                  "Large size Between 2 and 3 meters",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.large,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          if (int.parse(widget.jobsDetail!.verylarge) > 0)
                            Row(
                              children: <Widget>[
                                Text(
                                  "Very large size more than 3 meters",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.verylarge,
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
                                widget.jobsDetail!.question,
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
                                widget.jobsDetail!.question1,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 7) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (double.parse(widget.jobsDetail!.surface) > 0) ...[
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
                                widget.jobsDetail!.surface,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                          if (int.parse(widget.jobsDetail!.small) > 0)
                            Row(
                              children: <Widget>[
                                Text(
                                  "Small size",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.small,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          if (int.parse(widget.jobsDetail!.medium) > 0)
                            Row(
                              children: <Widget>[
                                Text(
                                  "Medium size ",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.medium,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          if (int.parse(widget.jobsDetail!.large) > 0)
                            Row(
                              children: <Widget>[
                                Text(
                                  "Large size ",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.large,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ],
                            ),
                          if (int.parse(widget.jobsDetail!.verylarge) > 0)
                            Row(
                              children: <Widget>[
                                Text(
                                  "Very large size more than 3 meters",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                                const Spacer(),
                                Text(
                                  widget.jobsDetail!.verylarge,
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
                                widget.jobsDetail!.question,
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
                                widget.jobsDetail!.question1,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],

                if (widget.jobsDetail!.subcategoryId == 9) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                        if (double.parse(widget.jobsDetail!.surface) > 0) ...[
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
                                widget.jobsDetail!.surface,
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
                                widget.jobsDetail!.question,
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
                                widget.jobsDetail!.question1,
                                style: Theme.of(context).textTheme.bodyMedium,
                              ),
                            ],
                          ),
                        ],
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 10 ||
                    widget.jobsDetail!.subcategoryId == 11 ||
                    widget.jobsDetail!.subcategoryId == 12 ||
                    widget.jobsDetail!.subcategoryId == 13) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            widget.jobsDetail!.description,
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
                              widget.jobsDetail!.question,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],

                if (widget.jobsDetail!.subcategoryId == 14) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            widget.jobsDetail!.pickupAddress,
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
                            widget.jobsDetail!.destinationAddress,
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
                              widget.jobsDetail!.surface,
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
                              widget.jobsDetail!.question,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 15 ||
                    widget.jobsDetail!.subcategoryId == 16) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            widget.jobsDetail!.pickupAddress,
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
                            widget.jobsDetail!.destinationAddress,
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
                              widget.jobsDetail!.question,
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
                              widget.jobsDetail!.question1,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 17 ||
                    widget.jobsDetail!.subcategoryId == 18 ||
                    widget.jobsDetail!.subcategoryId == 28 ||
                    widget.jobsDetail!.subcategoryId == 37 ||
                    widget.jobsDetail!.subcategoryId == 38 ||
                    widget.jobsDetail!.subcategoryId == 39 ||
                    widget.jobsDetail!.subcategoryId == 40 ||
                    widget.jobsDetail!.subcategoryId == 41 ||
                    widget.jobsDetail!.subcategoryId == 42 ||
                    widget.jobsDetail!.subcategoryId == 43 ||
                    widget.jobsDetail!.subcategoryId == 44 ||
                    widget.jobsDetail!.subcategoryId == 45) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            widget.jobsDetail!.description,
                            style: Theme.of(context).textTheme.bodyMedium,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Row(
                          children: <Widget>[
                            if (widget.jobsDetail!.subcategoryId == 17 ||
                                widget.jobsDetail!.subcategoryId == 18)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Does the service provider have to come with his own truck?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.subcategoryId == 28 ||
                                widget.jobsDetail!.subcategoryId == 37 ||
                                widget.jobsDetail!.subcategoryId == 38 ||
                                widget.jobsDetail!.subcategoryId == 39 ||
                                widget.jobsDetail!.subcategoryId == 40 ||
                                widget.jobsDetail!.subcategoryId == 41 ||
                                widget.jobsDetail!.subcategoryId == 42 ||
                                widget.jobsDetail!.subcategoryId == 43 ||
                                widget.jobsDetail!.subcategoryId == 44 ||
                                widget.jobsDetail!.subcategoryId == 45)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Request Frequencies",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            const Spacer(),
                            Text(
                              widget.jobsDetail!.question,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],

                if (widget.jobsDetail!.subcategoryId == 19 ||
                    widget.jobsDetail!.subcategoryId == 20 ||
                    widget.jobsDetail!.subcategoryId == 21 ||
                    widget.jobsDetail!.subcategoryId == 22) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            widget.jobsDetail!.pickupAddress,
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
                            widget.jobsDetail!.destinationAddress,
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
                              widget.jobsDetail!.question,
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
                              widget.jobsDetail!.small,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 23) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                              widget.jobsDetail!.surface,
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
                              widget.jobsDetail!.question,
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
                              widget.jobsDetail!.question1,
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
                              widget.jobsDetail!.question2,
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
                              widget.jobsDetail!.question3,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 24 ||
                    widget.jobsDetail!.subcategoryId == 25 ||
                    widget.jobsDetail!.subcategoryId == 27) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            if (widget.jobsDetail!.subcategoryId == 24)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Select the number of clothes",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.subcategoryId == 25)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Vehicle type",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.subcategoryId == 27)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Number of windows",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            const Spacer(),
                            Text(
                              widget.jobsDetail!.question,
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
                              widget.jobsDetail!.question1,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 26) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                              widget.jobsDetail!.surface,
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
                              widget.jobsDetail!.question,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 30 ||
                    widget.jobsDetail!.subcategoryId == 31 ||
                    widget.jobsDetail!.subcategoryId == 32 ||
                    widget.jobsDetail!.subcategoryId == 34) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            if (widget.jobsDetail!.subcategoryId == 30 ||
                                widget.jobsDetail!.subcategoryId == 31 ||
                                widget.jobsDetail!.subcategoryId == 32)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Type of gaurd",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.subcategoryId == 34)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Course duration",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            const Spacer(),
                            Text(
                              widget.jobsDetail!.question,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 33) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            if (widget.jobsDetail!.question == "1")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Free from I escape disk",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "2")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Detection and eradication of viruses and spyware",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "3")
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
                              widget.jobsDetail!.question1,
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
                              widget.jobsDetail!.question2,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 35) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            if (widget.jobsDetail!.question == "1")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Local via USB cable",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "2")
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 36 ||
                    widget.jobsDetail!.subcategoryId == 66 ||
                    widget.jobsDetail!.subcategoryId == 68 ||
                    widget.jobsDetail!.subcategoryId == 69
                ) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            widget.jobsDetail!.description,
                            style: Theme.of(context).textTheme.labelMedium,
                          ).tr(),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],

                if (widget.jobsDetail!.subcategoryId == 46 ||
                    widget.jobsDetail!.subcategoryId == 47 ||
                    widget.jobsDetail!.subcategoryId == 48 ||
                    widget.jobsDetail!.subcategoryId == 49 ||
                    widget.jobsDetail!.subcategoryId == 50 ||
                    widget.jobsDetail!.subcategoryId == 51 ||
                    widget.jobsDetail!.subcategoryId == 52 ||
                    widget.jobsDetail!.subcategoryId == 53 ||
                    widget.jobsDetail!.subcategoryId == 54 ||
                    widget.jobsDetail!.subcategoryId == 55 ||
                    widget.jobsDetail!.subcategoryId == 56 ||
                    widget.jobsDetail!.subcategoryId == 57 ||
                    widget.jobsDetail!.subcategoryId == 58 ||
                    widget.jobsDetail!.subcategoryId == 59 ||
                    widget.jobsDetail!.subcategoryId == 60) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                widget.jobsDetail!.question,
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
                                widget.jobsDetail!.question1,
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
                                widget.jobsDetail!.question2,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 61 ||
                    widget.jobsDetail!.subcategoryId == 65) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            if (widget.jobsDetail!.subcategoryId == 61)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Photo editing?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.subcategoryId == 65)
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
                                widget.jobsDetail!.question,
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
                            if (widget.jobsDetail!.subcategoryId == 61)
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Discount on USB key?",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.subcategoryId == 65)
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
                                widget.jobsDetail!.question1,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 62) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                widget.jobsDetail!.small,
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
                            if (widget.jobsDetail!.question == "1")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Sit-down meal",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "2")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "cocktail buffet",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "3")
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
                                widget.jobsDetail!.question1,
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
                                widget.jobsDetail!.question2,
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
                                widget.jobsDetail!.question3,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 63) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                widget.jobsDetail!.small,
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
                                widget.jobsDetail!.question,
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
                                widget.jobsDetail!.question1,
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
                                widget.jobsDetail!.question2,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 64) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                widget.jobsDetail!.small,
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
                            if (widget.jobsDetail!.question == "1")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Sit-down meal",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "2")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "cocktail buffet",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "3")
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
                                widget.jobsDetail!.question1,
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 67) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                                widget.jobsDetail!.surface,
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
                            if (widget.jobsDetail!.question == "1")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Street marketing",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "2")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Letter box",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "3")
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 70) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            if (widget.jobsDetail!.question == "1")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Drain",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "2")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Tires",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "3")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Braking",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "4")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Windscreen wipers",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "5")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Candles",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "6")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Battery",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "7")
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 71) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            if (widget.jobsDetail!.question == "1")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Engine part",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "2")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Mechanical piece",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "3")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Body",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "4")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Mirror",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "5")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Chest",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "6")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Door",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "7")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Window",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "8")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Lighting",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "9")
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(
                    height: 2,
                    thickness: 10,
                  ),
                ],
                if (widget.jobsDetail!.subcategoryId == 72) ...[
                  Padding(
                    padding: const EdgeInsets.all(20.0),
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
                            if (widget.jobsDetail!.question == "1")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Home appliance",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question == "2")
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
                            if (widget.jobsDetail!.question1 == "1")
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 2,
                                child: Text(
                                  "Mechanical",
                                  style: Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ),
                            if (widget.jobsDetail!.question1 == "2")
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
                    height: MediaQuery.of(context).size.width / 40,
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
                  padding: const EdgeInsets.all(10.0),
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
                            widget.jobsDetail!.jobberRequired.toString(),
                            style: Theme.of(context).textTheme.bodySmall,
                          ).tr(),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 40,),
                      Row(
                        children: [
                          Text(
                            "Service_Time_Start",
                            style: Theme.of(context).textTheme.labelMedium,
                          ).tr(),
                          const Spacer(),
                          Text(
                            widget.jobsDetail!.startTime,
                            style: Theme.of(context).textTheme.bodySmall,
                          ).tr(),
                        ],
                      ),
                      SizedBox(height: MediaQuery.of(context).size.width / 40,),
                      Row(
                        children: [
                          Text(
                            "Rate per Hour",
                            style: Theme.of(context).textTheme.labelMedium,
                          ).tr(),
                          const Spacer(),
                          Text(
                            "${widget.jobsDetail!.hours}€ /h",
                            style: Theme.of(context).textTheme.bodySmall,
                          ).tr(),
                        ],
                      ),
                    ],
                  ),
                ),
                const Divider(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 30,
                ),
                Consumer<EditJobsProvider>(
                  builder: (_, selectTime, child) => CustomButton(
                      onPress: () {
                        debugPrint(selectTime.imageFile0);
                        debugPrint(selectTime.imageFile1);
                        debugPrint(selectTime.imageFile2);
                        debugPrint(
                            "${selectTime.selectedDate.day < 10 ? "0${selectTime.selectedDate.day}" : "${selectTime.selectedDate.day}"}-${selectTime.selectedDate.month < 10 ? "0${selectTime.selectedDate.month}" : "${selectTime.selectedDate.month}"}-${selectTime.selectedDate.year}");
                        debugPrint(selectTime.statusName);


                        selectTime.postEditJob(
                          context,
                          widget.jobsDetail!.id,
                          "${selectTime.selectedDate.day < 10 ? "0${selectTime.selectedDate.day}" : "${selectTime.selectedDate.day}"}-${selectTime.selectedDate.month < 10 ? "0${selectTime.selectedDate.month}" : "${selectTime.selectedDate.month}"}-${selectTime.selectedDate.year}",
                          selectTime.statusName,
                          selectTime.imageFile0,
                          selectTime.imageFile1,
                          selectTime.imageFile2,
                        );
                      },
                      buttonName: "Saved"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
