import 'package:flutter/material.dart';
import 'package:mister_jobby/widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import 'package:mister_jobby/widgets/home_screen_widgets/service_sub_categories/process_const_widgets/radio_button_class.dart';
import 'package:mister_jobby/widgets/home_screen_widgets/service_sub_categories/process_const_widgets/range_slider_class.dart';
import 'package:mister_jobby/widgets/home_screen_widgets/service_sub_categories/process_const_widgets/rounded_button_class.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  final RangeValues _currentRangeValues = const RangeValues(0, 100);
  double values = 0;
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(
              height: 50,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                RoundedButtonClass(
                  height: 70,
                  onTap: () {
                    setState(() {
                      values++;
                    });
                  },
                ),
                Text(
                  "$values",
                  style: Theme.of(context).textTheme.titleSmall,
                ),
                RoundedButtonClass(
                  icon: Icons.remove,
                  onTap: () {
                    setState(() {
                      if (values <= 0.0) {
                        values = 0;
                      } else {
                        values--;
                      }
                    });
                  },
                  color: values <= 0 ? Colors.grey : Colors.blue,
                ),
              ],
            ),
            SizedBox(
              height: 250,
              child: ListView.builder(
                  itemCount: 4,
                  itemBuilder: (BuildContext context, int index) {
                    return RadioButtonClass(value: index, selectedValue: 0);
                  }),
            ),
            RangeSliderCLass(
                rangeValues: _currentRangeValues, minRange: 0, maxRange: 100),
            OutlinedButton(onPressed: () {}, child:const Text("data")),
            Row(
              children: [
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: () {
                      setState(() {
                        true != false;
                      });
                    },
                    width: MediaQuery.of(context).size.width,
                    border: true,
                    color:Colors.blue.shade50,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: () {},
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
                Expanded(
                  child: OutlineSelectedButton(
                    onTap: () {},
                    width: MediaQuery.of(context).size.width,
                  ),
                ),
              ],
            ),
            // Radio(
            //   value: true,
            //   groupValue: radioListValue,
            //   onChanged: (value) {
            //     setState(() {
            //       radioListValue = value;
            //     });
            //   },
            // ),
            // Radio(
            //   value: false,
            //   groupValue: radioListValue,
            //   onChanged: (value) {
            //     setState(() {
            //       radioListValue = value;
            //     });
            //   },
            // ),
          ],
        ),
      ),
    );
  }
}
