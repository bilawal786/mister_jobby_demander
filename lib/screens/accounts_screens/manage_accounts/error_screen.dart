import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Text('404 error', style: Theme.of(context).textTheme.titleMedium,
            textAlign: TextAlign.center,).tr(),
          ),
          Center(
            child: Text('Error_Text2', style: Theme.of(context).textTheme.labelLarge,
            textAlign: TextAlign.center,).tr(),
          ),
        ],
      ),
    );
  }
}
