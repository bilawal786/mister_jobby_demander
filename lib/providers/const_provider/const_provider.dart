import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:http/http.dart' as http;

import '../../helpers/routes.dart';

class ConstProvider with ChangeNotifier {
  int smallSizedFurnitureAmount = 0;
  int mediumSizedFurnitureAmount = 0;
  int largeSizedFurnitureAmount = 0;
  int veryLargeSizedFurnitureAmount = 0;

  int cleanBoxFurniture = 0;
  String cleanBoxTitle = "";

  void cleanBoxFurnitureFunction(int index) {
    cleanBoxFurniture = index + 1;
    if (cleanBoxFurniture == 1) {
      cleanBoxTitle = "Yes";
    } else {
      cleanBoxTitle = "No";
    }
    notifyListeners();
  }

  int baseBoardInstallValue = 0;
  String baseBoardInstallTitle = "";

  void baseBoardInstallFunction(int index) {
    baseBoardInstallValue = index + 1;
    if (baseBoardInstallValue == 1) {
      baseBoardInstallTitle = "Yes";
    } else {
      baseBoardInstallTitle = "No";
    }
    notifyListeners();
  }

  int cuttingMaterialValue = 0;
  String cuttingMaterialTitle = "";

  void cuttingMaterialFunction(int index) {
    cuttingMaterialValue = index + 1;
    if (cuttingMaterialValue == 1) {
      cuttingMaterialTitle = "Yes";
    } else {
      cuttingMaterialTitle = "No";
    }
    notifyListeners();
  }

  int jobberOwnMoverValue = 0;
  String jobberOwnMoverTitle = "";

  void jobberOwnMoverFunction(int index) {
    jobberOwnMoverValue = index + 1;
    if (jobberOwnMoverValue == 1) {
      jobberOwnMoverTitle = "Yes";
    } else {
      jobberOwnMoverTitle = "No";
    }
    notifyListeners();
  }

  int jobberRemoveWasteValue = 0;
  String jobberRemoveWasteTitle = "";

  void jobberRemoveWasteFunction(int index) {
    jobberRemoveWasteValue = index + 1;
    if (jobberRemoveWasteValue == 1) {
      jobberRemoveWasteTitle = "Yes";
    } else {
      jobberRemoveWasteTitle = "No";
    }
    notifyListeners();
  }

  int jobberHedgeTimerValue = 0;
  String jobberHedgeTimerTitle = "";

  void jobberHedgeTimerFunction(int index) {
    jobberHedgeTimerValue = index + 1;
    if (jobberHedgeTimerValue == 1) {
      jobberHedgeTimerTitle = "Yes";
    } else {
      jobberHedgeTimerTitle = "No";
    }
    notifyListeners();
  }

  int jobberBringMaterialValue = 0;
  String jobberBringMaterialTitle = "";

  void jobberBringMaterialFunction(int index) {
    jobberBringMaterialValue = index + 1;
    if (jobberBringMaterialValue == 1) {
      jobberBringMaterialTitle = "Yes";
    } else {
      jobberBringMaterialTitle = "No";
    }
    notifyListeners();
  }

  int photoEditingValue = 0;
  String photoEditingTitle = "";

  void photoEditingFunction(int index) {
    photoEditingValue = index + 1;
    if (photoEditingValue == 1) {
      photoEditingTitle = "Yes";
    } else {
      photoEditingTitle = "No";
    }
    notifyListeners();
  }

  int discountValue = 0;
  String discountTitle = "";

  void discountFunction(int index) {
    discountValue = index + 1;
    if (discountValue == 1) {
      discountTitle = "Yes";
    } else {
      discountTitle = "No";
    }
    notifyListeners();
  }

  void smallFurnitureAmountIncrement() {
    smallSizedFurnitureAmount += 1;
    notifyListeners();
  }

  void smallFurnitureAmountDecrement() {
    if (smallSizedFurnitureAmount >= 1) {
      smallSizedFurnitureAmount -= 1;
    }
    notifyListeners();
  }

  void mediumFurnitureAmountIncrement() {
    mediumSizedFurnitureAmount += 1;
    notifyListeners();
  }

  void mediumFurnitureAmountDecrement() {
    if (mediumSizedFurnitureAmount >= 1) {
      mediumSizedFurnitureAmount -= 1;
    }
    notifyListeners();
  }

  void largeFurnitureAmountIncrement() {
    largeSizedFurnitureAmount += 1;
    notifyListeners();
  }

  void largeFurnitureAmountDecrement() {
    if (largeSizedFurnitureAmount >= 1) {
      largeSizedFurnitureAmount -= 1;
    }
    notifyListeners();
  }

  void veryLargeFurnitureAmountIncrement() {
    veryLargeSizedFurnitureAmount += 1;
    notifyListeners();
  }

  void veryLargeFurnitureAmountDecrement() {
    if (veryLargeSizedFurnitureAmount >= 1) {
      veryLargeSizedFurnitureAmount -= 1;
    }
    notifyListeners();
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
        data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: false),
        child: Container(child: child),
      ),
    );
    if (response != null && response != pickedTime) {
      pickedTime = response;
      notifyListeners();
    }
  }

  double duration = 0.0;

  void durationIncrement() {
    duration += 0.5;
    notifyListeners();
  }

  void durationDecrement() {
    if (duration >= 0.5) {
      duration -= 0.5;
    }
    notifyListeners();
  }

  int hourlyRate = 0;

  void hourlyRateIncrement() {
    hourlyRate += 1;
    notifyListeners();
  }

  void hourlyRateDecrement() {
    if (hourlyRate >= 1) {
      hourlyRate -= 1;
    }
    notifyListeners();
  }

  bool checkUrgentJob = false;
  void checkUrgentJobFunction() {
    checkUrgentJob = !checkUrgentJob;
    notifyListeners();
  }

  int fixesAmount = 0;

  void fixesAmountIncrement() {
    fixesAmount += 1;
    notifyListeners();
  }

  void fixesAmountDecrement() {
    if (fixesAmount >= 1) {
      fixesAmount -= 1;
    }
    notifyListeners();
  }

  int tvHangNo = 0;

  void tvHangFunction(int index) {
    tvHangNo = index + 1;
    notifyListeners();
  }

  int automationEquipmentsNo = 0;

  void automationEquipmentsFunction(int index) {
    automationEquipmentsNo = index + 1;
    notifyListeners();
  }

  int automationCameraNo = 0;

  void automationCameraFunction(int index) {
    automationCameraNo = index + 1;
    notifyListeners();
  }

  int electricalOutletsAmount = 0;

  void electricalOutletsAmountIncrement() {
    electricalOutletsAmount += 1;
    notifyListeners();
  }

  void electricalOutletsDecrement() {
    if (electricalOutletsAmount >= 1) {
      electricalOutletsAmount -= 1;
    }
    notifyListeners();
  }

  int bulbInstallationAmount = 0;

  void bulbInstallationAmountIncrement() {
    bulbInstallationAmount += 1;
    notifyListeners();
  }

  void bulbInstallationDecrement() {
    if (bulbInstallationAmount >= 1) {
      bulbInstallationAmount -= 1;
    }
    notifyListeners();
  }

  int lampInstallationAmount = 0;

  void lampInstallationAmountIncrement() {
    lampInstallationAmount += 1;
    notifyListeners();
  }

  void lampInstallationDecrement() {
    if (lampInstallationAmount >= 1) {
      lampInstallationAmount -= 1;
    }
    notifyListeners();
  }

  int showerAmount = 0;

  void showerAmountIncrement() {
    showerAmount += 1;
    notifyListeners();
  }

  void showerAmountDecrement() {
    if (showerAmount >= 1) {
      showerAmount -= 1;
    }
    notifyListeners();
  }

  int acAmount = 0;

  void acAmountIncrement() {
    acAmount += 1;
    notifyListeners();
  }

  void acAmountDecrement() {
    if (acAmount >= 1) {
      acAmount -= 1;
    }
    notifyListeners();
  }

  int pictureAmount = 0;

  void pictureAmountIncrement() {
    pictureAmount += 1;
    notifyListeners();
  }

  void pictureAmountDecrement() {
    if (pictureAmount >= 1) {
      pictureAmount -= 1;
    }
    notifyListeners();
  }

  int mirrorAmount = 0;

  void mirrorAmountIncrement() {
    mirrorAmount += 1;
    notifyListeners();
  }

  void mirrorAmountDecrement() {
    if (mirrorAmount >= 1) {
      mirrorAmount -= 1;
    }
    notifyListeners();
  }

  String needWork = '';

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

  imgFromCamera(int index) async {
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

  imgFromGallery(int index) async {
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
                    imgFromCamera(index);
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
                    imgFromGallery(index);
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
  double surface = 0;
  double surfaceInstallationSliderValue = 0;

  surfaceInstallationSliderFunction(double newValue) {
    surfaceInstallationSliderValue = newValue;
    notifyListeners();
  }

  double liningInstallationSliderValue = 3;

  liningInstallationSliderFunction(double newValue) {
    liningInstallationSliderValue = newValue;
    notifyListeners();
  }

  double areaToMowSliderValue = 250;

  areaToMowSliderFunction(double newValue) {
    areaToMowSliderValue = newValue;
    notifyListeners();
  }

  int frequencyTrueValue = 0;
  String frequencyTitle = "";

  void frequencyFunction(int index) {
    frequencyTrueValue = index + 1;
    if (frequencyTrueValue == 1) {
      frequencyTitle = "Just this once";
    } else if (frequencyTrueValue == 2) {
      frequencyTitle = "Twice a month";
    } else if (frequencyTrueValue == 3) {
      frequencyTitle = "Once a week";
    } else if (frequencyTrueValue == 4) {
      frequencyTitle = "Several time a week";
    }
    notifyListeners();
  }

  int animalGuardTrueValue = 0;
  String animalGuardTitle = "";

  void animalThingsFunction(int index) {
    animalGuardTrueValue = index + 1;
    if (animalGuardTrueValue == 1) {
      animalGuardTitle = "At the jobber";
    } else if (animalGuardTrueValue == 2) {
      animalGuardTitle = "At the master";
    } else if (animalGuardTrueValue == 3) {
      animalGuardTitle = "Visits";
    }
    notifyListeners();
  }

  int courseHourTrueValue = 0;
  String courseHourTitle = "";

  void courseHourFunction(int index) {
    courseHourTrueValue = index + 1;
    if (courseHourTrueValue == 1) {
      courseHourTitle = "1 hour";
    } else if (courseHourTrueValue == 2) {
      courseHourTitle = "2 hour";
    } else if (courseHourTrueValue == 3) {
      courseHourTitle = "3 hour";
    } else if (courseHourTrueValue == 4) {
      courseHourTitle = "4 hour";
    } else if (courseHourTrueValue == 5) {
      courseHourTitle = "5 hour";
    } else if (courseHourTrueValue == 6) {
      courseHourTitle = "6 hour";
    } else if (courseHourTrueValue == 7) {
      courseHourTitle = "7 hour";
    } else if (courseHourTrueValue == 8) {
      courseHourTitle = "8 hour";
    }
    notifyListeners();
  }

  String completeAddress = "";
  double longitude = 0;
  double latitude = 0;

  getAddress(address, long, lat) {
    completeAddress = address;
    longitude = long;
    latitude = lat;
    notifyListeners();
  }

  double numberOfTreesSliderValue = 1;

  numberOfTreesSliderFunction(double newValue) {
    numberOfTreesSliderValue = newValue;
    notifyListeners();
  }

  double areaToClearSliderValue = 350;

  areaToClearSliderFunction(double newValue) {
    areaToClearSliderValue = newValue;
    notifyListeners();
  }

  double surfaceCleanSliderValue = 35;

  surfaceCleanSliderFunction(double newValue) {
    surfaceCleanSliderValue = newValue;
    notifyListeners();
  }

  double areaOfMoveSliderValue = 25;

  areaOfMoveSliderFunction(double newValue) {
    areaOfMoveSliderValue = newValue;
    notifyListeners();
  }

  bool checkApplianceCleaning = false;
  void checkApplianceCleaningFunction() {
    checkApplianceCleaning = !checkApplianceCleaning;
    notifyListeners();
  }

  bool checkWindowCleaning = false;
  void checkWindowCleaningFunction() {
    checkWindowCleaning = !checkWindowCleaning;
    notifyListeners();
  }

  bool checkIroning = false;
  void checkIroningFunction() {
    checkIroning = !checkIroning;
    notifyListeners();
  }

  int numberOfClotheTrueValue = 0;

  void numberOfClotheFunction(int index) {
    numberOfClotheTrueValue = index + 1;
    notifyListeners();
  }

  int vehicleTypeTrueValue = 0;

  void vehicleTypeFunction(int index) {
    vehicleTypeTrueValue = index + 1;
    notifyListeners();
  }

  String workDetails = "";
  String postalCode = "";
  String pickupAddress = "";
  String destinationAddress = "";
  int groupValue = 1;

  void checkGroupValue(int? value) {
    groupValue = value!;
    print(groupValue);
    notifyListeners();
  }

  int childCareValue = 0;
  String genderDropDownValue = "";

  genderDropDownFunction(value) {
    genderDropDownValue = value!;
    notifyListeners();
  }

  String countryDropDownValue = "";

  countryDropDownFunction(value) {
    genderDropDownValue = value!;
    notifyListeners();
  }

  void childCareIncrement() {
    childCareValue += 1;
    notifyListeners();
  }

  DateTime selectedDateOfBirth = DateTime.now();
  Future selectDateDateOfBirthProvider(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateOfBirth,
        firstDate: DateTime(1990),
        lastDate: DateTime.now());
    if (picked != null) {
      selectedDateOfBirth = picked;
      notifyListeners();
    }
  }

  void childCareDecrement() {
    childCareValue -= 1;
    notifyListeners();
  }

  bool checkInstallingValue = false;
  void checkInstallingValueFunction() {
    checkInstallingValue = !checkInstallingValue;
    notifyListeners();
  }

  bool checkDataBackUpValue = false;
  void checkDataBackUpValueFunction() {
    checkDataBackUpValue = !checkDataBackUpValue;
    notifyListeners();
  }

  int educationLevelTrueValue = 0;

  void educationLevelFunction(int index) {
    educationLevelTrueValue = index + 1;
    notifyListeners();
  }

  int courseFormatTrueValue = 0;

  void courseFormatFunction(int index) {
    courseFormatTrueValue = index + 1;
    notifyListeners();
  }

  double numberOfFlyersSliderValue = 100;

  numberOfFlyersSliderFunction(double newValue) {
    numberOfFlyersSliderValue = newValue;
    notifyListeners();
  }

  int repairGroupValue = 1;

  void checkRepairGroupValue(int? value) {
    repairGroupValue = value!;
    print(repairGroupValue);
    notifyListeners();
  }

  double estimateBudge = 0.0;

  void calculateBudget() {
    estimateBudge = duration * hourlyRate;
    notifyListeners();
  }

  double adminCost = 0.0;
  void calculateAdminCost() {
    adminCost = (estimateBudge * 10) / 100;
    notifyListeners();
  }

  double totalCost = 0.0;
  void totalBudget() {
    totalCost = estimateBudge + adminCost;
    notifyListeners();
  }

  void clearData() {
    courseHourTrueValue = 0;
    courseHourTitle = "";
    animalGuardTrueValue = 0;
    animalGuardTitle = "";
    cleanBoxTitle = "";
    cleanBoxFurniture = 0;
    numberOfFlyersSliderValue = 100;
    discountValue = 0;
    discountTitle = "";
    photoEditingValue = 0;
    photoEditingTitle = "";
    courseFormatTrueValue = 0;
    educationLevelTrueValue = 0;
    checkDataBackUpValue = false;
    checkInstallingValue = false;
    selectedDateOfBirth = DateTime.now();
    childCareValue = 0;
    genderDropDownValue = "";
    selectedDateOfBirth = DateTime.now();
    vehicleTypeTrueValue = 0;
    numberOfClotheTrueValue = 0;
    checkIroning = false;
    checkWindowCleaning = false;
    checkApplianceCleaning = false;
    surfaceCleanSliderValue = 35;
    areaOfMoveSliderValue = 25;
    areaToClearSliderValue = 350;
    workDetails = "";
    postalCode = "";
    pickupAddress = "";
    destinationAddress = "";
    groupValue = 1;
    numberOfTreesSliderValue = 1;
    jobberBringMaterialTitle = "";
    jobberBringMaterialValue = 0;
    jobberHedgeTimerTitle = "";
    jobberHedgeTimerValue = 0;
    frequencyTrueValue = 0;
    frequencyTitle = "";
    jobberRemoveWasteValue = 0;
    jobberRemoveWasteTitle = "";
    jobberOwnMoverTitle = "";
    jobberOwnMoverValue = 0;
    surfaceInstallationSliderValue = 10;
    liningInstallationSliderValue = 3;
    areaToMowSliderValue = 250;
    smallSizedFurnitureAmount = 0;
    mediumSizedFurnitureAmount = 0;
    largeSizedFurnitureAmount = 0;
    veryLargeSizedFurnitureAmount = 0;
    duration = 0.0;
    hourlyRate = 0;
    checkUrgentJob = false;
    fixesAmount = 0;
    tvHangNo = 0;
    automationEquipmentsNo = 0;
    automationCameraNo = 0;
    electricalOutletsAmount = 0;
    bulbInstallationAmount = 0;
    lampInstallationAmount = 0;
    showerAmount = 0;
    acAmount = 0;
    pictureAmount = 0;
    mirrorAmount = 0;
    needWork = '';
    imageFile0 = null;
    imageFile1 = null;
    imageFile2 = null;
    providersAmount = 1;
    baseBoardInstallValue = 0;
    baseBoardInstallTitle = "";
    cuttingMaterialValue = 0;
    cuttingMaterialTitle = "";
    notifyListeners();
  }

  Future<void> postJob(
    String categoryId,
    String subcategoryId,
    String childCategoryId,
    String title,
    String date,
    String time,
    String duration,
    String hour,
    String urgent,
    String jobber,
    String estimatedBudget,
    String address,
    String longitude,
    String latitude,
    String postal,
    String countryId,
    String workDetail,
    String small,
    String medium,
    String large,
    String veryLarge,
    String question,
    String count,
    String workDescription,
    String question1,
    String question2,
    String question3,
    String surface,
    imageUrl,
    imageUrl1,
    imageUrl2,
  ) async {
    // SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // String? userToken = sharedPrefs.getString("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNDdkZDJhNTc2MGI4N2M1YjQ0ZjVkMjEzMmMwZDkxNTcyZDYyMGY2NGNhMjM0ODMzM2JhZGEzYjRkMWJhOWJkOGM3MDIwOTUyMjZkZDcyZmQiLCJpYXQiOjE2NjI2MzM1NTkuNTkzOTg0LCJuYmYiOjE2NjI2MzM1NTkuNTkzOTk0LCJleHAiOjE2OTQxNjk1NTkuNTgyOTg0LCJzdWIiOiIzIiwic2NvcGVzIjpbXX0.lfz3P3dp9lN8WSqqHSCYLYKoIZPyr47PirHueQ3n-7Gk64KkL2oaI5Nhw0Rl6NqKijTbEroiC1lcYraOVWfR_dZYi0wi0TeM45XuivmvoN5vXSZCfgFeTu0Yxd01d5KX3G1oVX53GFnqL9qzNPu9xR24bnpiiaqqh5tox2WLE0FzJlHWG5UT7_Z-9hPOXW4hpEPseVtkOHwzw9O0LLNkzzn1U85AbjKglgX9sbzqIaWl-Pi4L4Ag8K47IS1v8XI6N0htR2qki7Z88CBGcPSxcQk1Jp7m9b83fft7tHX-bXaC1kh8M_tpYur3l_MITxUzKWYnoXworXQfku1TatMjOk8rvKDwVuvql3h4P2biJ_fro_wSnYtXZDrWtLTT_CQr5WUY8iZCb6DkGjU7LlVr24mGhxFO61fHUdhm-a71sbhN35u7_3uwC3FIfGZ7WwyNss9XnB9wCj8tn6o0gQwPNnTkQzJPHTE1mYZavfexeCJuelmXcOe9uJaF0_oQ1ZYKeqsBBJ1o-QvEfzmrZVw6nqndSUtYvIQUWTcAQAaD8fiKjJn2kgn8KwiSJbt5D_b2zaVHpHd1BdvU6ScutwJvgnsrATIzTmtrtHzs4MFUjVoZzXgi_mmCmTKQLlxJenHeb85LJCUXWtKFoa6bsAMiWW1BDIKfOXhUFO38zBBnLG0',
    };

    var request = http.MultipartRequest(
      "POST",
      Uri.parse('${MyRoutes.BASEURL}/jobrequest/submit'),
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
    request.fields['category_id'] = categoryId;
    request.fields['subcategory_id'] = subcategoryId;
    request.fields['childcategory_id'] = childCategoryId;
    request.fields['title'] = title;
    request.fields['small'] = small;
    request.fields['medium'] = medium;
    request.fields['large'] = large;
    request.fields['verylarge'] = veryLarge;
    request.fields['question'] = question;
    request.fields['count'] = count;
    request.fields['description'] = workDescription;
    request.fields['question1'] = question1;
    request.fields['question2'] = question2;
    request.fields['question3'] = question3;
    request.fields['surface'] = surface;

    request.fields['service_date'] = date;
    request.fields['start_time'] = time;
    request.fields['duration'] = duration;
    request.fields['hours'] = hour;
    request.fields['urgent'] = urgent;
    request.fields['jobber'] = jobber;
    request.fields['estimate_budget'] = estimatedBudget;
    request.fields['address'] = address;
    request.fields['longitude'] = longitude;
    request.fields['latitude'] = latitude;
    request.fields['postal'] = postal;
    request.fields['country_id'] = countryId;
    request.fields['detail_description'] = workDetail;

    var response = await request.send();

    if (response.statusCode == 200) {
      print("job Posted successfully ");
    } else {
      print('job Post Failed');
    }
  }
}
