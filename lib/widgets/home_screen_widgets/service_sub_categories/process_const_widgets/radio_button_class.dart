import 'package:flutter/material.dart';

class RadioButtonClass extends StatefulWidget {
 final int value;
 late  int selectedValue;
   RadioButtonClass({Key? key,required this.value,required this.selectedValue}) : super(key: key);

  @override
  State<RadioButtonClass> createState() => _RadioButtonClassState();
}

class _RadioButtonClassState extends State<RadioButtonClass> {
  @override
  Widget build(BuildContext context) {
    return Radio(
      value:widget.value,
      groupValue: widget.selectedValue,
      onChanged: (value) {
        setState(() {
          widget.selectedValue = widget.value;
        });
      },
    );
  }
}
