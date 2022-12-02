import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:mister_jobby/models/accounts_models/profile_model.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../models/accounts_models/update_profile_model.dart';
import '../../widgets/home_screen_widgets/login_progress_indicator.dart';

class ProfileProvider with ChangeNotifier {

  String? firstName;
  String? lastName;
  String? phoneNumber;
  String? address;

  getFirstName(value){
    firstName = value;
    notifyListeners();
  }
  getLastName(value){
    lastName = value;
    notifyListeners();
  }
  getPhoneNumber(value){
    phoneNumber = value;
    notifyListeners();
  }
  getAddress(value){
    address = value;
    notifyListeners();
  }

  clearData(){
    firstName = null;
    lastName = null;
    phoneNumber = null;
    address = null;
  }

  ProfileModel? myProfile;
  final picker = ImagePicker();
  String? imageFile;
  CroppedFile? getImage;
  int genderCheck = 0;
  String genderCheckTitle = "";
  DateTime selectedDateOfBirth = DateTime.now();
  String countryDropDownValue = "select country";

  Future<void> getProfile(context) async {
    final SharedPreferences sharePref = await SharedPreferences.getInstance();
    String? token = sharePref.getString('token');
    int? id = sharePref.getInt('demandeurId');
    var response = await http.get(Uri.parse('${MyRoutes.BASEURL}/demandeur/profile/$id'),
        headers: <String, String>{
          'Accept': "application/json",
          'Content-Type': "application/json",
          'Authorization': 'Bearer $token',
        });
    if (response.statusCode == 200) {
      debugPrint('get profile successfully');
      myProfile = ProfileModel.fromJson(jsonDecode(response.body));
      notifyListeners();
    } else if(response.statusCode == 401) {
      debugPrint("Session Expired");
    }
    else{
      Navigator.of(context).pushNamed(MyRoutes.ERRORSCREENROUTE);
      debugPrint('get profile api not working');
    }
  }

  Future<void>updateProfileImage(context, imageUrl)async{
    showDialog(context: context, builder: (BuildContext context){
      return const LoginProgressIndicator();
    });
    SharedPreferences sharedPrefs = await SharedPreferences.getInstance();
    String? userToken = sharedPrefs.getString("token");
    Map<String, String> headers = {
      'Content-Type': 'application/json',
      'Accept': 'application/json',
      'Authorization':
      'Bearer $userToken',
    };
    var request = http.MultipartRequest(
      "POST",
      Uri.parse('${MyRoutes.BASEURL}/profile/image/update'),
    );
    request.headers.addAll(headers);
    if (imageUrl != null) {
      request.files.add(await http.MultipartFile.fromPath('image', imageUrl));
    }
    http.Response response = await http.Response.fromStream(await request.send());

    if (response.statusCode == 200) {
      debugPrint("Profile Image Posted successfully ");
      Provider.of<ProfileProvider>(context, listen: false).getProfile(context);
      Navigator.pop(context);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          backgroundColor: Colors.blueGrey,
          content: Text(
            'Profile Picture Step Completed',
            // textAlign: TextAlign.center,
          ),
          duration: Duration(
            seconds: 2,
          ),
        ),
      );
    }else if(response.statusCode == 401){
      debugPrint('error: 401');
      Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.LOGINROUTE, (route) => false);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding :const EdgeInsets.all(20.0),
          backgroundColor: const Color(0xFFebf9fe),
          content: Text(
            'Session Expired...',
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
    }
    else{
      Navigator.pop(context);
      Navigator.of(context).pushNamed(MyRoutes.ERRORSCREENROUTE);
      debugPrint('profile Image upload Failed');
      // debugPrint(response.body);
    }
    // debugPrint(response.body);
    notifyListeners();
  }


  UpdateProfileModel? updateMyProfile;

  Future<void> upDateProfile(
    BuildContext context,
    firstName,
    lastName,
    gender,
    dob,
    phone,
    address,
  ) async {
    showDialog(context: context, builder: (BuildContext context){
      return const LoginProgressIndicator();
    });
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
        'address': address.toString(),
      }),
    );
    if (response.statusCode == 200) {
      clearData();
      updateMyProfile = updateProfileModelFromJson(response.body);
      Provider.of<ProfileProvider>(context, listen: false).getProfile(context);
      Navigator.of(context).pop();
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding :const EdgeInsets.all(20.0),
          backgroundColor: const Color(0xFFebf9fe),
          content: Text(
            'Updated Successfully',
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
      notifyListeners();
    } else if(response.statusCode == 401){
      debugPrint('error: 401');
      Navigator.of(context).pushNamedAndRemoveUntil(MyRoutes.LOGINROUTE, (route) => false);
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          padding :const EdgeInsets.all(20.0),
          backgroundColor: const Color(0xFFebf9fe),
          content: Text(
            'Session Expired...  Please Log-In',
            style: Theme.of(context).textTheme.bodyMedium,
          ).tr(),
          duration: const Duration(
            seconds: 2,
          ),
        ),
      );
    }
    else{
      Navigator.of(context).pushNamed(MyRoutes.ERRORSCREENROUTE);
      debugPrint('Update api is not working');
    }
    // print(response.body);
  }

  imgFromCamera(context) async {
    XFile? pickedFile =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);
    getImage =
        await ImageCropper().cropImage(sourcePath: pickedFile?.path ?? "");
    imageFile = getImage!.path;
    Provider.of<ProfileProvider>(context, listen: false).updateProfileImage(context, imageFile);
    notifyListeners();
  }

  imgFromGallery(context) async {
    XFile? pickedFile =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);
    getImage =
        await ImageCropper().cropImage(sourcePath: pickedFile?.path ?? "");
    imageFile = getImage!.path;
    Provider.of<ProfileProvider>(context, listen: false).updateProfileImage(context, imageFile);
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
                    imgFromCamera(context);
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
                    imgFromGallery(context);
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
    debugPrint(genderCheckTitle);
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


  countryDropDownFunction(value) {
  countryDropDownValue = value;
    notifyListeners();
  }
}
