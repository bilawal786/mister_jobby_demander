import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../providers/accounts_providers/profile_provider.dart';
import '../../providers/auth_provider/forget_password_provider.dart';
import '../../widgets/const_widgets/custom_button.dart';

class ConfirmPassword extends StatefulWidget {
  const ConfirmPassword({Key? key,}) : super(key: key);
  @override
  State<ConfirmPassword> createState() => _ConfirmPasswordState();
}
class _ConfirmPasswordState extends State<ConfirmPassword> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  RegExp regExp = RegExp(
      r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$',
      multiLine: false);
  String getEmail = '';
  @override
  void dispose() {
    newPasswordController.dispose();
    passwordController.dispose();
    super.dispose();
  }
  void formSubmit() {
    final forgetPasswordData = Provider.of<ForgetPasswordProvider>(context, listen: false);
    var isValid = formKey.currentState!.validate();
    if (!isValid) {
      return;
    }
    formKey.currentState!.save();
    forgetPasswordData.forgetPassword(
      context,
      getEmail,
      newPasswordController.text,
    );
  }
  @override
  Widget build(BuildContext context) {
    final profileData = Provider.of<ProfileProvider>(context, listen: false);
    final extractProfile = profileData.myProfile;
    getEmail = extractProfile!.email;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "New Password",
                  style: Theme.of(context).textTheme.titleSmall,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ForgetPasswordProvider>(
                  builder: (_, toggle, child) => TextFormField(
                    enableSuggestions: false,
                    controller: passwordController,
                    obscureText: toggle.checkObscure,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "New Password".tr(),
                      isDense: true,
                      suffixIcon: GestureDetector(
                        onTap: toggle.toggleObscure,
                        child: Icon(toggle.checkObscure == false
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter the password';
                      } else if (value.length < 5) {
                        return 'Must be more than 5 characters';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Text(
                  "Confirm Password",
                  style: Theme.of(context).textTheme.titleSmall,
                ).tr(),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Consumer<ForgetPasswordProvider>(
                  builder: (_, toggle, child) => TextFormField(
                    enableSuggestions: false,
                    controller: newPasswordController,
                    obscureText: toggle.checkObscure,
                    decoration: InputDecoration(
                      border: const OutlineInputBorder(),
                      labelText: "Confirm Password".tr(),
                      isDense: true,
                      suffixIcon: GestureDetector(
                        onTap: toggle.toggleObscure,
                        child: Icon(toggle.checkObscure == false
                            ? Icons.visibility_off
                            : Icons.visibility),
                      ),
                    ),
                    style: Theme.of(context).textTheme.bodySmall,
                    enabled: true,
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please Enter the password';
                      } else if (value.length < 5) {
                        return 'Must be more than 5 characters';
                      }else if(value != passwordController){
                        return 'Password not matched';
                      }
                      return null;
                    },
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 25,
                ),
                CustomButton(onPress: formSubmit, buttonName: "Continue"),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
