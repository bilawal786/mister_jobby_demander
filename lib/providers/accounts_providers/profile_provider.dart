import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:mister_jobby/models/accounts_models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/accounts_models/update_profile_model.dart';

class ProfileProvider with ChangeNotifier {
  ProfileModel? myProfile;
  final picker = ImagePicker();
  String? imageFile;
  CroppedFile? getImage;
  int genderCheck = 0;
  String genderCheckTitle = "";
  DateTime selectedDateOfBirth = DateTime.now();
  String countryDropDownValue = "";

  Future<void> getProfile() async {
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? token = sharePref.getString('token');
    var response = await http.get(Uri.parse('${MyRoutes.BASEURL}/get/profile'),
        headers: <String, String>{
          'Accept': "application/json",
          'Content-Type': "application/json",
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      print('get profile successfully');
      myProfile = ProfileModel.fromJson(jsonDecode(response.body));
      getProfileData();
      notifyListeners();
    } else {
      print('profile api not working');
    }
  }

  UpdateProfileModel? updateMyProfile;

  Future<void> upDateProfile(
    BuildContext context,
    firstName,
    lastName,
    gender,
    dob,
    phone,
    password,
    countryId,
    address,
  ) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    String? userToken = prefs.getString('token');
    var response = await http.post(
      Uri.parse('${MyRoutes.BASEURL}/profile/update'),
      headers: <String, String>{
        'Accept': "application/json",
        'Content-Type': "application/json",
        'Authorization': 'Bearer $userToken',
      },
      body: jsonEncode(<String, String>{
        'firstName': firstName.toString(),
        'lastName': lastName.toString(),
        'gender': gender,
        'dob': dob.toString(),
        "phone": phone.toString(),
        'password': password.toString(),
        'country': countryId.toString(),
        'address': address.toString(),
      }),
    );
    if (response.statusCode == 200) {
      updateMyProfile = updateProfileModelFromJson(response.body);
      // Navigator.of(context)
      //     .pushNamedAndRemoveUntil(MyRoutes.SPLASHROUTE, (route) => false);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text(
            'Updated Successfully',
            // textAlign: TextAlign.center,
          ),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
      notifyListeners();
    } else {
      print('Update api is not working');
    }
    print(response.body);
  }

  imgFromCamera() async {
    XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    getImage =
        await ImageCropper().cropImage(sourcePath: pickedFile?.path ?? "");
    imageFile = getImage!.path;
    notifyListeners();
  }

  imgFromGallery() async {
    XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    getImage =
        await ImageCropper().cropImage(sourcePath: pickedFile?.path ?? "");
    imageFile = getImage!.path;
    notifyListeners();
  }

  void showPicker(context) {
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
                    imgFromCamera();
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
                    imgFromGallery();
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

  void genderCheckFunction(int index) {
    genderCheck = index + 1;
    if (genderCheck == 1) {
      genderCheckTitle = "Male".tr();
    } else {
      genderCheckTitle = "Female".tr();
    }
    print(genderCheckTitle);
    notifyListeners();
  }

  Future selectDateDateOfBirthProvider(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
        context: context,
        initialDate: selectedDateOfBirth,
        firstDate: DateTime(1990),
        lastDate: DateTime.now());
    if (picked != null) {
      selectedDateOfBirth = picked;
    }
    notifyListeners();
  }

  void getProfileData() {
    countryDropDownValue = myProfile!.countryId.toString();
    selectedDateOfBirth = DateTime.parse(myProfile!.dob);
    print(selectedDateOfBirth);
    print(DateTime.parse(myProfile!.dob));
    if (myProfile?.gender == "Male".tr()) {
      genderCheck = 1;
    } else {
      genderCheck = 2;
    }
    notifyListeners();
  }

  countryDropDownFunction(value) {
  countryDropDownValue = value;
    notifyListeners();
  }
}
