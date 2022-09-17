import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class CommentInputWidget extends StatelessWidget {
  const CommentInputWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        children: <Widget>[
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(20.0),
                ),
                labelText: "Comments".tr(),
                isDense: true,
              ),
              style: Theme.of(context).textTheme.bodySmall,
              enabled: true,
            ),
          ),
          IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.send,
              size: 25,
              color: Theme.of(context).primaryColor,
            ),
          ),
        ],
      ),
    );
  }
}
