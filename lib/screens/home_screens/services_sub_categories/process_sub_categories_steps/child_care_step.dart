import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../../providers/const_provider/const_provider.dart';
import '../../../../widgets/const_widgets/custom_button.dart';

class ChildCareStep extends StatefulWidget {
  const ChildCareStep({Key? key}) : super(key: key);

  @override
  State<ChildCareStep> createState() => _ChildCareStepState();
}

class _ChildCareStepState extends State<ChildCareStep> {
  @override
  Widget build(BuildContext context) {
    final constProviderData =
    Provider.of<ConstProvider>(context,listen: true);
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (constProviderData.childCareValue > 0)
            for (int i = 0; i < constProviderData.childCareValue; ++i)
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
                            constProviderData.childCareDecrement();
                          },
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.red,
                          ),
                        ),
                      ],
                    ),
                    Consumer<ConstProvider>(
                      builder: (_,dropDownData,child)=>
                      Container(
                        height: 40.0,
                        margin: const EdgeInsets.all(5.0),
                        //   height: 40,
                        padding: const EdgeInsets.fromLTRB(20, 7, 0, 10),
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
                           dropDownData.genderDropDownFunction(val);
                           print("drop down value ${dropDownData.genderDropDownValue}");
                          },
                        ),
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
                          selectDate.selectDateDateOfBirthProvider(context);
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
                            "${selectDate.selectedDateOfBirth.day < 10 ? "0${selectDate.selectedDateOfBirth.day}" : "${selectDate.selectedDateOfBirth.day}"}-${selectDate.selectedDateOfBirth.month < 10 ? "0${selectDate.selectedDateOfBirth.month}" : "${selectDate.selectedDateOfBirth.month}"}-${selectDate.selectedDateOfBirth.year}",
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
              constProviderData.childCareIncrement();
            },
            buttonName: "Add_Child",
          ),
        ],
      ),
    );
  }
}
