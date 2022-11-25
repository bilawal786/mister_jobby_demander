import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';
import '../../providers/notification_provider/notification_provider.dart';

class NotificationDisplay extends StatefulWidget {
  const NotificationDisplay({Key? key}) : super(key: key);

  @override
  State<NotificationDisplay> createState() => _NotificationDisplayState();
}

class _NotificationDisplayState extends State<NotificationDisplay> {
  var _isInit = true;

  @override
  void didChangeDependencies() {
    if(_isInit){
      Provider.of<NotificationProvider>(context, listen: true).getNotification();
    }
    _isInit = false;
    super.didChangeDependencies();
  }


  @override
  Widget build(BuildContext context) {
    final notificationsData = Provider.of<NotificationProvider>(context, listen: false);
    final extractNotification = notificationsData.notificationItems;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Notifications".tr(),style: Theme.of(context).textTheme.titleSmall,),
        centerTitle: true,
         iconTheme: Theme.of(context).iconTheme,
      ),
      body: extractNotification == null ? const Center(child: CircularProgressIndicator(),) : Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
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
