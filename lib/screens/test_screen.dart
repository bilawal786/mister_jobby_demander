import 'package:flutter/material.dart';

import '../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/group_radio_tile.dart';


class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int _gValue = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "Test Screen",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              GroupRadioTile(
                title: 'title here',
                subTitle: 'sub title',
                groupValue: _gValue,
                value: 1,
                onClick: (p) {
                  setState(() {
                    _gValue = p!;
                  });
                  print(_gValue);
                },
              ),
              GroupRadioTile(
                title: 'title here',
                subTitle: 'sub title',
                groupValue: _gValue,
                value: 2,
                onClick: (p) {
                  setState(() {
                    _gValue = p!;
                  });
                  print(_gValue);
                },
              ),
              GroupRadioTile(
                title: 'title here',
                subTitle: 'sub title',
                groupValue: _gValue,
                value: 3,
                onClick: (p) {
                  setState(() {
                    _gValue = p!;
                  });
                  print(_gValue);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
