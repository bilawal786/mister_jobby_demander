import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:mister_jobby/models/accounts_models/cesu_tickets_model.dart';
import 'package:provider/provider.dart';

import '../../../providers/accounts_providers/cesu_ticket_provider/csey_ticket_provider.dart';


class MyTickets extends StatefulWidget {
  const MyTickets({Key? key}) : super(key: key);

  @override
  State<MyTickets> createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {

  int status = 1;
  @override
  Widget build(BuildContext context) {

    String sum = '';
    final cesuData = Provider.of<CseuTicketProvider>(context);
    final extractData = cesuData.ticketModel;
    final filterData = cesuData.getData();
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          "My CESU tickets",
          style: Theme.of(context).textTheme.titleMedium,
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width / 1.6,
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
                    filterData.toString(),
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

                    InkWell(
                      onTap: (){
                      Navigator.of(context).pushNamed(MyRoutes.TICKETSCANNERROUTE);
                      },
                      child: Container(
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
                              Icons.indeterminate_check_box_outlined,
                              size: 16,
                              color: Colors.black45,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 40,
                            ),
                            Text(
                              "My_Tickets_Button",
                              style: Theme.of(context).textTheme.labelMedium,
                            ).tr(),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "My_Tickets",
                style: Theme.of(context).textTheme.titleSmall,
              ).tr(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: extractData!.length,
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 7),
                width: double.infinity,
                height: MediaQuery.of(context).size.width /4.5,
                decoration: BoxDecoration(borderRadius: BorderRadius.circular(5),
                  color: Colors.grey.shade300,),
                  // Colors.primaries[Random().nextInt(Colors.primaries.length)].shade300,),
                child: Row(
                  children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(15.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(extractData[index].number, style: Theme.of(context).textTheme.titleSmall,),
                        SizedBox(height: MediaQuery.of(context).size.width /60,),
                        Text(extractData[index].createdAt.toString(), style: Theme.of(context).textTheme.labelMedium,),
                      ],),
                  ),
                  const Spacer(),
                  Padding(
                    padding: const EdgeInsets.only(right: 10, bottom: 10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.end,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: <Widget>[
                      (extractData[index].status == 2 ) ?
                      Text('Rejected', style: TextStyle(
                        fontSize: 16,
                        color: Colors.red.shade300,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cerebri Sans Bold',
                      ),) :
                      (extractData[index].status == 0) ?
                      const Text('Pending', style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(247,203,115,5),
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cerebri Sans Bold',
                      ),) :
                      Text('Accepted', style: TextStyle(
                        fontSize: 16,
                        color: Colors.green.shade600,
                        fontWeight: FontWeight.normal,
                        fontFamily: 'Cerebri Sans Bold',
                      ),),
                    ],),
                  ),
                ],),
              ),),
            ],
          ),
        ),
      ),
    );
  }
}
