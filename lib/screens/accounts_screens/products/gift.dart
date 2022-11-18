import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:provider/provider.dart';

import '../../../providers/accounts_providers/gift_card_provider/gift_card_provider.dart';
import '../../../widgets/const_widgets/custom_button.dart';

class GiftScreen extends StatefulWidget {
  const GiftScreen({Key? key}) : super(key: key);

  @override
  State<GiftScreen> createState() => _GiftScreenState();
}

class _GiftScreenState extends State<GiftScreen> {

  final TextEditingController giftCardController = TextEditingController();

  @override
  void dispose() {
    giftCardController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: const IconThemeData(
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
                "Gift_Card_text",
                style: Theme.of(context).textTheme.titleLarge,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "Gift_Card_Field",
                style: Theme.of(context).textTheme.bodySmall,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              TextFormField(
                controller: giftCardController,
                decoration: InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Gift_Card_Field_Hint".tr(),
                  isDense: true,
                ),
                style: Theme.of(context).textTheme.bodySmall,
                enabled: true,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              Text(
                "How_it_Works",
                style: Theme.of(context).textTheme.labelMedium,
              ).tr(),
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
                  "Gift_Card_List_Title1",
                  style: Theme.of(context).textTheme.bodySmall,
                ).tr(),
                subtitle: Text(
                  "Gift_Card_List_SubTitle1",
                  style: Theme.of(context).textTheme.labelSmall,
                ).tr(),
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
                  "Gift_Card_List_Title2",
                  style: Theme.of(context).textTheme.bodySmall,
                ).tr(),
                subtitle: Text(
                  "Gift_Card_List_SubTitle2",
                  style: Theme.of(context).textTheme.labelSmall,
                ).tr(),
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
                  "Gift_Card_List_Title3",
                  style: Theme.of(context).textTheme.bodySmall,
                ).tr(),
                subtitle: Text(
                  "Gift_Card_List_SubTitle3",
                  style: Theme.of(context).textTheme.labelSmall,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              CustomButton(onPress: () {
                Provider.of<GiftCardProvider>(context, listen: false).postGiftCard(context, giftCardController.text);
              }, buttonName: "Gift_Card_Button".tr()),
            ],
          ),
        ),
      ),
    );
  }
}
