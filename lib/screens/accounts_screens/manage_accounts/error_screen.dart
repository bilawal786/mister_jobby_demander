import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(15.0),
            child: Container(
              margin: const EdgeInsets.all(0),
              padding: const EdgeInsets.all(0),
              width: double.infinity,
              height: 200,
              decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                border: Border.all(color: Colors.grey.shade300),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    width: double.infinity,
                    height: 60,
                    decoration: BoxDecoration(borderRadius: BorderRadius.circular(0),
                      color: Colors.grey.shade100,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.only(top: 20,left: 20),
                      child: Text('404 error', style: Theme.of(context).textTheme.titleMedium,
                        ).tr(),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 30, left: 20,right: 10),
                    child: Text('Error_Text2', style: Theme.of(context).textTheme.labelLarge,
                      textAlign: TextAlign.center,).tr(),
                  ),
                ],),
            ),
          ),
        ],
      ),
    );
  }
}
