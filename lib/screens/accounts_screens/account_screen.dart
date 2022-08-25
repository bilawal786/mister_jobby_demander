import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mister_jobby/widgets/const_widgets/custom_button.dart';
import 'package:mister_jobby/widgets/const_widgets/custom_list_tile.dart';

class AccountsScreen extends StatelessWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(10.0),
                margin: const EdgeInsets.all(5.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Account_Screen_Title",
                      style: Theme.of(context).textTheme.titleLarge,
                    ).tr(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 60,
                    ),
                    Text(
                      "Account_Screen_Description",
                      style: Theme.of(context).textTheme.labelLarge,
                    ).tr(),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    CustomButton(
                      onPress: () {},
                      buttonName: "Account_Screen_Register_Button",
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height / 40,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Account_Screen_Already_Have_Account",
                          style: Theme.of(context).textTheme.labelMedium,
                        ).tr(),
                        SizedBox(
                          width: MediaQuery.of(context).size.width / 40,
                        ),
                        GestureDetector(
                          onTap: () {},
                          child: Text(
                            "Account_Screen_Login",
                            style: TextStyle(
                              color: Theme.of(context).primaryColor,
                              fontSize: 16,
                              letterSpacing: 0.8,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                          ).tr(),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const Divider(
                thickness: 10,
              ),
              Container(
                margin: const EdgeInsets.all(10.0),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  children: [
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.work_outline,
                      title: "Account_Screen_Service_Provider",
                      subTitle: "Account_Screen_Service_Provider_Subtitle",
                    ),
                    const Divider(),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.question_mark_rounded,
                      title: "Account_Screen_Help_Center",
                    ),
                    const Divider(),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.handshake_outlined,
                      title: "Account_Screen_Insurance",
                    ),
                    const Divider(),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.security_outlined,
                      title: "Account_Screen_Trust_security",
                    ),
                    const Divider(),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.percent_outlined,
                      title: "Account_Screen_Tax_Credit",
                    ),
                    const Divider(),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.fact_check_outlined,
                      title: "Account_Screen_Terms_conditions",
                    )
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
