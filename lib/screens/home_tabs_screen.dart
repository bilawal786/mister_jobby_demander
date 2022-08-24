import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../helpers/routes.dart';

import './home_screens/index_screen.dart';
import './jobs_screens/jobs_screen.dart';
import './messages_screens/message_screen.dart';
import './accounts_screens/account_screen.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  State<MyHomeScreen> createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  int pageIndex = 0;
  List<Widget> _tabsOptions = const [
    IndexScreen(),
    JobsScreen(),
    MessagesScreen(),
    AccountsScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 110,
              pinned: true,
              floating: true,
              snap: true,
              title: Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 30),
                  child: Text(
                    "Home_AppBar_Title",
                    style: Theme.of(context).textTheme.titleLarge,
                  ).tr()),
              backgroundColor: Colors.white,
              bottom: TabBar(
                // padding: const EdgeInsets.all(5.0),
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: GestureDetector(
                      onTap: () =>
                          Navigator.of(context).pushNamed(MyRoutes.SEARCHROUTE),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search_Hint_Text",
                              style: Theme.of(context).textTheme.labelLarge,
                            ).tr(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: _tabsOptions.elementAt(pageIndex),
        ),
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
      ),
    );
  }
}
