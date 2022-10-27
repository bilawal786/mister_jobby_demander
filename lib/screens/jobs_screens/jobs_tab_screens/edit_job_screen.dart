import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mister_jobby/models/jobs_models/jobs_in_progress_model.dart';
import 'package:provider/provider.dart';

import '../../../providers/jobs_provider/edit_jobs_provider.dart';
import '../../../widgets/const_widgets/custom_button.dart';
import '../../../providers/const_provider/const_provider.dart';

class EditJobScreen extends StatefulWidget {
  final JobsInProgressModel? jobModel;
  const EditJobScreen({Key? key, required this.jobModel}) : super(key: key);

  @override
  State<EditJobScreen> createState() => _EditJobScreenState();
}

class _EditJobScreenState extends State<EditJobScreen> {
  @override
  Widget build(BuildContext context) {
    final editJobsData = Provider.of<EditJobsProvider>(context);
    final extractJobs = editJobsData;

    return Scaffold(
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
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
            // Consumer<EditJobsProvider>(
            //   builder: (_, selectTime, child) => GestureDetector(
            //     onTap: () {
            //       selectTime.selectTimeProvider(context);
            //     },
            //     child: Container(
            //       padding: const EdgeInsets.only(left: 30, right: 10),
            //       alignment: Alignment.centerLeft,
            //       width: MediaQuery.of(context).size.width,
            //       height: 45,
            //       decoration: BoxDecoration(
            //         color: Colors.white,
            //         border: Border.all(color: Colors.grey.shade300),
            //         boxShadow: [
            //           BoxShadow(
            //             color: Colors.grey.withOpacity(0.2),
            //             spreadRadius: 0.2,
            //             blurRadius: 1,
            //             offset:
            //                 const Offset(0.5, 1), // changes position of shadow
            //           ),
            //         ],
            //         borderRadius: BorderRadius.circular(7),
            //       ),
            //       child: Text(
            //         "${selectTime.pickedTime.hour < 10 ? "0${selectTime.pickedTime.hour}" : "${selectTime.pickedTime.hour}"} : ${selectTime.pickedTime.minute < 10 ? "0${selectTime.pickedTime.minute}" : "${selectTime.pickedTime.minute}"}",
            //         style: Theme.of(context).textTheme.labelLarge,
            //       ),
            //     ),
            //   ),
            // ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 30,
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
                      Text(
                        checkStatus.statusName,
                        style: Theme.of(context).textTheme.labelLarge,
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
              height: MediaQuery.of(context).size.width / 30,
            ),
            Text(
              "Information",
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
                        "Small piece of furniture to assemble",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Text(
                        "One",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Medium piece of furniture to assemble",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Text(
                        "One",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Large piece of furniture to assemble",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Text(
                        "One",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Extra Large piece of furniture to assemble",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Text(
                        "One",
                        style: Theme.of(context).textTheme.labelMedium,
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
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Text(
                        "One",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                    ],
                  ),
                  Row(
                    children: [
                      Text(
                        "Service_Time_Start",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 30,
                      ),
                      Text(
                        "12:30",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                    ],
                  ),
                  Text(
                    "18 /h",
                    style: Theme.of(context).textTheme.labelMedium,
                  ).tr(),
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
                    debugPrint(
                        "${selectTime.selectedDate.day < 10 ? "0${selectTime.selectedDate.day}" : "${selectTime.selectedDate.day}"}-${selectTime.selectedDate.month < 10 ? "0${selectTime.selectedDate.month}" : "${selectTime.selectedDate.month}"}-${selectTime.selectedDate.year}");
                    debugPrint(
                        "${selectTime.pickedTime.hour < 10 ? "0${selectTime.pickedTime.hour}" : "${selectTime.pickedTime.hour}"} : ${selectTime.pickedTime.minute < 10 ? "0${selectTime.pickedTime.minute}" : "${selectTime.pickedTime.minute}"}");

                    selectTime.postEditJob(
                      context,
                      widget.jobModel!.id,
                      "${selectTime.selectedDate.day < 10 ? "0${selectTime.selectedDate.day}" : "${selectTime.selectedDate.day}"}-${selectTime.selectedDate.month < 10 ? "0${selectTime.selectedDate.month}" : "${selectTime.selectedDate.month}"}-${selectTime.selectedDate.year}",
                      "${selectTime.pickedTime.hour < 10 ? "0${selectTime.pickedTime.hour}" : "${selectTime.pickedTime.hour}"} : ${selectTime.pickedTime.minute < 10 ? "0${selectTime.pickedTime.minute}" : "${selectTime.pickedTime.minute}"}",
                    );
                  },
                  buttonName: "Saved"),
            ),
          ],
        ),
      ),
    );
  }
}
