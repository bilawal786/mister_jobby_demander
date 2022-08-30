import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MujeebConstProvider with ChangeNotifier{
  final picker = ImagePicker();
  File? imageFile;

  imgFromCamera() async {
    XFile? pickedFile =
    await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
      imageFile = File(
        pickedFile!.path,
      );
      notifyListeners();
  }

  imgFromGallery() async {
    XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
      imageFile = File(
        pickedFile!.path,
      );
    notifyListeners();
  }

  void showPicker(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              height: 150,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Text(
                    "Select Preferred Option",
                    style: TextStyle(
                      color: Theme.of(context).primaryColor,
                      fontSize: 17,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  Column(
                    children: [
                      GestureDetector(
                        onTap: () {
                          imgFromCamera();
                          Navigator.of(context).pop();
                        },
                        child: Text(
                          "Open Camera",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      Container(
                        margin: const EdgeInsets.only(top: 5, bottom: 5),
                        height: 2,
                        width: MediaQuery.of(context).size.width * .8,
                        color: Colors.grey,
                      ),
                      GestureDetector(
                        onTap: () {
                          imgFromGallery();
                         Navigator.of(context).pop();
                        },
                        child: Text(
                          "Select From Library",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 17,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(),
                ],
              ),
            ),
          );
        });
  }
}