import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../process_const_widgets/rounded_button.dart';

class StepTile extends StatelessWidget {
  final String tileTitle;
  final String tileSubTitle;
  final VoidCallback onPressSubTract;
  final VoidCallback onPressAdd;
  final int inputValue;
  final Color buttonColorSubTract;
  const StepTile({
    Key? key,
    required this.tileTitle,
    required this.tileSubTitle,
    required this.inputValue,
    required this.onPressSubTract,
    required this.onPressAdd,
    required this.buttonColorSubTract,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.2,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                tileTitle,
                style: Theme.of(context).textTheme.bodyMedium,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                tileSubTitle,
                style: Theme.of(context).textTheme.labelMedium,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
            ],
          ),
        ),
        const Spacer(),
        SizedBox(
          width: MediaQuery.of(context).size.width / 2.8,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              RoundedButton(
                onTap: onPressSubTract,
                icon: Icons.remove,
                color: buttonColorSubTract,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "$inputValue",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              RoundedButton(
                onTap: onPressAdd,
                icon: Icons.add,
                color: Theme.of(context).primaryColor,
              ),
            ],
          ),
        )
      ],
    );
  }
}
