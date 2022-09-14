import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/widgets/const_widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../../../providers/const_provider/const_provider.dart';
import '../../../providers/country_provider/country_list_provider.dart';
import '../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController addressController = TextEditingController();


  void formSubmit() {
    var isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
  }
  @override
  Widget build(BuildContext context) {
    final countryData = Provider.of<CountryProvider>(context, listen: false);
    final extractCountry = countryData.countryList;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(15),
          child:  Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children:<Widget> [
                Text(
                  "Personal_Information",
                  style: Theme.of(context).textTheme.titleMedium,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ConstProvider>(
                  builder: (_,imageFileData,child)=>
                   Stack(
                    children: <Widget>[
                      imageFileData.imageFile0 != null? Container(
                        width: MediaQuery.of(context).size.width / 5.5,
                        height: MediaQuery.of(context).size.width / 5.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black38,
                          ),
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(100),
                          child: Image.file(
                            File(
                              imageFileData.imageFile0 ?? "",
                            ).absolute,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ):Container(
                        width: MediaQuery.of(context).size.width / 5.5,
                        height: MediaQuery.of(context).size.width / 5.5,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          border: Border.all(
                            color: Colors.black38,
                          ),
                        ),
                        child:ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset("assets/images/appLogo.png"),
                        ),
                      ),
                      Positioned(
                        right: 0,
                        bottom: 0,
                        child: InkWell(
                          onTap: () {
                            imageFileData.showPicker(context, 0);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width /
                                18.5,
                            height: MediaQuery.of(context).size.width /
                                18.5,
                            padding: const EdgeInsets.all(3.0),
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Theme.of(context).primaryColor,
                              ),
                              shape: BoxShape.circle,
                              color: Theme.of(context).primaryColor,
                            ),
                            child: const Icon(
                              Icons.camera_alt_outlined,
                              size: 15,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: firstNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "First_Name".tr(),
                    isDense: true,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter First Name";
                    }
                    return null;
                  },
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: lastNameController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Last_Name".tr(),
                    isDense: true,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Last Name";
                    }
                    return null;
                  },
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
                  initialValue: "EmailText".tr(),
                  readOnly: true,
                  decoration: InputDecoration(
                  enabled: false,
                    border: const OutlineInputBorder(),
                    labelText: "EmailText".tr(),
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
                Consumer<ConstProvider>(
                  builder: (_, genderData, child) => SizedBox(height:45,child: ListView.builder(
                    itemCount: 2,
                    itemExtent: MediaQuery.of(context).size.width / 2.25,
                    physics:const NeverScrollableScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (BuildContext context,int index)=> OutlineSelectedButton(
                      onTap: ()=>genderData.genderCheckFunction(index),
                      textTitle: index == 0?"Male":"Female",
                      color:genderData.genderCheck-1 == index ?Colors.blue.shade50: Colors.grey.shade300,
                      border: genderData.genderCheck-1 == index ? true : false,
                    ),
                  ),),
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
                Consumer<ConstProvider>(
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: phoneNumberController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Phone_Number".tr(),
                    isDense: true,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Phone Number";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "PasswordText",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: passwordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "PasswordText".tr(),
                    isDense: true,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter New Password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "Password_Confirm_Text",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: confirmPasswordController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Password_Confirm_Text".tr(),
                    isDense: true,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Confirm Password";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),

                Text(
                  "Country_Title",
                  style: Theme.of(context).textTheme.labelLarge,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ConstProvider>(
                  builder: (_,dropDownData,child)=>
                      Container(
                        height: 50.0,
                        padding: const EdgeInsets.fromLTRB(20, 12, 20, 10),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: Colors.grey, width: 1),
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: DropdownButtonFormField<String>(
                          decoration: InputDecoration(
                            hintText: "Select Country",
                            hintStyle: Theme.of(context).textTheme.bodyMedium,
                            isCollapsed: true,
                            enabledBorder: InputBorder.none,
                            focusedBorder: InputBorder.none,
                          ),
                          isExpanded: true,
                          iconSize: 30.0,
                          items:extractCountry?.map(
                                (val) {
                              return DropdownMenuItem<String>(
                                value: val.id.toString(),
                                child: Text(
                                  val.name,
                                  style:
                                  Theme.of(context).textTheme.bodySmall,
                                ),
                              );
                            },
                          ).toList(),
                          onChanged: (val) {
                            dropDownData.countryDropDownFunction(val);
                            // print("drop down value ${dropDownData.countryDropDownValue}");
                          },
                        ),
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
                TextFormField(
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  controller: addressController,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    labelText: "Address_Title".tr(),
                    isDense: true,
                  ),
                  style: Theme.of(context).textTheme.bodySmall,
                  enabled: true,
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Please Enter Address";
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                CustomButton(onPress: (){
                  formSubmit();
                }, buttonName: "Saved"),
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
