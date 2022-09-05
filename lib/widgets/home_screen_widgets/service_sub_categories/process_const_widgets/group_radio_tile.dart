import 'package:flutter/material.dart';

class GroupRadioTile extends StatelessWidget {
  final String title;
  final String subTitle;
  final int value;
  final int groupValue;
  final Function(int? p) onClick;
  const GroupRadioTile({
    Key? key,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.groupValue,
    required this.onClick,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.all(0.0),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyMedium,
      ),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelSmall,
      ),
      trailing: Radio(
        value: value,
        groupValue: groupValue,
        onChanged: onClick,
      ),
    );
  }
}