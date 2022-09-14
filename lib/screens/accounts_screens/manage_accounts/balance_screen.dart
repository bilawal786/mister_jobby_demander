import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title:
            Text("My Balance", style: Theme.of(context).textTheme.titleMedium),
        centerTitle: true,
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
              SizedBox(
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(
                      "0 €",
                      style: Theme.of(context).textTheme.titleLarge,
                    ),
                    Text(
                      "Balance_Text",
                      style: Theme.of(context).textTheme.labelMedium,
                    ).tr(),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 10,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.width / 1.5,
                child: ListView(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: MediaQuery.of(context).size.width / 1.8,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Theme.of(context).primaryColor,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Balance_Jackpot_Text1",
                                style: TextStyle(
                                  fontFamily: 'Cerebri Sans Bold',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ).tr(),
                              Spacer(),
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 5,
                          ),
                          const Text(
                            "0 €",
                            style: TextStyle(
                              fontFamily: 'Cerebri Sans Bold',
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Balance_Jackpot_Text2",
                            style: TextStyle(
                              fontFamily: 'Cerebri Sans Bold',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ).tr(),
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 40,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.width / 9,
                            width: MediaQuery.of(context).size.width / 2.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.compare_arrows,
                                  size: 16,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                Text(
                                  "Balance_Jackpot_Button",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.6,
                      height: MediaQuery.of(context).size.width / 1.8,
                      padding: const EdgeInsets.all(10.0),
                      margin: const EdgeInsets.all(5.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Colors.blue.shade900,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: <Widget>[
                          Row(
                            children: <Widget>[
                              Text(
                                "Balance_CESU_Text1",
                                style: TextStyle(
                                  fontFamily: 'Cerebri Sans Bold',
                                  fontSize: 16,
                                  color: Colors.white,
                                ),
                              ).tr(),
                              Spacer(),
                              Icon(
                                Icons.account_balance_wallet_outlined,
                                color: Colors.white,
                                size: 20,
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 5,
                          ),
                          const Text(
                            "0 €",
                            style: TextStyle(
                              fontFamily: 'Cerebri Sans Bold',
                              fontSize: 22,
                              color: Colors.white,
                            ),
                          ),
                          const Text(
                            "Balance_CESU_Text2",
                            style: TextStyle(
                              fontFamily: 'Cerebri Sans Bold',
                              fontSize: 12,
                              color: Colors.white,
                            ),
                          ).tr(),
                          SizedBox(
                            height: MediaQuery.of(context).size.width / 40,
                          ),
                          Container(
                            padding: const EdgeInsets.all(10.0),
                            height: MediaQuery.of(context).size.width / 9,
                            width: MediaQuery.of(context).size.width / 2.2,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Row(
                              children: <Widget>[
                                const Icon(
                                  Icons.add,
                                  size: 16,
                                  color: Colors.black45,
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width / 40,
                                ),
                                Text(
                                  "Balance_CESU_Button",
                                  style:
                                      Theme.of(context).textTheme.labelMedium,
                                ).tr(),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              Text(
                "Balance_Mean_Payment",
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              Text(
                "Balance_Mean_SubPayment",
                style: Theme.of(context).textTheme.labelMedium,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 10,
              ),
              Text(
                "Balance_Transaction_History",
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 10,
              ),
              Center(
                child: Icon(
                  Icons.find_in_page_rounded,
                  size: 150,
                  color: Theme.of(context).primaryColor,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
