import 'package:flutter/material.dart';

import '../../widgets/const_widgets/custom_button.dart';
import '../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class PaymentSuccessScreen extends StatelessWidget {
  const PaymentSuccessScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: <Widget>[
                SizedBox(
                  height: MediaQuery.of(context).size.width / 2,
                ),
                Container(
                  width: MediaQuery.of(context).size.width / 4,
                  height: MediaQuery.of(context).size.width / 4,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.black12,
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(50),
                    child: Image.network(
                      "https://www.erc.com.pk/wp-content/uploads/person4.jpg",
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 25,
                ),
                Text("Reservation made!", style: Theme.of(context).textTheme.titleMedium,),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.2,
                  child: Text("User has been notified of your reservation. You can now get in touch via private messaging or by phone.", style: Theme.of(context).textTheme.bodySmall,
                    textAlign: TextAlign.center,),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 2,
                ),
                CustomButton(onPress: (){}, buttonName: 'Discuss in private',),
                SizedBox(
                  height: MediaQuery.of(context).size.width / 40,
                ),
                OutlineSelectedButton(onTap: (){}, textTitle: 'View my request',)
              ],
            ),
          ),
        ),
      ),
    );
  }
}
