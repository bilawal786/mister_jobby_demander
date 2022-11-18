import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/accounts_providers/transaction_provider/transaction_provider.dart';

class MyTransactionScreen extends StatelessWidget {
  const MyTransactionScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final transactionData = Provider.of<TransactionProvider>(context);
    final extractData = transactionData.transactionModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              'My_Transaction',
              style: Theme.of(context).textTheme.titleMedium,
            ).tr(),
            SizedBox(height: MediaQuery.of(context).size.width /40,),
            ListView.builder(
              itemCount: extractData!.length,
              shrinkWrap: true,
              itemBuilder: (context, index) => Container(
                color: Colors.grey.shade300,
                child: ListTile(
                  leading: Text(
                    extractData[index].transactionId.toString(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  title: Text(
                    extractData[index].jobTitle,
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  subtitle: Text(
                    extractData[index].invoiceNo,
                    style: Theme.of(context).textTheme.labelLarge,
                  ),
                  trailing: Text(
                    "${extractData[index].price} €",
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
