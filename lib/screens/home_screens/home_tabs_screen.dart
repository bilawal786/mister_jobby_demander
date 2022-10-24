import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import './index_screen.dart';

import '../jobs_screens/jobs_screen.dart';
import '../messages_screens/message_screen.dart';
import '../accounts_screens/account_screen.dart';

import '../../providers/preferences_provider/preferences_provider.dart';
import '../../screens/home_screens/search_screen.dart';

class MyHomeBottomTabScreen extends StatefulWidget {
  int pageIndex;
  MyHomeBottomTabScreen({
    Key? key,
    this.pageIndex =0,
  }) : super(key: key);

  @override
  State<MyHomeBottomTabScreen> createState() => _MyHomeBottomTabScreenState();
}

class _MyHomeBottomTabScreenState extends State<MyHomeBottomTabScreen> {
  final PageStorageBucket bucket = PageStorageBucket();
  List<Widget> screenWidgets = [
    IndexScreen(),
    JobsScreen(),
    MessagesScreen(),
    AccountsScreen(),
  ];
  // Widget currentScreen = const IndexScreen();
  @override
  Widget build(BuildContext context) {
    final prefsData =
        Provider.of<PreferencesProvider>(context, listen: false).token;
    return Scaffold(
      body: PageStorage(
        bucket: bucket,
        child: screenWidgets.elementAt(widget.pageIndex),
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
                      widget.pageIndex = 3;
                      // currentScreen = const AccountsScreen();
                      ScaffoldMessenger.of(context).hideCurrentSnackBar();
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(
                          backgroundColor: const Color(0xFFebf9fe),
                          content: Text(
                            "Please Login First",
                            style: TextStyle(
                              color: Theme.of(context).errorColor,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'Cerebri Sans Bold',
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                      );
                    } else {
                      widget.pageIndex = 1;
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
                  ? Colors.blue
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
                    ? Colors.blue
                    : Theme.of(context).iconTheme.color,
              ),
            ).tr(),
          ],
        ),
      ),
    );
  }
}
