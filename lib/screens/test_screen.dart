import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/const_provider/const_provider.dart';
import 'package:mister_jobby/widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';
import 'package:provider/provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {

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
            children: [
              const Divider(),
              Text(
                "Next Screen",
                style: Theme.of(context).textTheme.titleSmall,
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "Parquet_Laying_Title",
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Consumer<ConstProvider>(
                builder: (_, rangeSliderData, child) => RangeSliderCLass(
                  rangeValue: rangeSliderData.rangeSliderValue,
                  minRange: 3,
                  maxRange: 60,
                  division: 19,
                  onChanged: ()=> rangeSliderData.rangeSliderFunction,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
