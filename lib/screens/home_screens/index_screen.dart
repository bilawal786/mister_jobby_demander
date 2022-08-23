import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          children: <Widget>[
            const Text("Services_title", style: TextStyle(
              fontFamily: 'Cerebri Sans Regular',
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),).tr(),
          ],
        ),
      )
    );
  }
}
