import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/const_provider/const_provider.dart';
import '../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../../../widgets/home_screen_widgets/service_sub_categories/process_steps_widgets/places_selected_input_widget.dart';

class PersonalInformation extends StatefulWidget {
  const PersonalInformation({Key? key}) : super(key: key);

  @override
  State<PersonalInformation> createState() => _PersonalInformationState();
}

class _PersonalInformationState extends State<PersonalInformation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
      ),
      body:SingleChildScrollView(
        child: Padding(
          padding:const EdgeInsets.all(15),
          child:  Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children:<Widget> [
              Text(
                "Personal_Information",
                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Stack(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 5.5,
                    height: MediaQuery.of(context).size.width / 5.5,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Colors.black38,
                      ),
                    ),
                    child: Image.asset(
                      'assets/images/appLogo.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                  Positioned(
                    right: 0,
                    bottom: 0,
                    child: InkWell(
                      onTap: () {},
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
                // controller: emailController,
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
                // controller: emailController,
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
                // controller: emailController,
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
                "Phone_Number",
                style: Theme.of(context).textTheme.labelLarge,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // controller: emailController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  labelText: "Phone_Number".tr(),
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
                "PasswordText",
                style: Theme.of(context).textTheme.labelLarge,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              TextFormField(
                autovalidateMode: AutovalidateMode.onUserInteraction,
                // controller: emailController,
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
                // controller: emailController,
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
                "Address_Title",
                style: Theme.of(context).textTheme.labelLarge,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              const GooglePlacesApi(),
            ],
          ),
        ),
      ),
    );
  }
}
