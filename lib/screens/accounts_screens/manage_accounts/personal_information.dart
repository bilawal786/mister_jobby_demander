import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../helpers/routes.dart';
import '../../../providers/accounts_providers/profile_provider.dart';
import '../../../widgets/const_widgets/custom_button.dart';
import '../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  final formKey = GlobalKey<FormState>();

  void formSubmit(fName,lName,gender,dob,number,address) {
    final updateProfileData = Provider.of<ProfileProvider>(context, listen: false);
    var isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    updateProfileData.upDateProfile(context, fName,lName, gender, dob, number, address);
  }

  @override
  Widget build(BuildContext context) {
    final profileData = Provider.of<ProfileProvider>(context, listen: false);
    final extractProfile = profileData.myProfile;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
      ),
      body: extractProfile == null ? Column(
        children: const <Widget>[
          Center(child: CircularProgressIndicator(),),
        ],
      ): SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Text(
                  "Personal_Information",
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Center(
                  child: Container(
                            width: MediaQuery.of(context).size.width / 4,
                            height: MediaQuery.of(context).size.width / 4,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              border: Border.all(
                                color: Colors.black,
                                width: 1.2,
                              ),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(100),
                              child: Image.network("${MyRoutes.IMAGEURL}/${extractProfile.image}", fit: BoxFit.cover,),
                            ),
                          ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "First_Name",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ProfileProvider>(
                  builder:(_,info,child) => TextFormField(
                    initialValue: info.myProfile!.firstName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      border:  OutlineInputBorder(),
                      isDense: true,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    enabled: true,
                    onChanged: (value){
                      info.getFirstName(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter First Name";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "Last_Name",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ProfileProvider>(
                  builder:(_,info,child) => TextFormField(
                    initialValue: info.myProfile!.lastName,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      isDense: true,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    enabled: true,
                    onChanged: (value){
                      info.getLastName(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Last Name";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "EmailText",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  initialValue: extractProfile.email,
                  readOnly: true,
                  decoration: const InputDecoration(
                    enabled: false,
                    border: OutlineInputBorder(),
                    isDense: true,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Email Address";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "Gender",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ProfileProvider>(
                  builder: (_, genderData, child) => SizedBox(
                    height: 45,
                    child: ListView.builder(
                      itemCount: 2,
                      itemExtent: MediaQuery.of(context).size.width / 2.25,
                      physics: const NeverScrollableScrollPhysics(),
                      scrollDirection: Axis.horizontal,
                      itemBuilder: (BuildContext context, int index) =>
                          OutlineSelectedButton(
                        onTap: () => genderData.genderCheckFunction(index,),
                        textTitle: index == 0 ? "Male" : "Female",
                        color: genderData.genderCheck - 1 == index
                            ? Colors.blue.shade50
                            : Colors.grey.shade300,
                        border:
                            genderData.genderCheck - 1 == index ? true : false,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "Date_Of_Birth",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ProfileProvider>(
                  builder: (_, selectDate, child) => GestureDetector(
                    onTap: () {
                      selectDate.selectDateDateOfBirthProvider(context);
                    },
                    child: Container(
                      padding: const EdgeInsets.only(left: 30, right: 10),
                      alignment: Alignment.centerLeft,
                      width: MediaQuery.of(context).size.width,
                      height: 45,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0.2,
                            blurRadius: 1,
                            offset: const Offset(
                                0.5, 1), // changes position of shadow
                          ),
                        ],
                        border: Border.all(color: Colors.grey.shade300),
                        borderRadius: BorderRadius.circular(7),
                      ),
                      child: Text(
                        "${selectDate.selectedDateOfBirth.day < 10 ? "0${selectDate.selectedDateOfBirth.day}" : "${selectDate.selectedDateOfBirth.day}"}-${selectDate.selectedDateOfBirth.month < 10 ? "0${selectDate.selectedDateOfBirth.month}" : "${selectDate.selectedDateOfBirth.month}"}-${selectDate.selectedDateOfBirth.year}",
                        style: Theme.of(context).textTheme.labelLarge,
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "Phone_Number",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ProfileProvider>(
                  builder: (_,info,child) => TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: extractProfile.phone,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Phone_Number".tr(),
                      isDense: true,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    enabled: true,
                    onChanged: (value){
                      info.getPhoneNumber(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Phone Number";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "Address_Title",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ProfileProvider>(
                  builder: (_,info,child) => TextFormField(
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                    initialValue: extractProfile.address,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Address_Title".tr(),
                      isDense: true,
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    enabled: true,
                    onChanged: (value){
                      info.getAddress(value);
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "Please Enter Address";
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                CustomButton(
                    onPress: () {
                      formSubmit((profileData.firstName == null)? extractProfile.firstName : profileData.firstName , (profileData.lastName == null) ? extractProfile.lastName : profileData.lastName, profileData.genderCheckTitle, profileData.selectedDateOfBirth, (profileData.phoneNumber == null) ? extractProfile.phone : profileData.phoneNumber, (profileData.address == null) ? extractProfile.address : profileData.address );
                    },
                    buttonName: "Saved"),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
