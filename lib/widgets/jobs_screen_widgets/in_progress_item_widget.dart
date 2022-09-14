import 'package:flutter/material.dart';

import '../const_widgets/custom_button.dart';

class InProgressItemWidget extends StatelessWidget {
  const InProgressItemWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(5.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.width / 2.8,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.0),
              color: Colors.black12,
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10.0),
              child: Image.asset(
                'assets/images/appLogo.png',
                fit: BoxFit.cover,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Text(
            'Job Title Here',
            style: Theme.of(context).textTheme.titleSmall,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 80,
          ),
          Text(
            'Job subTitle Here',
            style: Theme.of(context).textTheme.labelSmall,
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          Container(
            padding: const EdgeInsets.all(10.0),
            decoration: BoxDecoration(
              color: Colors.blueGrey.shade100,
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Row(
                  children: <Widget>[
                    Icon(
                      Icons.notifications_outlined,
                      size: 15,
                      color: Theme.of(context).primaryColor,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Text(
                      "You have received 1 offer",
                      style: TextStyle(
                        fontFamily: 'Cerebri Sans Bold',
                        color: Theme.of(context).primaryColor,
                        fontSize: 12,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                Row(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.width / 8,
                      decoration:const BoxDecoration(
                        color: Colors.white,
                        shape: BoxShape.circle,
                      ),
                      child: Image.asset('assets/images/appLogo.png', fit: BoxFit.cover,),
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 40,
                    ),
                    Text("+900 ...",style: Theme.of(context).textTheme.labelLarge,),
                  ],
                ),
              ],
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          CustomButton(onPress: () {}, buttonName: "Jobs"),
          SizedBox(
            height: MediaQuery.of(context).size.width / 40,
          ),
          const Divider(),
        ],
      ),
    );
  }
}
