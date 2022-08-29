import 'package:flutter/material.dart';

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

}