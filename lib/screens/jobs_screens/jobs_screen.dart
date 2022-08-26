import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../widgets/const_widgets/custom_button.dart';

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
          body: TabBarView(
            children: [
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Icon(
                        Icons.find_in_page_rounded,
                        size: 150,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "Jobs_TapBar_Page1_Title",
                        style: Theme.of(context).textTheme.titleSmall,
                      ).tr(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Text(
                        "Jobs_TabBar_Page1_Description",
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.center,
                      ).tr(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      CustomButton(
                        onPress: () {},
                        buttonName: "I need a favor",
                        elevation: 8,
                      ),
                    ],
                  ),
                ),
              ),
              SingleChildScrollView(
                child: Container(
                  padding: const EdgeInsets.all(40.0),
                  margin: const EdgeInsets.all(10.0),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 100,
                      ),
                      Icon(
                        Icons.find_in_page_rounded,
                        size: 150,
                        color: Theme.of(context).primaryColor,
                      ),
                      Text(
                        "Jobs_TapBar_Page1_Title",
                        style: Theme.of(context).textTheme.titleSmall,
                      ).tr(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      Text(
                        "Jobs_TabBar_Page1_Description",
                        style: Theme.of(context).textTheme.labelLarge,
                        textAlign: TextAlign.center,
                      ).tr(),
                      SizedBox(
                        height: MediaQuery.of(context).size.height / 40,
                      ),
                      CustomButton(
                        onPress: () {},
                        buttonName: "I need a favor",
                        elevation: 8,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
