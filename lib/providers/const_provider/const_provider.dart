import 'package:flutter/material.dart';

class ConstProvider with ChangeNotifier {
  int smallSizedFurnitureAmount = 0;

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

}