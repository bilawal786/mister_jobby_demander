import 'package:flutter/material.dart';

class OutlineSelectedButton extends StatelessWidget {
  final double height;
  final double? width;
  final String? text;
  final Function onTap;
  final bool border;
  final Color? color;
  const OutlineSelectedButton({
    required this.onTap,
    this.border =false,
    this.height = 45,
    this.width,
    this.color = Colors.white,
    this.text,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        onTap();
      },
      child: Container(
        margin: EdgeInsets.only(left: 10,right: 10,),
        height: height,
        width: width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border:Border.all(color: border == false? Colors.transparent:Colors.blue),
          color: color,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 4,
              offset: const Offset(2, 5), // changes position of shadow
            ),
          ],
        ),
        child: Center(
          child: Text(
            "Hello World",
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
      ),
    );
  }
}
