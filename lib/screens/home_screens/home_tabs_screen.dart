import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import './index_screen.dart';

import '../jobs_screens/jobs_screen.dart';
import '../messages_screens/message_screen.dart';
import '../accounts_screens/account_screen.dart';

import '../../providers/preferences_provider/preferences_provider.dart';
import '../../screens/auth_screens/login_screen.dart';
import '../../screens/home_screens/search_screen.dart';

class MyHomeBottomTabScreen extends StatefulWidget {
   int pageIndex;
   MyHomeBottomTabScreen({Key? key, this.pageIndex = 0,}) : super(key: key);

  @override
  State<MyHomeBottomTabScreen> createState() => _MyHomeBottomTabScreenState();
}

class _MyHomeBottomTabScreenState extends State<MyHomeBottomTabScreen> {


  final PageStorageBucket bucket = PageStorageBucket();
  Widget currentScreen = const IndexScreen();

  @override
  Widget build(BuildContext context) {
    final prefsData = Provider.of<PreferencesProvider>(context, listen: false).token;
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: currentScreen,
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.white,
        shape: const CircularNotchedRectangle(),
        notchMargin: 25,
        child: SizedBox(
          height: 60,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              bottomTabBarItem(
                () {
                  setState(() {
                    widget.pageIndex = 0;
                    if(widget.pageIndex == 0) {
                      currentScreen =
                      const IndexScreen();
                    }// if user taps on this dashboard tab will be active
                  });
                },
                Icons.home_rounded,
                "Index_Page_Label",
                0,
              ),
              bottomTabBarItem(
                () {
                  setState(() {
                    if (prefsData == 'null') {
                      currentScreen = const LoginScreen();
                    } else {
                      widget.pageIndex = 1;
                      if (widget.pageIndex == 1) {
                        currentScreen = const JobsScreen();
                      } // if user taps on this dashboard tab will be active
                    }
                  });
                },
                Icons.work_history_outlined,
                "Jobs_Page_Label",
                1,
              ),
              SizedBox(
                height: 45,
                width: 45,
                child: FloatingActionButton(
                  elevation: 0,
                  onPressed: () {
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const SearchScreen(),
                      ),
                    );
                  },
                  child: const Icon(
                    Icons.add,
                    size: 30,
                    color: Colors.white,
                  ),
                ),
              ),
              bottomTabBarItem(
                () {
                  setState(() {
                    widget.pageIndex = 2;
                    if(widget.pageIndex == 2) {
                      currentScreen =
                      const MessagesScreen();
                    }// if user taps on this dashboard tab will be active
                  });
                },
                Icons.mark_as_unread_outlined,
                "Message_Page_Label",
                2,
              ),
              bottomTabBarItem(
                () {
                  setState(() {
                    widget.pageIndex = 3;
                    if(widget.pageIndex == 3) {
                      currentScreen =
                      const AccountsScreen();
                    }// if user taps on this dashboard tab will be active
                  });
                },
                Icons.person_outline,
                "Account_Page_Label",
                3,
              ),
            ],
          ),
        ),
      ),
      floatingActionButtonLocation:
          FloatingActionButtonLocation.miniCenterDocked,
    );
  }

  Widget bottomTabBarItem(
      VoidCallback onTap, IconData iconData, String title, int index) {
    return Expanded(
      child: MaterialButton(
        minWidth: 40,
        onPressed: onTap,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(
              iconData,
              size: 25,
              color: widget.pageIndex == index
                  ? Colors.black
                  : Theme.of(context).iconTheme.color,
            ),
            Text(
              title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w700,
                overflow: TextOverflow.ellipsis,
                fontFamily: 'Cerebri Sans Regular',
                color: widget.pageIndex == index
                    ? Colors.black
                    : Theme.of(context).iconTheme.color,
              ),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
