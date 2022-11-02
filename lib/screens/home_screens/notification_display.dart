import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../providers/notification_provider/notification_provider.dart';

class NotificationDisplay extends StatefulWidget {
  const NotificationDisplay({Key? key}) : super(key: key);

  @override
  State<NotificationDisplay> createState() => _NotificationDisplayState();
}

class _NotificationDisplayState extends State<NotificationDisplay> {
  @override
  Widget build(BuildContext context) {
    final notificationsData = Provider.of<NotificationProvider>(context,);
    final extractNotification = notificationsData.notificationItems;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Notifications".tr(),style: Theme.of(context).textTheme.titleSmall,),
        centerTitle: true,
         iconTheme: Theme.of(context).iconTheme,
      ),
      body: RefreshIndicator(
        onRefresh: ()async{
          Provider.of<NotificationProvider>(context, listen: false).getNotification();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: extractNotification!.length,
              itemBuilder: (ctx, index) => Column(
                children:<Widget> [

                  Container(
                    color: extractNotification[index].status == "1" ? Colors.transparent : Colors.blueGrey.shade50,
                    child: ListTile(
                      title: Row(
                        children: [
                          Icon(extractNotification[index].status == "1"?
                            Icons.notifications_none : Icons.notifications,
                            size: 22,
                          ),
                          Text(
                            extractNotification[index].activity.toString(),
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            extractNotification[index].message.toString(),
                            style: Theme.of(context).textTheme.labelLarge,
                          ),
                          Text(
                            extractNotification[index].createdAt.toString(),
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                  ),
                 const Divider(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
