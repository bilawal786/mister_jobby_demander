import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../jobs_screens/jobs_screen.dart';
import '../messages_screens/message_screen.dart';
import '../accounts_screens/account_screen.dart';

import './index_screen.dart';

class MyHomeBottomTabScreen extends StatefulWidget {
  const MyHomeBottomTabScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeBottomTabScreen> createState() => _MyHomeBottomTabScreenState();
}

class _MyHomeBottomTabScreenState extends State<MyHomeBottomTabScreen> {
  int pageIndex = 0;
  List<Widget> _tabsOptions = const [
    IndexScreen(),
    JobsScreen(),
    MessagesScreen(),
    AccountsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
          body: _tabsOptions.elementAt(pageIndex),
        bottomNavigationBar: BottomNavigationBar(
          onTap: (newIndex) => setState(() {
            pageIndex = newIndex;
          }),
          currentIndex: pageIndex,
          type: BottomNavigationBarType.fixed,
          selectedItemColor: Colors.black,
          items: <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.home_filled,
              ),
              label: "Index_Page_Label".tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.work_history_outlined,
              ),
              label: "Jobs_Page_Label".tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.message_outlined,
              ),
              label: "Message_Page_Label".tr(),
            ),
            BottomNavigationBarItem(
              icon: const Icon(
                Icons.person_outline,
              ),
              label: "Account_Page_Label".tr(),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {},
          child: const Icon(
            Icons.add,
            size: 30,
            color: Colors.white,
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }
}
