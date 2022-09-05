import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:easy_localization/easy_localization.dart';

class ConstProvider with ChangeNotifier {
  int smallSizedFurnitureAmount = 0;
  int mediumSizedFurnitureAmount = 0;
  int largeSizedFurnitureAmount = 0;
  int veryLargeSizedFurnitureAmount = 0;
  bool cleanBoxFurnitureYes = false;
  bool cleanBoxFurnitureNo = false;

  void cleanBoxFurnitureYesFunction() {
    cleanBoxFurnitureYes = true;
    cleanBoxFurnitureNo = false;
    notifyListeners();
  }

  void cleanBoxFurnitureNoFunction() {
    cleanBoxFurnitureYes = false;
    cleanBoxFurnitureNo = true;
    notifyListeners();
  }

  bool baseBoardInstallYes = false;
  bool baseBoardInstallNo = false;

  void baseBoardInstallYesFunction() {
    baseBoardInstallYes = true;
    baseBoardInstallNo = false;
    notifyListeners();
  }

  void baseBoardInstallNoFunction() {
    baseBoardInstallYes = false;
    baseBoardInstallNo = true;
    notifyListeners();
  }

  bool cuttingMaterialYes = false;
  bool cuttingMaterialNo = false;

  void cuttingMaterialYesFunction() {
    cuttingMaterialYes = true;
    cuttingMaterialNo = false;
    notifyListeners();
  }

  void cuttingMaterialNoFunction() {
    cuttingMaterialYes = false;
    cuttingMaterialNo = true;
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

  bool jobberOwnMoverYes = false;
  bool jobberOwnMoverNo = false;

  void jobberOwnMoverYesFunction() {
    jobberOwnMoverYes = true;
    jobberOwnMoverNo = false;
    notifyListeners();
  }

  void jobberOwnMoverNoFunction() {
    jobberOwnMoverYes = false;
    jobberOwnMoverNo = true;
    notifyListeners();
  }

  bool jobberRemoveWasteYes = false;
  bool jobberRemoveWasteNo = false;

  void jobberRemoveWasteYesFunction() {
    jobberRemoveWasteYes = true;
    jobberRemoveWasteNo = false;
    notifyListeners();
  }

  void jobberRemoveWasteNoFunction() {
    jobberRemoveWasteYes = false;
    jobberRemoveWasteNo = true;
    notifyListeners();
  }

  int requestFrequencyTrueValue = 0;

  void requestFrequencyFunction(int index) {
    requestFrequencyTrueValue = index + 1;
    notifyListeners();
  }

  bool jobberHedgeTimerYes = false;
  bool jobberHedgeTimerNo = false;

  void jobberHedgeTimerYesFunction() {
    jobberHedgeTimerYes = true;
    jobberHedgeTimerNo = false;
    notifyListeners();
  }

  void jobberHedgeTimerNoFunction() {
    jobberHedgeTimerYes = false;
    jobberHedgeTimerNo = true;
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

  bool jobberBringMaterialYes = false;
  bool jobberBringMaterialNo = false;

  void jobberBringMaterialYesFunction() {
    jobberBringMaterialYes = true;
    jobberBringMaterialNo = false;
    notifyListeners();
  }

  void jobberBringMaterialNoFunction() {
    jobberBringMaterialYes = false;
    jobberBringMaterialNo = true;
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

  void clearData() {
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
    groupValue = 1;
    numberOfTreesSliderValue = 1;
    jobberBringMaterialYes = false;
    jobberBringMaterialNo = false;
    jobberHedgeTimerYes = false;
    jobberHedgeTimerNo = false;
    requestFrequencyTrueValue = 0;
    jobberRemoveWasteYes = false;
    jobberRemoveWasteNo = false;
    jobberOwnMoverYes = false;
    jobberOwnMoverNo = false;
    surfaceInstallationSliderValue = 10;
    liningInstallationSliderValue = 3;
    areaToMowSliderValue = 250;
    smallSizedFurnitureAmount = 0;
    mediumSizedFurnitureAmount = 0;
    largeSizedFurnitureAmount = 0;
    veryLargeSizedFurnitureAmount = 0;
    cleanBoxFurnitureYes = false;
    cleanBoxFurnitureNo = false;
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
    baseBoardInstallYes = false;
    baseBoardInstallNo = false;
    cuttingMaterialYes = false;
    cuttingMaterialNo = false;
    groupValue = 1;
    notifyListeners();
  }
}
