import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import '../../providers/notification_provider/notification_provider.dart';

class NotificationDisplay extends StatefulWidget {
  const NotificationDisplay({Key? key}) : super(key: key);

  @override
  State<NotificationDisplay> createState() => _NotificationDisplayState();
}

class _NotificationDisplayState extends State<NotificationDisplay> {
  var _isInit = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    FirebaseMessaging.instance.getInitialMessage().then(
          (message) {
        print("FirebaseMessaging.instance.getInitialMessage");
        if (message != null) {
          print("New Notification");
          // if (message.data['_id'] != null) {
          //   Navigator.of(context).push(
          //     MaterialPageRoute(
          //       builder: (context) => DemoScreen(
          //         id: message.data['_id'],
          //       ),
          //     ),
          //   );
          // }
        }
      },
    );
    FirebaseMessaging.onMessage.listen(
          (message) {
        print("FirebaseMessaging.onMessage.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data11 ${message.data}");
          // LocalNotificationService.display(message);

        }
      },
    );
    FirebaseMessaging.onMessageOpenedApp.listen(
          (message) {
        print("FirebaseMessaging.onMessageOpenedApp.listen");
        if (message.notification != null) {
          print(message.notification!.title);
          print(message.notification!.body);
          print("message.data22 ${message.data['_id']}");
        }
      },
    );

  }
  @override
  void didChangeDependencies() {
    if(_isInit){
      Provider.of<NotificationProvider>(context).getNotification();
    }
    _isInit = false;
    super.didChangeDependencies();
  }


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
      body: extractNotification == null ? Center(child: CircularProgressIndicator(),) : Padding(
        padding: const EdgeInsets.all(15),
        child: RefreshIndicator(
          onRefresh: ()async{
            await Provider.of<NotificationProvider>(context, listen: false).getNotification();
          },
          child: ListView.builder(
            itemCount: extractNotification.length,
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
    );
  }
}
