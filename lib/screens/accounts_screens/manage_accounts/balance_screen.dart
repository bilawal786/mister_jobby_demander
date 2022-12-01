import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../providers/accounts_providers/cesu_ticket_provider/csey_ticket_provider.dart';
import '../../../providers/accounts_providers/my_balance_provider/my_balance_provider.dart';

class BalanceScreen extends StatefulWidget {
  const BalanceScreen({Key? key}) : super(key: key);

  @override
  State<BalanceScreen> createState() => _BalanceScreenState();
}

class _BalanceScreenState extends State<BalanceScreen> {
  var isInit = true;
  @override
  void didChangeDependencies() {
    if(isInit){
      Provider.of<MyBalanceProvider>(context).getMyBalance(context);
      Provider.of<CseuTicketProvider>(context).getCesuTicket(context);
      Provider.of<MyBalanceProvider>(context,listen: false).getCESUData();
    } isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final balanceData = Provider.of<MyBalanceProvider>(context, listen: false);
    final extractData = balanceData.myBalanceModel;
    return WillPopScope(
      onWillPop: () async {
         await balanceData.clearCESUData();
         return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          title:
              Text("My Balance", style: Theme.of(context).textTheme.bodyLarge).tr(),
          centerTitle: false,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
          ),
        ),
        body: RefreshIndicator(
          onRefresh: () async {
            await Provider.of<MyBalanceProvider>(context, listen: false).getMyBalance(context);
          },
          child: SingleChildScrollView(
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
                          "${extractData?.wallet}€",
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
                        // Container(
                        //   width: MediaQuery.of(context).size.width / 1.6,
                        //   height: MediaQuery.of(context).size.width / 1.8,
                        //   padding: const EdgeInsets.all(10.0),
                        //   margin: const EdgeInsets.all(5.0),
                        //   decoration: BoxDecoration(
                        //     borderRadius: BorderRadius.circular(10),
                        //     color: Theme.of(context).primaryColor,
                        //   ),
                        //   child: Column(
                        //     crossAxisAlignment: CrossAxisAlignment.start,
                        //     children: <Widget>[
                        //       Row(
                        //         children: <Widget>[
                        //           const Text(
                        //             "Balance_Jackpot_Text1",
                        //             style: TextStyle(
                        //               fontFamily: 'Cerebri Sans Bold',
                        //               fontSize: 16,
                        //               color: Colors.white,
                        //             ),
                        //           ).tr(),
                        //           const Spacer(),
                        //           const Icon(
                        //             Icons.account_balance_wallet_outlined,
                        //             color: Colors.white,
                        //             size: 20,
                        //           ),
                        //         ],
                        //       ),
                        //       SizedBox(
                        //         height: MediaQuery.of(context).size.width / 5,
                        //       ),
                        //       Text(
                        //         '0',
                        //         style: TextStyle(
                        //           fontFamily: 'Cerebri Sans Bold',
                        //           fontSize: 22,
                        //           color: Colors.white,
                        //         ),
                        //       ),
                        //       const Text(
                        //         "Balance_Jackpot_Text2",
                        //         style: TextStyle(
                        //           fontFamily: 'Cerebri Sans Bold',
                        //           fontSize: 12,
                        //           color: Colors.white,
                        //         ),
                        //       ).tr(),
                        //       SizedBox(
                        //         height: MediaQuery.of(context).size.width / 40,
                        //       ),
                        //       Container(
                        //         padding: const EdgeInsets.all(10.0),
                        //         height: MediaQuery.of(context).size.width / 9,
                        //         width: MediaQuery.of(context).size.width / 2.2,
                        //         decoration: BoxDecoration(
                        //           borderRadius: BorderRadius.circular(10),
                        //           color: Colors.white,
                        //         ),
                        //         child: Row(
                        //           children: <Widget>[
                        //             const Icon(
                        //               Icons.compare_arrows,
                        //               size: 16,
                        //               color: Colors.black45,
                        //             ),
                        //             SizedBox(
                        //               width: MediaQuery.of(context).size.width / 40,
                        //             ),
                        //             Text(
                        //               "Balance_Jackpot_Button",
                        //               style:
                        //                   Theme.of(context).textTheme.labelMedium,
                        //             ).tr(),
                        //           ],
                        //         ),
                        //       ),
                        //     ],
                        //   ),
                        // ),
                        GestureDetector(
                          onTap: (){
                            Navigator.of(context).pushNamed(MyRoutes.MYTICKETSROUTE);
                          },
                          child: Container(
                            width: MediaQuery.of(context).size.width / 1.1,
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
                                    const Text(
                                      "Balance_CESU_Text1",
                                      style: TextStyle(
                                        fontFamily: 'Cerebri Sans Bold',
                                        fontSize: 16,
                                        color: Colors.white,
                                      ),
                                    ).tr(),
                                    const Spacer(),
                                    const Icon(
                                      Icons.account_balance_wallet_outlined,
                                      color: Colors.white,
                                      size: 20,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: MediaQuery.of(context).size.width / 5,
                                ),
                                Text(
                                  "${balanceData.cesuPriceSum} €",
                                  style: const TextStyle(
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
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    controller: ScrollController(),
                    primary: false,
                    itemCount: extractData!.details.length,
                    itemBuilder: (context, index) => Column(
                      children: [
                        ListTile(
                          contentPadding: EdgeInsets.zero,
                          // tileColor: Colors.red,
                          horizontalTitleGap: 10,
                          // minVerticalPadding: 20,
                          leading: Container(
                            width: MediaQuery.of(context).size.width /7,
                            height: MediaQuery.of(context).size.width /8,
                            child: Stack(children: <Widget>[
                              Center(
                                child: Container(
                                  width: MediaQuery.of(context).size.width /10,
                                    height: MediaQuery.of(context).size.width /10,
                                    decoration: const BoxDecoration(
                                      shape: BoxShape.circle,
                                        color: Colors.black26,),
                                    child: Icon(FontAwesomeIcons.coins,
                                      size: MediaQuery.of(context).size.width /20,
                                      color: Colors.white,)),
                              ),
                              Positioned(
                                right: -1,
                                  top: 0,
                                  child:
                                  (extractData.details[index].transactionType == 'ingoing') ?
                                  Icon(
                                    Icons.arrow_downward,
                                    size: MediaQuery.of(context).size.width / 25,
                                    color: Colors.green.shade600,

                                  ) :
                                Icon(
                                Icons.arrow_upward, size: 15, color: Colors.red.shade600,
                              )
                              ),],),
                          ),
                          title: Text(
                            extractData.details[index].paymentType,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          subtitle: Text(
                            extractData.details[index].createdAt,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          trailing: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Text(
                                '${extractData.details[index].amount}€',
                                style: Theme.of(context).textTheme.titleSmall,
                              ),
                               // Icon(
                               //
                               //    Icons.keyboard_arrow_up_outlined : Icons.keyboard_arrow_down_outlined),
                            ],
                          ),
                        ),
                        const Divider(),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
