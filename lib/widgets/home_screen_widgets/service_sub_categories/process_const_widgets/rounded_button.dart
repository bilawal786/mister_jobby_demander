import 'package:flutter/material.dart';

class RoundedButton extends StatelessWidget {
  final double height;
  final IconData? icon;
  final Function onTap;
  final Color? color;
  const RoundedButton({
    Key? key,
    required this.onTap,
    this.height = 40,
    this.color = Colors.blue,
    this.icon = Icons.add,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        onTap();
      },
      child: Container(
        height:height,
        width:height,
        decoration: BoxDecoration(
          color:color,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.3),
              spreadRadius: 3,
              blurRadius: 4,
              offset:
              const Offset(2, 5), // changes position of shadow
            ),
          ],
                ),
        child: Icon(icon,color: Colors.white,),
      ),
    );
  }
}
