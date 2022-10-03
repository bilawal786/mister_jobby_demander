import 'dart:io';

import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../helpers/routes.dart';
import '../../providers/accounts_providers/profile_provider.dart';
import '../../widgets/const_widgets/custom_button.dart';
import '../../widgets/const_widgets/custom_list_tile.dart';
import '../../providers/preferences_provider/preferences_provider.dart';
import '../test_screen.dart';

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
    final profileData = Provider.of<ProfileProvider>(context, listen: false);
    final extractedProfile = profileData.myProfile;
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
                  : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          Consumer<ProfileProvider>(
                            builder: (_, imageFileData, child) => Stack(
                              children: <Widget>[
                                imageFileData.imageFile != null
                                    ? Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5.5,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                5.5,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black38,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          child: Image.file(
                                            File(
                                              imageFileData.imageFile ?? "",
                                            ).absolute,
                                            fit: BoxFit.cover,
                                          ),
                                        ),
                                      )
                                    : Container(
                                        width:
                                            MediaQuery.of(context).size.width /
                                                5.5,
                                        height:
                                            MediaQuery.of(context).size.width /
                                                5.5,
                                        decoration: BoxDecoration(
                                          shape: BoxShape.circle,
                                          border: Border.all(
                                            color: Colors.black38,
                                          ),
                                        ),
                                        child: ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          child: Image.network(
                                              "${MyRoutes.IMAGEURL}/${extractedProfile!.image}"),
                                        ),
                                      ),
                                Positioned(
                                  right: 0,
                                  bottom: 0,
                                  child: InkWell(
                                    onTap: () {
                                      imageFileData.showPicker(
                                        context,
                                      );
                                    },
                                    child: Container(
                                      width: MediaQuery.of(context).size.width /
                                          18.5,
                                      height:
                                          MediaQuery.of(context).size.width /
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
                            width: MediaQuery.of(context).size.width / 40,
                          ),
                          if (extractedProfile != null)
                            Text(
                              '${extractedProfile.firstName} ${extractedProfile.lastName}',
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
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
                                  Navigator.of(context).pushNamed(
                                      MyRoutes.PERSONALINFORMATIONROUTE);
                                },
                              ),
                              CustomListTile(
                                leadingIcon:
                                    Icons.account_balance_wallet_outlined,
                                title: 'My_Balance',
                                onPress: () {
                                  Navigator.of(context)
                                      .pushNamed(MyRoutes.BALANCEROUTE);
                                },
                              ),
                              CustomListTile(
                                leadingIcon: Icons.all_inbox,
                                title: 'My_CESU_Tickets',
                                onPress: () {
                                  Navigator.of(context)
                                      .pushNamed(MyRoutes.MYTICKETSROUTE);
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
                                    Navigator.of(context)
                                        .pushNamed(MyRoutes.GIFTROUTE);
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
                      leadingIcon: Icons.question_answer_outlined,
                      title: 'FAQ',
                      onPress: () {
                        Navigator.of(context)
                            .pushNamed(MyRoutes.FAQSCREENROUTE);
                      },
                    ),
                    CustomListTile(
                      onPress: () {},
                      leadingIcon: Icons.work_outline,
                      title: "Account_Screen_Service_Provider",
                      subTitle: "Account_Screen_Service_Provider_Subtitle",
                    ),
                    CustomListTile(
                      onPress: () {
                        Navigator.of(context)
                            .pushNamed(MyRoutes.HELPCENTERROUTE);
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
                    ),
                    CustomListTile(
                      onPress: () {
                        Navigator.of(context).pushNamed(MyRoutes.ABOUTUSROUTE);
                      },
                      leadingIcon: Icons.info_outline_rounded,
                      title: "About",
                    ),
                    CustomListTile(
                      onPress: () {
                        Navigator.of(context).push(MaterialPageRoute(builder: (ctx) => TestScreen()));
                      },
                      leadingIcon: Icons.info_outline_rounded,
                      title: "Test",
                    ),
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
