import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../providers/const_provider/const_provider.dart';
import '../../providers/country_provider/country_list_provider.dart';
import '../../widgets/const_widgets/custom_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  void formSubmit() {
    var isValid = formKey.currentState!.validate();
    if (!isValid) {
      print("isNotValid");
    }
    formKey.currentState!.save();
  }
  @override
  Widget build(BuildContext context) {
    final countryData = Provider.of<CountryProvider>(context, listen: false);
    final extractCountry = countryData.countryList;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 5,
              ),
              Padding(
                padding: const EdgeInsets.all(15.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                            left: 10, right: 10, top: 15, bottom: 15),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(7),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 3,
                              blurRadius: 5,
                              offset: const Offset(
                                  1, 2), // changes position of shadow
                            ),
                          ],
                          border: Border.all(
                              color: Theme.of(context).primaryColor, width: .3),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Center(
                              child: Text(
                                "Login_Screen_Title",
                                style: Theme.of(context).textTheme.titleLarge,
                              ).tr(),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 30,
                            ),
                            const Divider(),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 30,
                            ),
                            Form(
                              key: formKey,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "EmailText",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ).tr(),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width / 40,
                                  ),
                                  TextFormField(
                                    autovalidateMode: AutovalidateMode.onUserInteraction,
                                    controller: emailController,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: "EmailText".tr(),
                                      isDense: true,
                                    ),
                                    style: Theme.of(context).textTheme.bodySmall,
                                    enabled: true,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter email";
                                      }
                                      return null;
                                    },
                                    onChanged: (pValue) {
                                      // constProviderData.postalCode = pValue;
                                    },
                                  ),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width / 40,
                                  ),
                                  Text(
                                    "PasswordText",
                                    style: Theme.of(context).textTheme.titleSmall,
                                  ).tr(),
                                  SizedBox(
                                    height: MediaQuery.of(context).size.width / 40,
                                  ),
                                  TextFormField(
                                    // controller: postalCodeController,
                                    decoration: InputDecoration(
                                      border: const OutlineInputBorder(),
                                      labelText: "PasswordText".tr(),
                                      isDense: true,
                                    ),
                                    style: Theme.of(context).textTheme.bodySmall,
                                    enabled: true,
                                    onChanged: (pValue) {
                                      // constProviderData.postalCode = pValue;
                                    },
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 40,
                            ),
                            Text(
                              "Country_Title",
                              style: Theme.of(context).textTheme.titleSmall,
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
                                        print("drop down value ${dropDownData.countryDropDownValue}");
                                      },
                                    ),
                                  ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 25,
                            ),
                            InkWell(
                              onTap: () {},
                              child: Text(
                                "Forgot_Button_Text".tr(),
                                style: TextStyle(
                                  color: Theme.of(context).primaryColor,
                                  fontSize: 12,
                                  fontFamily: 'Cerebri Sans Bold',
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 25,
                            ),
                            CustomButton(
                                onPress: formSubmit, buttonName: "Login_Screen_Title"),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 25,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Already_Account_Title".tr(),
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                InkWell(
                                  onTap: () {},
                                  child: Text(
                                    "Register_Screen_Title".tr(),
                                    style: TextStyle(
                                      color: Theme.of(context).primaryColor,
                                      fontSize: 12,
                                      fontFamily: 'Cerebri Sans Bold',
                                      fontWeight: FontWeight.w500,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.width / 25,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
