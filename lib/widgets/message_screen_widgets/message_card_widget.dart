import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../helpers/my_date_util.dart';
import '../../models/messages_model.dart';
import '../../providers/accounts_providers/profile_provider.dart';

class MessageCard extends StatefulWidget {
  final Messages message;
  const MessageCard({
    Key? key,
    required this.message,
  }) : super(key: key);

  @override
  State<MessageCard> createState() => _MessageCardState();
}

class _MessageCardState extends State<MessageCard> {
  @override
  Widget build(BuildContext context) {
    final profileData = Provider.of<ProfileProvider>(context, listen: false);
    final extractedProfile = profileData.myProfile;
    return extractedProfile!.demandeurId.toString() == widget.message.fromId ? greenMessage() : blueMessage();
  }

  Widget blueMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * .01),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            decoration: BoxDecoration(
              color: Colors.blue.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomRight: Radius.circular(30),
              ),
              border: Border.all(color: Colors.blue),
            ),
            child: Text(
              widget.message.msg,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
        ),
        Padding(
          padding:
              EdgeInsets.only(right: MediaQuery.of(context).size.width * 0.04),
          child: Text(
            MyDateUtil.getFormattedTime(context: context,time: widget.message.sent),
            style: const TextStyle(
              fontSize: 13,
              color: Colors.black54,
            ),
          ),
        ),
      ],
    );
  }

  Widget greenMessage() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: [
            SizedBox(width: MediaQuery.of(context).size.width * 0.04),
            if(widget.message.read.isNotEmpty)
            const Icon(Icons.done_all, color: Colors.blue,size: 20,),
            const SizedBox(width: 2),
            Text(
              MyDateUtil.getFormattedTime(context: context,time: widget.message.sent),
              style: const TextStyle(
                fontSize: 13,
                color: Colors.black54,
              ),
            ),
          ],
        ),
        Flexible(
          child: Container(
            margin: EdgeInsets.symmetric(
                horizontal: MediaQuery.of(context).size.width * 0.04,
                vertical: MediaQuery.of(context).size.height * .01),
            padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
            decoration: BoxDecoration(
              color: Colors.green.shade200,
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(30),
                topRight: Radius.circular(30),
                bottomLeft: Radius.circular(30),
              ),
              border: Border.all(color: Colors.green),
            ),
            child: Text(
              widget.message.msg,
              style: const TextStyle(
                fontSize: 15,
                color: Colors.black87,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
