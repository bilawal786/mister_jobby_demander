import 'package:flutter/material.dart';

class SendMessageWidget extends StatefulWidget {
  const SendMessageWidget({Key? key}) : super(key: key);

  @override
  State<SendMessageWidget> createState() => _SendMessageWidgetState();
}

class _SendMessageWidgetState extends State<SendMessageWidget> {
  final newMessageController = TextEditingController();
  var enteredMessage = "";
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black,),
              borderRadius: BorderRadius.circular(50),
            ),
            child: TextFormField(
              controller: newMessageController,
              decoration: InputDecoration(
                hintText: 'send a message...',
                border: InputBorder.none,
                contentPadding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 20),
                isDense: true,
                hintStyle: Theme.of(context).textTheme.labelMedium,
              ),
              onChanged: (value) {},
              style: Theme.of(context).textTheme.bodyMedium,
            ),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.send,
            color: Theme.of(context).primaryColor,
          ),
        ),
      ],
    );
  }
}
