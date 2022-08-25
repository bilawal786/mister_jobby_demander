import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class AllProfileVerifiedScreen extends StatelessWidget {
  const AllProfileVerifiedScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              IconButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                icon: const Icon(Icons.arrow_back),
              ),
              const SizedBox(height: 5,),
              Text(
                "All_Profile_Verified_Title",
                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),
              const SizedBox(height: 15,),
              Text(
                "All_Profile_Verified_SubTitle",
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              const SizedBox(height: 15,),
              Text(
                "All_Profile_Verified_Paragraph1",
                style: Theme.of(context).textTheme.displayLarge,
              ).tr(),
              const SizedBox(height: 15,),
              Text(
                "All_Profile_Verified_Paragraph2",
                style: Theme.of(context).textTheme.displayLarge,
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
