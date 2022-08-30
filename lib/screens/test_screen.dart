import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/const_provider/mujeeb_const_provider.dart';
import 'package:provider/provider.dart';

import '../providers/const_provider/const_provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  // final RangeValues _currentRangeValues = const RangeValues(0, 100);
  double values = 0;

  @override
  Widget build(BuildContext context) {
    final constProviderData =
        Provider.of<ConstProvider>(context, listen: false);
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
            children: [
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "Information_about_Need_Step2_SubTitle",
                style: Theme.of(context).textTheme.titleMedium,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "Service_Do_You_Want_To_Add_Photos",
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              mainLogo(),
            ],
          ),
        ),
      ),
    );
  }

  Widget mainLogo() {
    return Consumer<MujeebConstProvider>(
      builder: (index, imageFileData, child) => SizedBox(
        child: imageFileData.imageFile != null
            ? Stack(
              children: [
                Container(
                    height: 130,
                    width: 130,
                    decoration: BoxDecoration(
                      color: Colors.grey.shade300,
                      borderRadius: BorderRadius.circular(10)
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.file(
                        File(
                          imageFileData.imageFile ?? "",
                        ).absolute,
                        fit: BoxFit.cover,

                      ),
                    ),
                  ),
                IconButton(onPressed: (){}, icon: Icon(Icons.clear),),
              ],
            )
            : InkWell(
                onTap: () {
                  imageFileData.showPicker(context);
                },
                child: Container(
                  height: 130,
                  width: 130,
                  decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(7),
                    border: Border.all(
                      color: Colors.grey,
                      width: 1,

                    ),
                  ),
                  child: const Icon(Icons.camera_alt),
                ),
              ),
      ),
    );
  }
}
