
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mister_jobby/providers/jobs_provider/jobs_in_progress_provider.dart';
import 'package:mister_jobby/screens/home_screens/home_tabs_screen.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../helpers/routes.dart';
import '../../widgets/home_screen_widgets/login_progress_indicator.dart';

class EditJobsProvider with ChangeNotifier {


  final picker = ImagePicker();
  String? imageFile0;
  String? imageFile1;
  String? imageFile2;
  CroppedFile? getImage;
  int providersAmount = 1;

  void providerAmountIncrement() {
    providersAmount += 1;
    notifyListeners();
  }

  void providerAmountDecrement() {
    if (providersAmount >= 2) {
      providersAmount -= 1;
    }
    notifyListeners();
  }

  imgFromCameraJob(int index) async {
    XFile? pickedFile =
    await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    getImage =
    await ImageCropper().cropImage(sourcePath: pickedFile?.path ?? "");
    if (index == 0) {
      imageFile0 = getImage!.path;
    } else {
      if (index == 1) {
        imageFile1 = getImage!.path;
      } else {
        imageFile2 = getImage!.path;
      }
    }
    notifyListeners();
  }

  imgFromGalleryJob(int index) async {
    XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    getImage =
    await ImageCropper().cropImage(sourcePath: pickedFile?.path ?? "");
    if (index == 0) {
      imageFile0 = getImage!.path;
    } else {
      if (index == 1) {
        imageFile1 = getImage!.path;
      } else {
        imageFile2 = getImage!.path;
      }
    }
    notifyListeners();
  }

  void removeImage(index) {
    if (index == 0) {
      imageFile0 = null;
    } else {
      if (index == 1) {
        imageFile1 = null;
      } else {
        imageFile2 = null;
      }
    }
    notifyListeners();
  }

  void clearEditJobData(){
    imageFile0 = null;
    imageFile1 = null;
    imageFile2 = null;
    selectedDate = DateTime.now();
    statusName = '00:00';
    status = 1;
  }

  void showPicker(context, int index) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext bc) {
        return SafeArea(
          child: Container(
            height: MediaQuery.of(context).size.height / 5,
            margin: const EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Pick_Image_Title",
                  style: Theme.of(context).textTheme.titleSmall,
                ).tr(),
                const Divider(),
                InkWell(
                  onTap: () {
                    imgFromCameraJob(index);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.camera_alt,
                        color: Colors.black,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Pick_Image_From_Camera_Title",
                        style: Theme.of(context).textTheme.bodySmall,
                      ).tr(),
                    ],
                  ),
                ),
                const Divider(),
                InkWell(
                  onTap: () {
                    imgFromGalleryJob(index);
                    Navigator.of(context).pop();
                  },
                  child: Row(
                    children: [
                      const SizedBox(
                        width: 15,
                      ),
                      const Icon(
                        Icons.file_copy,
                        color: Colors.black,
                        size: 25,
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Text(
                        "Pick_Image_From_Gallery_Title",
                        style: Theme.of(context).textTheme.bodySmall,
                      ).tr(),
                    ],
                  ),
                ),
                const Divider(),
              ],
            ),
          ),
        );
      },
    );
  }


  int status = 1;
  String statusName = "00:00";

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
      statusName = "02:00";
    }else if (status == 6) {
      statusName = "02:30";
    } else if (status == 7) {
      statusName = "03:00";
    }else if (status == 8) {
      statusName = "03:30";
    }else if (status == 9) {
      statusName = "04:00";
    }else if (status == 10) {
      statusName = "04:30";
    }else if (status == 11) {
      statusName = "05:00";
    }else if (status == 12) {
      statusName = "05:30";
    }else if (status == 13) {
      statusName = "06:00";
    }else if (status == 14) {
      statusName = "06:30";
    }else if (status == 15) {
      statusName = "07:00";
    }else if (status == 16) {
      statusName = "07:30";
    }else if (status == 17) {
      statusName = "08:00";
    }else if (status == 18) {
      statusName = "08:30";
    }else if (status == 19) {
      statusName = "09:00";
    }else if (status == 20) {
      statusName = "09:30";
    }else if (status == 21) {
      statusName = "10:00";
    }else if (status == 22) {
      statusName = "10:30";
    }else if (status == 23) {
      statusName = "11:00";
    }else if (status == 24) {
      statusName = "11:30";
    }else if (status == 25) {
      statusName = "12:00";
    } else if (status == 26) {
      statusName = "12:30";
    }else if (status == 27) {
      statusName = "13:00";
    } else if (status == 28) {
      statusName = "13:30";
    }else if (status == 29) {
      statusName = "14:00";
    }else if (status == 30) {
      statusName = "14:30";
    }else if (status == 31) {
      statusName = "15:00";
    }else if (status == 32) {
      statusName = "15:30";
    }else if (status == 33) {
      statusName = "16:00";
    }else if (status == 34) {
      statusName = "16:30";
    }else if (status == 35) {
      statusName = "17:00";
    }else if (status == 36) {
      statusName = "17:30";
    }else if (status == 37) {
      statusName = "18:00";
    }else if (status == 38) {
      statusName = "18:30";
    }else if (status == 39) {
      statusName = "19:30";
    }else if (status == 40) {
      statusName = "20:00";
    }else if (status == 41) {
      statusName = "20:30";
    }else if (status == 42) {
      statusName = "21:00";
    }else if (status == 43) {
      statusName = "21:30";
    }else if (status == 44) {
      statusName = "22:00";
    }else if (status == 45) {
      statusName = "22:30";
    }else if (status == 46) {
      statusName = "23:00";
    }else if (status == 47) {
      statusName = "23:30";
    }else if (status == 48) {
      statusName = "24:00";
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
                      value: 27,
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
                      value: 28,
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
                      value: 29,
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
                      value: 30,
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
                      value: 31,
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
                      value: 32,
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
                      value: 33,
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
                      value: 34,
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
                      value: 35,
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
                      value: 36,
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
                      value: 37,
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
                      value: 38,
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
                      value: 39,
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
                      value: 40,
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
                      value: 41,
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
                      value: 42,
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
                      value: 43,
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
                      value: 44,
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
                      value: 45,
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
                      value: 46,
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
                      value: 47,
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
                      value: 47,
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
                      value: 48,
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
      BuildContext context, jobId, serviceDate, startTime,imageUrl,imageUrl1,imageUrl2) async {
    showDialog(context: context, barrierDismissible: false, builder: (BuildContext context){
      return const LoginProgressIndicator();
    });
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? userToken = sharedPrefs.getString("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
      'Bearer $userToken',
    };
    var request = http.MultipartRequest(
      "POST",
      Uri.parse('${MyRoutes.BASEURL}/demandeur/jobrequest/update'),
    );
    request.headers.addAll(headers);
    if (imageUrl != null) {
      request.files.add(await http.MultipartFile.fromPath('image1', imageUrl));
    }
    if (imageUrl1 != null) {
      request.files.add(await http.MultipartFile.fromPath('image2', imageUrl1));
    }
    if (imageUrl2 != null) {
      request.files.add(await http.MultipartFile.fromPath('image3', imageUrl2));
    }
    request.fields['job_id'] = jobId.toString();
    request.fields['service_date'] = serviceDate;
    request.fields['start_time'] = startTime;
    http.Response response = await http.Response.fromStream(await request.send());

      if (response.statusCode == 200) {
        debugPrint('update job api is workiing');
        Navigator.pop(context);
        Provider.of<JobsInProgressProvider>(context, listen: false)
            .getInProgressJobs(context);
        clearEditJobData();
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (context) => MyHomeBottomTabScreen(pageIndex: 1),
          ),
        );
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding :const EdgeInsets.all(20.0),
            backgroundColor: const Color(0xFFebf9fe),
            content: Text(
              'Update Job Successfully',
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
            duration: const Duration(
              seconds: 2,
            ),
          ),
        );
        notifyListeners();
      } else if(response.statusCode == 401){
        debugPrint('error: 401');
        Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.LOGINROUTE, (route) => false);
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            padding :const EdgeInsets.all(20.0),
            backgroundColor: const Color(0xFFebf9fe),
            content: Text(
              'Session Expired...  Please Log-In',
              style: Theme.of(context).textTheme.bodyMedium,
            ).tr(),
            duration: const Duration(
              seconds: 2,
            ),
          ),
        );
      }
      else{
        Navigator.of(context).pushNamed(MyRoutes.ERRORSCREENROUTE);
        Navigator.pop(context);
        Navigator.of(context).pop();
        print("Failed to update");
        ScaffoldMessenger.of(context).hideCurrentSnackBar();
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            margin: const EdgeInsets.all(10.0),
            backgroundColor: const Color(0xFFebf9fe),
            content: const Text(
              'Incorrect Credentials',
              // textAlign: TextAlign.center,
            ).tr(),
            duration: const Duration(
              seconds: 2,
            ),
          ),
        );
      }
  }
}
