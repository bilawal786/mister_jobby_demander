import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../helpers/routes.dart';
import '../../widgets/const_widgets/custom_button.dart';
import '../../widgets/const_widgets/custom_list_tile.dart';
import '../../providers/preferences_provider/preferences_provider.dart';

class AccountsScreen extends StatefulWidget {
  const AccountsScreen({Key? key}) : super(key: key);

  @override
  State<AccountsScreen> createState() => _AccountsScreenState();
}

class _AccountsScreenState extends State<AccountsScreen> {
  var isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<PreferencesProvider>(context, listen: false).checkToken();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final prefData = Provider.of<PreferencesProvider>(context, listen: false);
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              prefData.token == 'null'
                  ? Container(
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
                            onPress: () {
                              Navigator.of(context)
                                  .pushNamed(MyRoutes.REGISTERROUTE);
                            },
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
                                onTap: () {
                                  Navigator.of(context)
                                      .pushNamed(MyRoutes.LOGINROUTE);
                                },
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
                    )
                  : Container(
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(5.0),
                      child: Row(
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
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 30,
                          ),
                          Column(
                            children: <Widget>[
                              Text(
                                "User Name",
                                style: Theme.of(context).textTheme.titleMedium,
                              ),
                              Text(
                                "job Post Status",
                                style: Theme.of(context).textTheme.labelSmall,
                              ),
                            ],
                          )
                        ],
                      ),
                    ),
              const Divider(
                thickness: 10,
              ),
              prefData.token == 'null'
                  ? const SizedBox()
                  : Column(
                      children: [
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Manage_account",
                                style: Theme.of(context).textTheme.labelLarge,
                              ).tr(),
                              CustomListTile(
                                leadingIcon: Icons.person_outline,
                                title: 'Personal_Information',
                                onPress: () {
                                  Navigator.of(context).pushNamed(MyRoutes.PERSONALINFORMATIONROUTE);
                                },
                              ),
                              CustomListTile(
                                leadingIcon:
                                    Icons.account_balance_wallet_outlined,
                                title: 'My_Balance',
                                onPress: () {
                                  Navigator.of(context).pushNamed(MyRoutes.BALANCEROUTE);
                                },
                              ),
                              CustomListTile(
                                leadingIcon: Icons.all_inbox,
                                title: 'My_CESU_Tickets',
                                onPress: () {
                                  Navigator.of(context).pushNamed(MyRoutes.MYTICKETSROUTE);
                                },
                              ),
                              CustomListTile(
                                leadingIcon: Icons.verified_outlined,
                                title: 'Tax_Certificates',
                                onPress: () {},
                              ),
                              CustomListTile(
                                  onPress: () {},
                                  leadingIcon:
                                      Icons.notification_important_outlined,
                                  title: 'Manage_My_Notifications'),
                            ],
                          ),
                        ),
                        const Divider(),
                        Container(
                          margin: const EdgeInsets.all(5.0),
                          padding: const EdgeInsets.all(10.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Products",
                                style: Theme.of(context).textTheme.labelLarge,
                              ).tr(),
                              CustomListTile(
                                  onPress: () {
                                    Navigator.of(context).pushNamed(MyRoutes.GIFTROUTE);
                                  },
                                  leadingIcon: Icons.card_giftcard_outlined,
                                  title: 'Gift_Cards'),
                              const Divider(),
                            ],
                          ),
                        ),
                      ],
                    ),
              Container(
                margin: const EdgeInsets.all(5.0),
                padding: const EdgeInsets.all(10.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Useful_Information",
                      style: Theme.of(context).textTheme.labelLarge,
                    ).tr(),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.work_outline,
                      title: "Account_Screen_Service_Provider",
                      subTitle: "Account_Screen_Service_Provider_Subtitle",
                    ),
                    CustomListTile(
                      onPress: () {
                        Navigator.of(context).pushNamed(MyRoutes.HELPCENTERROUTE);
                      },
                      leadingIcon: Icons.question_mark_rounded,
                      title: "Account_Screen_Help_Center",
                    ),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.handshake_outlined,
                      title: "Account_Screen_Insurance",
                    ),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.security_outlined,
                      title: "Account_Screen_Trust_security",
                    ),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.percent_outlined,
                      title: "Account_Screen_Tax_Credit",
                    ),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.fact_check_outlined,
                      title: "Account_Screen_Terms_conditions",
                    )
                  ],
                ),
              ),
              const Divider(),
              prefData.token == 'null'
                  ? const SizedBox()
                  : Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: CustomButton(
                          onPress: () {
                            prefData.logOut(context);
                          },
                          buttonName: "Logout"),
                    ),
            ],
          ),
        ),
      ),
    );
  }
}
