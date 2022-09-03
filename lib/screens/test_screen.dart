import 'package:flutter/material.dart';
import 'package:mister_jobby/widgets/const_widgets/custom_button.dart';
import 'package:provider/provider.dart';

import '../providers/const_provider/const_provider.dart';

class TestScreen extends StatefulWidget {
  const TestScreen({Key? key}) : super(key: key);

  @override
  State<TestScreen> createState() => _TestScreenState();
}

class _TestScreenState extends State<TestScreen> {
  int childValue = 0;
  String _dropDownValue = "";
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
              if (childValue > 0)
                for (int i = 0; i < childValue; ++i)
                  Container(
                    margin: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: [
                            Text(
                              "Boy or Girl",
                              style: Theme.of(context).textTheme.titleMedium,
                            ),
                            const Spacer(),
                            IconButton(
                              onPressed: () {
                                setState(() {
                                  childValue -= 1;
                                });
                              },
                              icon: const Icon(
                                Icons.delete,
                                color: Colors.red,
                              ),
                            ),
                          ],
                        ),
                        Container(
                          height: 40.0,
                          margin: const EdgeInsets.all(5.0),
                          //   height: 40,
                          padding: const EdgeInsets.fromLTRB(20, 10, 0, 10),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.black, width: 1),
                            borderRadius: BorderRadius.circular(5.0),
                          ),
                          child: DropdownButtonFormField<String>(
                            decoration: InputDecoration(
                              hintText: "Select Gender",
                              hintStyle: Theme.of(context).textTheme.bodyMedium,
                              isCollapsed: true,
                              enabledBorder: InputBorder.none,
                              focusedBorder: InputBorder.none,
                            ),
                            isExpanded: true,
                            iconSize: 30.0,
                            items: [
                              'Boy',
                              'Girl',
                            ].map(
                              (val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: Text(
                                    val,
                                    style:
                                        Theme.of(context).textTheme.bodySmall,
                                  ),
                                );
                              },
                            ).toList(),
                            onChanged: (val) {
                              setState(() {
                                _dropDownValue = val!;
                              });
                            },
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Text(
                          "Date of Birth",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        Consumer<ConstProvider>(
                          builder: (_, selectDate, child) => GestureDetector(
                            onTap: () {
                              selectDate.selectDateProvider(context);
                            },
                            child: Container(
                              padding: const EdgeInsets.only(left: 30, right: 10),
                              margin: const EdgeInsets.all(8),
                              alignment: Alignment.centerLeft,
                              width: MediaQuery.of(context).size.width,
                              height: 45,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.2),
                                    spreadRadius: 0.2,
                                    blurRadius: 1,
                                    offset: const Offset(
                                        0.5, 1), // changes position of shadow
                                  ),
                                ],
                                border: Border.all(color: Colors.grey.shade300),
                                borderRadius: BorderRadius.circular(7),
                              ),
                              child: Text(
                                "${selectDate.selectedDate.day < 10 ? "0${selectDate.selectedDate.day}" : "${selectDate.selectedDate.day}"}-${selectDate.selectedDate.month < 10 ? "0${selectDate.selectedDate.month}" : "${selectDate.selectedDate.month}"}-${selectDate.selectedDate.year}",
                                style: Theme.of(context).textTheme.labelLarge,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
              CustomButton(
                onPress: () {
                  setState(() {
                    childValue += 1;
                  });
                },
                buttonName: "Add a child",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
