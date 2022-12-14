import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../models/jobs_models/jobs_completed_model.dart';
import '../../../providers/jobs_provider/edit_jobs_provider.dart';
import '../../../widgets/const_widgets/custom_button.dart';

class EditCompletedJobScreen extends StatefulWidget {
  final JobsCompletedModel? jobsDetail;
  const EditCompletedJobScreen({Key? key, required this.jobsDetail}) : super(key: key);

  @override
  State<EditCompletedJobScreen> createState() => _EditCompletedJobScreenState();
}

class _EditCompletedJobScreenState extends State<EditCompletedJobScreen> {
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
            color: Colors.black,
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
                SizedBox(
                  height: MediaQuery.of(context).size.width / 3,
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
                      buttonName: "Repost"),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
