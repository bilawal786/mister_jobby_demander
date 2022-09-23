import 'package:flutter/material.dart';

class CompleteItemWidget extends StatelessWidget {
  const CompleteItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          contentPadding: const EdgeInsets.all(0),
          leading: Container(
            width: MediaQuery.of(context).size.width / 5.5,
            height: MediaQuery.of(context).size.width / 5.5,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black45),
            ),
            child: Image.asset(
              'assets/images/appLogo.png',
              fit: BoxFit.cover,
            ),
          ),
          title: Text(
            'Assembly of IKEA furniture',
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          subtitle: Text(
            'Assembly of IKEA furniture',
            style: Theme.of(context).textTheme.labelMedium,
          ),
          trailing: const Icon(
            Icons.arrow_forward_ios,
            size: 16,
          ),
        ),
        const Divider(),
      ],
    );
  }
}
