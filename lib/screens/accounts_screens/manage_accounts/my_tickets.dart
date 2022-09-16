import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';


class MyTickets extends StatefulWidget {
  const MyTickets({Key? key}) : super(key: key);

  @override
  State<MyTickets> createState() => _MyTicketsState();
}

class _MyTicketsState extends State<MyTickets> {

  @override
  Widget build(BuildContext context) {
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
                          style: const TextStyle(
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
              Center(
                child: Icon(
                  Icons.find_in_page_rounded,
                  size: 130,
                  color: Theme.of(context).primaryColor,
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Container(
                padding: const EdgeInsets.all(10.0),
                width: double.infinity,
                child: Column(
                  children: <Widget>[
                    Text(
                      "No_Tickets",
                      style: Theme.of(context).textTheme.titleSmall,
                    ).tr(),
                    Text(
                      "My_Tickets_Text",
                      style: Theme.of(context).textTheme.labelMedium,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
