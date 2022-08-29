import 'package:flutter/material.dart';

class ConstProvider with ChangeNotifier {
  int smallSizedFurnitureAmount = 0;

  // int get smallSizedFurnitureCount => smallSizedFurnitureAmount;

  void increment(){
    smallSizedFurnitureAmount +=1;
    notifyListeners();
    print(smallSizedFurnitureAmount);
  }

   void decrement(){
    if(smallSizedFurnitureAmount >= 1) {
      smallSizedFurnitureAmount -= 1;
    }
    notifyListeners();
   }

}