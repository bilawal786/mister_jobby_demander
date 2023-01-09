
import 'dart:convert';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/accounts_providers/profile_provider.dart';
import 'package:provider/provider.dart';
import 'package:http/http.dart';

import '../../helpers/routes.dart';
import '../../models/accounts_models/profile_model.dart';
import '../../models/messages_model.dart';
import '../../providers/chat_provider.dart';
import '../../widgets/message_screen_widgets/message_card_widget.dart';

class ChatScreen extends StatefulWidget {
  final String jobberId;
  final String jobberName;
  final String jobberImgUrl;
  final String jobberToken;
  const ChatScreen({Key? key, required this.jobberId, required this.jobberName, required this.jobberImgUrl, required this.jobberToken,}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  Messages? msg;
  List<Messages> _list = [];
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final profileData = Provider.of<ProfileProvider>(context, listen: false);
    final extractedData = profileData.myProfile;
    return Scaffold(
      backgroundColor: const Color(0xFFebf9fe),
      appBar: AppBar(
        centerTitle: false,
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        elevation: 0,
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width * 0.1,
              height: MediaQuery.of(context).size.width * 0.1,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                border: Border.all(
                  color: Colors.black,
                  width: 1.2,
                ),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(100),
                child: Image.network("${MyRoutes.IMAGEURL}/${widget.jobberImgUrl}", fit: BoxFit.cover,),
              ),
            ),
            SizedBox(width: MediaQuery.of(context).size.width / 40,),
            Text(
              widget.jobberName,
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        )
      ),
      body: Column(
        children: [
          Expanded(
            child: StreamBuilder(
              stream: getAllMessages(extractedData!),
              builder: (context,AsyncSnapshot<QuerySnapshot> snapshot) {
                switch (snapshot.connectionState) {
                //if data is loading
                  case ConnectionState.waiting:
                  case ConnectionState.none:
                    return const SizedBox();

                //if some or all data is loaded then show it
                  case ConnectionState.active:
                  case ConnectionState.done:
                    final data = snapshot.data?.docs;
                    // print(data.toString());
                    _list = data
                        ?.map((e) => Messages.fromJson(e.data() as Map<String, dynamic>))
                        .toList() ??
                        [];

                    if (_list.isNotEmpty) {
                      return ListView.builder(
                          itemCount: _list.length,
                          padding: EdgeInsets.only(top: MediaQuery.of(context).size.height * .01),
                          physics: const BouncingScrollPhysics(),
                          itemBuilder: (context, index) {
                            return MessageCard(message: _list[index],);
                          });
                    } else {
                      return const Center(
                        child: Text('Say Hii! 👋',
                            style: TextStyle(fontSize: 20, color: Colors.blue)),
                      );
                    }
                }
              },
            ),
          ),
          _chatInput(extractedData.demandeurId.toString())
        ],
      ),
    );
  }
  Widget _chatInput(id,) {
    return Padding(
      padding: EdgeInsets.symmetric(
          vertical: MediaQuery.of(context).size.width * .01,
          horizontal: MediaQuery.of(context).size.width * .025),
      child: Row(
        children: <Widget>[
          Expanded(
            child: Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15)),
              child: Row(
                children: <Widget>[
                  Expanded(
                    child: Padding(
                        padding: const  EdgeInsets.symmetric(horizontal: 10.0),
                        child: TextField(
                          controller: textController,
                          maxLines: null,
                          decoration: InputDecoration(
                            hintText: "Type something ....",
                            hintStyle: Theme.of(context).textTheme.bodyMedium,
                            border: InputBorder.none,
                          ),
                          style: Theme.of(context).textTheme.bodyMedium,
                        ),
                    ),
                  ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     CupertinoIcons.camera,
                  //     color: Colors.blueAccent,
                  //   ),
                  // ),
                  // IconButton(
                  //   onPressed: () {},
                  //   icon: const Icon(
                  //     Icons.image,
                  //     color: Colors.blueAccent,
                  //   ),
                  // ),
                ],
              ),
            ),
          ),
          ElevatedButton(
            onPressed: () {
              final postChatData = Provider.of<ChatProvider>(context,listen: false);
              if(textController.text.isNotEmpty) {
                sendMessage(widget.jobberId, id , textController.text).then((value){
                  sendPushNotification(widget.jobberName, widget.jobberToken, textController.text);
                  textController.text = '';
                },
                );
                if(_list.isEmpty) {
                  postChatData.postChatList(context, widget.jobberId);
                }
              }
            },
            style: ElevatedButton.styleFrom(
              shape: const CircleBorder(),
              minimumSize: const Size(0, 0),
              backgroundColor: Colors.green,
              padding: const EdgeInsets.only(
                  top: 10, bottom: 10, right: 5, left: 10),
            ),
            child: const Icon(
              Icons.send,
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }

  // useful for getting conversation id
  String getConversationID(String demandeurId) => widget.jobberId.hashCode <= demandeurId.hashCode
      ? '${widget.jobberId}_$demandeurId'
      : '${demandeurId}_${widget.jobberId}';

  // for getting all messages of a specific conversation from firestore database
  Stream<QuerySnapshot<Map<String, dynamic>>> getAllMessages(
      ProfileModel id) {
    return FirebaseFirestore.instance
        .collection('chats/${getConversationID(id.demandeurId.toString())}/messages/')
        .snapshots();
  }

  // for sending message
  Future<void> sendMessage(String jobber, String profileId, String msg) async {
    //message sending time (also used as id)
    final time = DateTime.now().millisecondsSinceEpoch.toString();

    //message to send
    final Messages message = Messages(
        toId: jobber.toString(),
        msg: msg,
        read: '',
        fromId: profileId,
        sent: time);

    final ref = FirebaseFirestore.instance
        .collection('chats/${getConversationID(profileId)}/messages/');
    await ref.doc(time).set(message.toJson());
  }

  Future<void> sendPushNotification(
      String name, String pToken,String msg) async {
    try {
      final body = {
        "to": pToken,
        "notification": {
          "title": name, //our name should be send
          "body": msg,
        },
      };

      var res = await post(Uri.parse('https://fcm.googleapis.com/fcm/send'),
          headers: {
            HttpHeaders.contentTypeHeader: 'application/json',
            HttpHeaders.authorizationHeader:
            'key=AAAAWznrMC0:APA91bGmwFHEF2awtLaUTbVbTlDDI4SxOLy5lVTr_HwF1BkWKjJ83Rp9OYO02VJh47LGRDzUolzAsE2jUoHWcShhjRJsq42VyH1N2ZTiKusu-Z63_8O8JRbgF0_9hAbfRcY6Rbz3Psin'
          },
          body: jsonEncode(body));
      debugPrint('Response status: ${res.statusCode}');
      debugPrint('Response body: ${res.body}');
    } catch (e) {
      debugPrint('\nsendPushNotificationE: $e');
    }
  }

}
