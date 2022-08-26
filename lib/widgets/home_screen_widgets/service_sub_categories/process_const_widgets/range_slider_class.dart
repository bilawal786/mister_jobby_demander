import 'package:flutter/material.dart';

class RangeSliderCLass extends StatefulWidget {
   RangeValues rangeValues;
 final double minRange;
 final double maxRange;
   RangeSliderCLass({Key? key,required this.rangeValues,required this.minRange,required this.maxRange,}) : super(key: key);

  @override
  State<RangeSliderCLass> createState() => _RangeSliderCLassState();
}

class _RangeSliderCLassState extends State<RangeSliderCLass> {
  @override
  Widget build(BuildContext context) {
    return  RangeSlider(
      values: widget.rangeValues,
      min: widget.minRange,
      max: widget.maxRange,
      onChanged: (value) {
        setState(() {
          widget.rangeValues = value;
        });
      },
    );
  }
}
