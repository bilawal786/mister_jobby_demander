import 'package:flutter/material.dart';

import '../../widgets/message_screen_widgets/message_bubble.dart';
import '../../widgets/message_screen_widgets/send_message_widget.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
        title: Row(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                color: Colors.red,
                borderRadius: BorderRadius.circular(20),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: Image.network("https://cdn-res.keymedia.com/cms/images/us/026/0222_637049384911763251.JPG", fit: BoxFit.cover,),
              ),
            ),
            SizedBox(
              width: MediaQuery.of(context).size.width / 40,
            ),
            Text(
              "Jobber Name",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: <Widget>[
            Expanded(
              child: ListView.builder(
                reverse: true,
                itemCount: 15,
                itemBuilder: (ctx, index) => const MessageBubble(
                  message: "Some Text here ........................ Some Text here .........................",
                  isMe: false,
                  key: ValueKey("1"),
                ),
              ),
            ),
            const SendMessageWidget(),
          ],
        ),
      ),
    );
  }
}
