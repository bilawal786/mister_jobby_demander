import 'package:flutter/material.dart';

class ConstProvider with ChangeNotifier {
  int smallSizedFurnitureAmount = 0;
  int mediumSizedFurnitureAmount = 0;
  int largeSizedFurnitureAmount = 0;
  int veryLargeSizedFurnitureAmount = 0;

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

}