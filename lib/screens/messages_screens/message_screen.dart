import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';


class MessagesScreen extends StatelessWidget {
  const MessagesScreen({Key? key}) : super(key: key);

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
                    "Chats_AppBar_Title",
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
                          borderRadius: BorderRadius.circular(15)),
                      child: Center(
                        child: const Text(
                          "Chats_TapBar_Title1",
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
                          "Chats_TapBar_Title2",
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
                child: Column(
                  children: [
                    Center(child: const Text("Chats_TapBar_Title1").tr()),
                  ],
                ),
              ),
              SingleChildScrollView(
                child: Column(
                  children: [
                    Center(child: const Text("Chats_TapBar_Title2").tr()),
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
