import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class WarrantiesListTiles extends StatelessWidget {
  final VoidCallback onPressed;
  final String title;
  final IconData leadingIcon;
  final String subTitle;
  final IconData trailingIcon;
  const WarrantiesListTiles({
    Key? key,
    required this.onPressed,
    required this.title,
    required this.leadingIcon,
    required this.subTitle,
    required this.trailingIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: () {},
      dense: true,
      contentPadding: const EdgeInsets.all(0.0),
      leading: Container(
        padding: const EdgeInsets.all(10.0),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue.shade50,
        ),
        child: Icon(
          leadingIcon,
          color: Theme.of(context).primaryColor,
        ),
      ),
      title: Text(
        title,
        style: Theme.of(context).textTheme.bodyLarge,
      ).tr(),
      subtitle: Text(
        subTitle,
        style: Theme.of(context).textTheme.labelMedium,
      ).tr(),
      trailing: Icon(
        trailingIcon,
        size: 20,
      ),
    );
  }
}
