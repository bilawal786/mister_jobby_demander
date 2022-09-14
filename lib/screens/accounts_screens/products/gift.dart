import 'package:flutter/material.dart';
import 'package:mister_jobby/widgets/const_widgets/custom_button.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({Key? key}) : super(key: key);

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "Gift cards",
                style: Theme.of(context).textTheme.titleLarge,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "Code indicated on your gift card",
                style: Theme.of(context).textTheme.bodySmall,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              TextFormField(
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter the 8 character code",
                  isDense: true,
                ),
                style: Theme.of(context).textTheme.bodySmall,
                enabled: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              Text(
                "How it works?",
                style: Theme.of(context).textTheme.labelMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.card_giftcard,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Enter the code",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                  "Add the code found on the gift card.",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.account_balance_wallet_outlined,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Enter the code",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                  "Add the code found on the gift card.",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              ListTile(
                leading: Icon(
                  Icons.check_circle_outline,
                  size: 20,
                  color: Theme.of(context).primaryColor,
                ),
                title: Text(
                  "Enter the code",
                  style: Theme.of(context).textTheme.bodySmall,
                ),
                subtitle: Text(
                  "Add the code found on the gift card.",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              CustomButton(onPress: () {}, buttonName: "Add map"),
            ],
          ),
        ),
      ),
    );
  }
}
