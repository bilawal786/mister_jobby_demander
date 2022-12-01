import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../providers/accounts_providers/transaction_provider/transaction_provider.dart';

class MyTransactionScreen extends StatefulWidget {
  const MyTransactionScreen({Key? key}) : super(key: key);

  @override
  State<MyTransactionScreen> createState() => _MyTransactionScreenState();
}

class _MyTransactionScreenState extends State<MyTransactionScreen> {

  var isInit = true;
  @override
  void didChangeDependencies() {
    if(isInit){
      Provider.of<TransactionProvider>(context).getTransaction(context);
    } isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final transactionData = Provider.of<TransactionProvider>(context, listen: false);
    final extractData = transactionData.transactionModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
        title: Text(
          'My_Transaction',
          style: Theme.of(context).textTheme.bodyLarge,
        ).tr(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: RefreshIndicator(
          onRefresh: () async{
            await Provider.of<TransactionProvider>(context, listen: false).getTransaction(context);
          },
          child: ListView.builder(
            itemCount: extractData!.length,
            itemBuilder: (context, index) => Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(bottom: 10),
                  child: Container(
                    color: Colors.grey.shade300,
                    padding: const EdgeInsets.all(10),
                    child:

                    ListTile(
                      contentPadding: const EdgeInsets.only(left: 0,right: 5, top: 5, bottom: 5),
                      horizontalTitleGap: 10,
                      leading: SizedBox(
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
                              child: Icon(
                                Icons.arrow_upward,
                                size: MediaQuery.of(context).size.width / 25,
                                color: Colors.red.shade300,
                              ),
                          ),],),
                      ),
                      title: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [

                          // SizedBox(height: MediaQuery.of(context).size.width /60,),
                          Text(
                            extractData[index].jobTitle,
                            style: Theme.of(context).textTheme.titleSmall,
                          ),
                          Row(
                            children: [
                              Text(
                                extractData[index].createdAt,
                                style: Theme.of(context).textTheme.labelMedium,
                              ),
                              const Spacer(),
                              Text(
                                "${extractData[index].price} €",
                                style: Theme.of(context).textTheme.bodyLarge,
                              ),
                            ],
                          ),
                          Text(
                            extractData[index].invoiceNo,
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                        ],
                      ),
                      subtitle: Text(
                        extractData[index].transactionId.toString(),
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
