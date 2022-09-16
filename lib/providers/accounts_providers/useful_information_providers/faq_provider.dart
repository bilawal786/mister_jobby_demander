import 'package:flutter/material.dart';

class FAQProvider with ChangeNotifier{
  List<int> expansion = [];

 void expansionFunction(index){
    if (expansion.contains(index)) {
      expansion.remove(index);
    } else {
      expansion.add(index);
    }
    notifyListeners();
  }

}