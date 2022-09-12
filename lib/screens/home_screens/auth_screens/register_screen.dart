import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({Key? key}) : super(key: key);

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Register_Screen_Title",
                    style: Theme.of(context).textTheme.titleLarge,
                  ).tr(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 30,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Login_Screen_SubTitle",
                    style: Theme.of(context).textTheme.titleSmall,
                  ).tr(),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              TextFormField(
                style: Theme.of(context).textTheme.labelMedium,
                decoration: InputDecoration(
                  labelText: 'Login_Screen_Text1'.tr(),
                  contentPadding: EdgeInsets.fromLTRB(10, 10, 10, 15),
                  hintStyle: Theme.of(context).textTheme.labelMedium,
                  hintText: 'jean@dupond.fr',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(12.0),
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              OutlineSelectedButton(
                onTap: () {},
                textTitle: "Login_Screen_Button".tr(),
                color: Colors.blue.shade400,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
