import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../widgets/const_widgets/custom_button.dart';

class AddTicketManually extends StatefulWidget {
  const AddTicketManually({Key? key}) : super(key: key);

  @override
  State<AddTicketManually> createState() => _AddTicketManuallyState();
}

class _AddTicketManuallyState extends State<AddTicketManually> {
  TextEditingController qrController = TextEditingController();

  @override
  void dispose() {
    qrController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
            Text(
              'Scan_Code_Add_Tickets',
              style: Theme.of(context).textTheme.titleMedium,
            ).tr(),
            SizedBox(height: MediaQuery.of(context).size.width /10,),
            TextFormField(
              controller: qrController,
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                labelText: "Add Ticket Code".tr(),
                isDense: true,
              ),
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(height: MediaQuery.of(context).size.width /2,),
            CustomButton(onPress: (){}, buttonName: 'Send Code',),
          ],),
        ),
      ),
    );
  }
}
