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

  void cleanBoxFurnitureYesFunction(){
    cleanBoxFurnitureYes = true;
    cleanBoxFurnitureNo = false;
    notifyListeners();
  }
  void cleanBoxFurnitureNoFunction(){
    cleanBoxFurnitureYes = false;
    cleanBoxFurnitureNo = true;
    notifyListeners();
  }

  void smallFurnitureAmountIncrement(){
    smallSizedFurnitureAmount +=1;
    notifyListeners();
  }

   void smallFurnitureAmountDecrement(){
    if(smallSizedFurnitureAmount >= 1) {
      smallSizedFurnitureAmount -= 1;
    }
    notifyListeners();
   }

  void mediumFurnitureAmountIncrement(){
    mediumSizedFurnitureAmount +=1;
    notifyListeners();
  }

  void mediumFurnitureAmountDecrement(){
    if(mediumSizedFurnitureAmount >= 1) {
      mediumSizedFurnitureAmount -= 1;
    }
    notifyListeners();
  }

  void largeFurnitureAmountIncrement(){
    largeSizedFurnitureAmount +=1;
    notifyListeners();
  }

  void largeFurnitureAmountDecrement(){
    if(largeSizedFurnitureAmount >= 1) {
      largeSizedFurnitureAmount -= 1;
    }
    notifyListeners();
  }

  void veryLargeFurnitureAmountIncrement(){
    veryLargeSizedFurnitureAmount +=1;
    notifyListeners();
  }

  void veryLargeFurnitureAmountDecrement(){
    if(veryLargeSizedFurnitureAmount >= 1) {
      veryLargeSizedFurnitureAmount -= 1;
    }
    notifyListeners();
  }

  void clearData(){
     smallSizedFurnitureAmount = 0;
     mediumSizedFurnitureAmount = 0;
     largeSizedFurnitureAmount = 0;
     veryLargeSizedFurnitureAmount = 0;
     cleanBoxFurnitureYes = false;
     cleanBoxFurnitureNo = false;
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

  void durationIncrement(){
    duration +=0.5;
    notifyListeners();
  }

  void durationDecrement(){
    if(duration >= 0.5) {
      duration -= 0.5;
    }
    notifyListeners();
  }

  int hourlyRate = 0;

  void hourlyRateIncrement(){
    hourlyRate +=1;
    notifyListeners();
  }

  void hourlyRateDecrement(){
    if(hourlyRate >= 1) {
      hourlyRate -= 1;
    }
    notifyListeners();
  }

  bool checkUrgentJob =false;
  void checkUrgentJobFunction(){
    checkUrgentJob =! checkUrgentJob;
    notifyListeners();
  }

  int fixesAmount = 0;

  void fixesAmountIncrement(){
    fixesAmount +=1;
    notifyListeners();
  }

  void fixesAmountDecrement(){
    if(fixesAmount >= 1) {
      fixesAmount -= 1;
    }
    notifyListeners();
  }

  int tvHangNo1 = 0;
  int tvHangNo2 = 0;
  int tvHangNo3 = 0;
  int tvHangNo4 = 0;
  int tvHangNo5 = 0;

  void tvHang1() {
     tvHangNo1 = 1;
     tvHangNo2 = 0;
     tvHangNo3 = 0;
     tvHangNo4 = 0;
     tvHangNo5 = 0;
    notifyListeners();
  }
  void tvHang2() {
    tvHangNo1 = 0;
    tvHangNo2 = 2;
    tvHangNo3 = 0;
    tvHangNo4 = 0;
    tvHangNo5 = 0;
    notifyListeners();
  }
  void tvHang3() {
    tvHangNo1 = 0;
    tvHangNo2 = 0;
    tvHangNo3 = 3;
    tvHangNo4 = 0;
    tvHangNo5 = 0;
    notifyListeners();
  }
  void tvHang4() {
    tvHangNo1 = 0;
    tvHangNo2 = 0;
    tvHangNo3 = 0;
    tvHangNo4 = 4;
    tvHangNo5 = 0;
    notifyListeners();
  }
  void tvHang5() {
    tvHangNo1 = 0;
    tvHangNo2 = 0;
    tvHangNo3 = 0;
    tvHangNo4 = 0;
    tvHangNo5 = 5;
    notifyListeners();
  }

  int showerAmount = 0;

  void showerAmountIncrement(){
    showerAmount +=1;
    notifyListeners();
  }

  void showerAmountDecrement(){
    if(showerAmount >= 1) {
      showerAmount -= 1;
    }
    notifyListeners();
  }

  int pictureAmount = 0;

  void pictureAmountIncrement(){
    pictureAmount +=1;
    notifyListeners();
  }

  void pictureAmountDecrement(){
    if(pictureAmount >= 1) {
      pictureAmount -= 1;
    }
    notifyListeners();
  }

  int mirrorAmount = 0;

  void mirrorAmountIncrement(){
    mirrorAmount +=1;
    notifyListeners();
  }

  void mirrorAmountDecrement(){
    if(mirrorAmount >= 1) {
      mirrorAmount -= 1;
    }
    notifyListeners();
  }

  String explainWork = '';

  void getExplainWork(value){
    explainWork = value;
    notifyListeners();
    print(explainWork);
  }

  final picker = ImagePicker();
  String? imageFile0;
  String? imageFile1;
  String? imageFile2;
  CroppedFile? getImage;
  int providersAmount = 1;

  void providerAmountIncrement(){
    providersAmount +=1;
    notifyListeners();
  }

  void providerAmountDecrement(){
    if(providersAmount >= 2) {
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

}