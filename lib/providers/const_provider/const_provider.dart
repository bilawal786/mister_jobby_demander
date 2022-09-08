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

  double surfaceInstallationSliderValue = 10;

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
    int categoryId,
    int subcategoryId,
    int childCategoryId,
    String title,
    DateTime date,
    TimeOfDay time,
    double duration,
    int hour,
    bool urgent,
    int jobber,
    int estimateBudget,
    String address,
    double longitude,
    double latitude,
    String postal,
    int countryId,
    String workDetail,
    int small,
    int medium,
    int large,
    int veryLarge,
    String question,
    int count,
    String workDescription,
    String question1,
    String question2,
    String question3, double surface,
  ) async {
    // SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    // String? userToken = sharedPrefs.getString("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json; charset=UTF-8',
      'Accept': 'application/json',
      'Authorization':
          'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiMGZmYjRiYmE3YzkyYzk1OGU5Y2E0ZjdiZDAwMjVkMzg3MDM1MDAyNjg2ZjhlZmEzN2NkZTk0MWFmMjMyMWY0NzgzNDYyZDNjYWU5Y2UwOTMiLCJpYXQiOjE2NjI2MTY5MTguMjIxNDY4LCJuYmYiOjE2NjI2MTY5MTguMjIxNDgsImV4cCI6MTY5NDE1MjkxOC4xOTQ2NjUsInN1YiI6IjMiLCJzY29wZXMiOltdfQ.KfG_X8EXsxDTgXeMcyBNwgQobBFFhX9PKOQFc2xhCeF9kkJLf3BVgt-cc7zpNzgliqaBetiJ78ICoqORXsOTi6_P6cCtnsem3W_4shtWVPyk2pFeKAvrWB064_lTQYD3xOAGv5kyTzGq-WjLE4NCk4uiU3T6-apQGifir_cp5DyKkl288ijt1Sr-P1MOw8Y2nV_1xPvuHv30frN604Yo-BipwRFG7hrhszha-A2bH8TMsiBU8g2uuorWnCOVeOqUcSboyODsngx_i2M6YwWd6VZWf2dH-S2QFMsPQ0LoR0VnMPQ-lNSjkD3EaSqoEGa2r4XijqIQPyC9HB_9_jnaawxTbfAHHfgUllVGa5w8FyXrAW4l_34jtEs34kCFv-3ddKtX37KxoDwEmwhBcDFWm3sR4K6ETiA2kkypEInsRSrxLQueM-YGP-JuBc1sSfAxkugMTxBs6Nvk79w6wj7uIS3mMH4D36brnKe4k86hdyElqvUVEhzcL1dfIEjpa-sCZve6ZSyN_e8p2_sxC37qqIQjviL6ttL6_bMpotfbzyjPopuhAQwWcBz_Zq86499xwe0Q9GQ6904Z74NKYvfVhDckJY_ihblkaYdAWPMNi2erCvx0RwjW4pZ_jJzy_kOIDCqd86VPPN-3V4ZrWMw4IgjOvYWRaSTVo6rbDjvFI4w',
    };

    var request = http.MultipartRequest(
      "POST",
      Uri.parse('${MyRoutes.BASEURL}/jobrequest/submit'),
    );
    request.headers.addAll(headers);
    if (imageFile0 != null || imageFile1 != null || imageFile2 != null) {
      request.files
          .add(await http.MultipartFile.fromPath('image1', imageFile0!));
      request.files
          .add(await http.MultipartFile.fromPath('image2', imageFile1!));
      request.files
          .add(await http.MultipartFile.fromPath('image3', imageFile2!));
    }
    request.fields['category_id'] = categoryId as String;
    request.fields['subcategory_id'] = categoryId as String;
    request.fields['category_id'] = categoryId as String;
    request.fields['title'] = title;
    request.fields['small'] = small as String;
    request.fields['medium'] = medium as String;
    request.fields['large'] = large as String;
    request.fields['verylarge'] = veryLarge as String;
    request.fields['question'] = question;
    request.fields['count'] = count as String;
    request.fields['description'] = workDescription;
    request.fields['question1'] = question1;
    request.fields['question2'] = question2;
    request.fields['question3'] = question3;
    request.fields['surface'] = surface as String;

    request.fields['service_date'] = date as String;
    request.fields['start_time'] = time as String;
    request.fields['duration'] = duration as String;
    request.fields['hours'] = hour as String;
    request.fields['urgent'] = urgent as String;
    request.fields['jobber'] = jobber as String;
    request.fields['estimate_budget'] = estimateBudget as String;
    request.fields['address'] = address;
    request.fields['longitude'] = longitude as String;
    request.fields['latitude'] = latitude as String;
    request.fields['postal'] = postal;
    request.fields['country_id'] = countryId as String;
    request.fields['detail_description'] = workDetail;

    await request.send();
  }
}
