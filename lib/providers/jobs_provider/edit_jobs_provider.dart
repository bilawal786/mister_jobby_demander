import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:mister_jobby/providers/jobs_provider/jobs_in_progress_provider.dart';
import 'package:mister_jobby/screens/home_screens/home_tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';

class EditJobsProvider with ChangeNotifier {

  int status = 1;
  String statusName = "";

  void checkStatusValue(
      BuildContext context,
      int? value,
      ) {
    status = value!;
    if (status == 1) {
      statusName = "00:00";
    } else if (status == 2) {
      statusName = "00:30";
    } else if (status == 3) {
      statusName = "01:00";
    } else if (status == 4) {
      statusName = "01:30";
    } else if (status == 5) {
      statusName = "02:30";
    }
    notifyListeners();
    Navigator.of(context).pop();
  }

  statusPicker(context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height,
            margin: const EdgeInsets.all(10),
            child: Consumer<EditJobsProvider>(
              builder: (_, statusCheck, child) => SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Select Time",
                      style: Theme.of(context).textTheme.titleSmall,
                    ).tr(),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 20,
                    ),
                    RadioListTile(
                      dense: true,
                      value: 1,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "00:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "00:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 3,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "01:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 4,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "01:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 5,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "02:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 6,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "02:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 7,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "03:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 8,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "03:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 9,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "04:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 10,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "04:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 11,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "05:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 12,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "05:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 13,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "06:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 14,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "06:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 15,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "07:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 16,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "07:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 17,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "08:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 18,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "08:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 19,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "09:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 20,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "09:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 21,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "10:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 22,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "10:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 23,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "11:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 24,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "11:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 25,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "12:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 26,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "12:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "13:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "13:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "14:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "14:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "15:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "15:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "16:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "16:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "17:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "17:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "18:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "18:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "19:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "19:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "20:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "20:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "21:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "21:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "22:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "22:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "23:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "23:30",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                    RadioListTile(
                      dense: true,
                      value: 2,
                      groupValue: statusCheck.status,
                      onChanged: (int? v) {
                        statusCheck.checkStatusValue(context, v);
                      },
                      title: Text(
                        "24:00",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ),
                    const Divider(),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
  DateTime selectedDate = DateTime.now();
  Future selectDateProvider(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDate,
        firstDate: DateTime.now(),
        lastDate: DateTime(2111));
    if (picked != null) {
      selectedDate = picked;
      notifyListeners();
    }
  }

  TimeOfDay pickedTime = TimeOfDay.now();
  Future selectTimeProvider(BuildContext context) async {
    final TimeOfDay? response = await showTimePicker(
      context: context,
      initialTime: pickedTime,
      builder: (context, child) => MediaQuery(
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
        child: Container(child: child),
      ),
    );
    if (response != null && response != pickedTime) {
      pickedTime = response;
      notifyListeners();
    }
  }

  Future<void> postEditJob(
      BuildContext context, jobId, serviceDate, startTime) async {
    SharedPreferences sharedPref = await SharedPreferences.getInstance();
    String? userToken = sharedPref.getString('token');
    try {
      var response = await http.post(
        Uri.parse('${MyRoutes.BASEURL}/demandeur/jobrequest/update'),
        headers: <String, String>{
          'Content-Type': 'application/json',
          'Accept': 'application/json',
          'Authorization': 'Bearer $userToken',
        },
        body: jsonEncode(<String, String>{
          'job_id': jobId.toString(),
          'service_date': serviceDate.toString(),
          'start_time': startTime.toString(),
        }),
      );
      if (response.statusCode == 200) {
        debugPrint('update job api is workiing');
        Provider.of<JobsInProgressProvider>(context, listen: false)
            .getInProgressJobs();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyHomeBottomTabScreen(pageIndex: 1),
          ),
        );
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'Update Job Successfully',
              // textAlign: TextAlign.center,
            ),
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
        notifyListeners();
      } else {
        Navigator.of(context).pop();
        print("Failed to update");
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            backgroundColor: Colors.blueGrey,
            content: Text(
              'Incorrect Credentials',
              // textAlign: TextAlign.center,
            ),
            duration: Duration(
              seconds: 2,
            ),
          ),
        );
      }
    } catch (e) {
      debugPrint('error');
    }
  }
}
