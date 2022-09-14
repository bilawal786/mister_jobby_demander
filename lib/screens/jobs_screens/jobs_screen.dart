import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../screens/jobs_screens/jobs_tab_screens/completed_tab.dart';
import '../../screens/jobs_screens/jobs_tab_screens/in_progress_tab.dart';


class JobsScreen extends StatelessWidget {
  const JobsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              elevation: 0,
              expandedHeight: 110,
              pinned: true,
              floating: true,
              snap: true,
              title: Container(
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 30),
                  child: Text(
                    "Jobs_AppBar_Title",
                    style: Theme.of(context).textTheme.titleLarge,
                  ).tr()),
              centerTitle: false,
              backgroundColor: Colors.white,
              bottom: TabBar(
                padding: const EdgeInsets.only(left: 10, right: 10),
                indicator: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 0.8),
                  borderRadius: BorderRadius.circular(15), // Creates border
                  color: Colors.grey.shade100,
                ),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                labelStyle: Theme.of(context).textTheme.bodySmall,
                tabs: [
                  Tab(
                    child: Container(
                      margin: const EdgeInsets.only(top: 3),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                        color: Colors.grey.shade100,
                        borderRadius: BorderRadius.circular(15),
                      ),
                      child: Center(
                        child: const Text(
                          "Jobs_TapBar_Title1",
                        ).tr(),
                      ),
                    ),
                  ),
                  Tab(
                    child: Container(
                      margin: const EdgeInsets.only(top: 3),
                      width: double.infinity,
                      height: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.grey.shade100,
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: const Text(
                          "Jobs_TapBar_Title2",
                        ).tr(),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: <Widget>[
               InProgressTab(),
               CompletedTab(),
            ],
          ),
        ),
      ),
    );
  }
}
