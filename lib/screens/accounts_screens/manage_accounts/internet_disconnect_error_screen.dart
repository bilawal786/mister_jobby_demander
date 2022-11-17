import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class InternetDisconnectScreen extends StatelessWidget {
  const InternetDisconnectScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(height: MediaQuery.of(context).size.width / 3,),
          Center(
              child: const Text('Internet_Error', style: TextStyle(
            fontSize: 18,
            color: Colors.black54,
            fontWeight: FontWeight.w700,
            fontFamily: 'Cerebri Sans Bold',
          ),
          textAlign: TextAlign.center,
          ).tr()),
          SizedBox(height: MediaQuery.of(context).size.width / 20,),
          Container(
            // padding: const EdgeInsets.all(10),
            width: MediaQuery.of(context).size.width / 3.5,
            height: MediaQuery.of(context).size.width / 8,
            color: Colors.grey.shade400,
            child: const Center(child: Text('Retry', style: TextStyle(
              fontSize: 18,
              color: Colors.black87,
              fontWeight: FontWeight.w700,
              fontFamily: 'Cerebri Sans Bold',
            ),)),
          )
        ],
      ),
    );
  }
}
