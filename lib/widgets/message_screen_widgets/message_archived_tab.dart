import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../const_widgets/custom_button.dart';

class MessageArchivedTab extends StatelessWidget {
  const MessageArchivedTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        padding: const EdgeInsets.all(40.0),
        margin: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            const SizedBox(
              height: 100,
            ),
            Icon(
              Icons.mark_as_unread_outlined,
              size: 150,
              color: Theme.of(context).primaryColor,
            ),
            Text(
              "Chats_Page_Title",
              style: Theme.of(context).textTheme.titleSmall,
            ).tr(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            Text(
              "Chats_Page_Description",
              style: Theme.of(context).textTheme.labelLarge,
              textAlign: TextAlign.center,
            ).tr(),
            SizedBox(
              height: MediaQuery.of(context).size.height / 40,
            ),
            CustomButton(
              onPress: () {},
              buttonName: "I_need_a_favor",
              elevation: 8,
            ),
          ],
        ),
      ),
    );
  }
}
