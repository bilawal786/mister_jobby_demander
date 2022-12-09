import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../widgets/message_screen_widgets/message_archived_tab.dart';
import '../../widgets/message_screen_widgets/message_in_progress_tab.dart';

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
                  borderRadius: BorderRadius.circular(5), // Creates border
                  color: Colors.blue.shade50,
                ),
                unselectedLabelColor: Colors.grey,
                labelColor: Colors.black,
                labelStyle: Theme.of(context).textTheme.bodySmall,
                tabs: [
                  Tab(
                    child: Center(
                      child: const Text(
                        "Chats_TapBar_Title1",
                      ).tr(),
                    ),
                  ),
                  Tab(
                    child: Center(
                      child: const Text(
                        "Chats_TapBar_Title2",
                      ).tr(),
                    ),
                  ),
                ],
              ),
            ),
          ],
          body: const TabBarView(
            children: [
              MessageInProgressTab(),
              MessageArchivedTab(),
            ],
          ),
        ),
      ),
    );
  }
}
