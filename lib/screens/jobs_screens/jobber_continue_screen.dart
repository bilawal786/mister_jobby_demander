import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_stripe/flutter_stripe.dart';

import '../../helpers/routes.dart';
import '../../widgets/const_widgets/custom_button.dart';

class ContinueJobber extends StatefulWidget {
  const ContinueJobber({Key? key}) : super(key: key);

  @override
  State<ContinueJobber> createState() => _ContinueJobberState();
}

class _ContinueJobberState extends State<ContinueJobber> {
  Map<String, dynamic>? paymentIntent;
  var check = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Edit Job",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        iconTheme: const IconThemeData(
          color: Colors.black45,
          size: 25,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              color: Colors.blue.shade100,
              padding: const EdgeInsets.all(10.0),
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width / 6,
                    height: MediaQuery.of(context).size.width / 6,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(50),
                        child: Image.network(
                          "https://cdn.searchenginejournal.com/wp-content/uploads/2022/04/reverse-image-search-627b7e49986b0-sej-760x400.png",
                          fit: BoxFit.cover,
                        )),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        "name here",
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                      Row(
                        children: <Widget>[
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 20,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 80,
                          ),
                          Text(
                            "5",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width / 80,
                          ),
                          Row(
                            children: [
                              Text(
                                "(5",
                                style: Theme.of(context).textTheme.bodySmall,
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width / 100,
                              ),
                              Text(
                                "Views)",
                                style: Theme.of(context).textTheme.bodySmall,
                              ).tr(),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Spacer(),
                  Text(
                    "18.15 €",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Text(
              "Summary",
              style: Theme.of(context).textTheme.bodyLarge,
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text(
                        "Jobber Remuneration",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                      const Spacer(),
                      Text(
                        "171 ",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        "Service charge",
                        style: Theme.of(context).textTheme.labelMedium,
                      ).tr(),
                      const Spacer(),
                      Text(
                        "35 ",
                        style: Theme.of(context).textTheme.labelMedium,
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            Row(
              children: [
                Text(
                  "Total",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
                const Spacer(),
                Text(
                  "206 ",
                  style: Theme.of(context).textTheme.bodyLarge,
                ),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            check == false
                ? CustomButton(
                    onPress: () async {
                      setState(() {
                        check = true;
                      });
                      await makePayment();
                    },
                    buttonName: "To Book")
                : const Center(
                    child: CircularProgressIndicator(),
                  ),
          ],
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    try {
      paymentIntent = await createPaymentIntent('10', 'USD');
      //Payment Sheet
      await Stripe.instance
          .initPaymentSheet(
              paymentSheetParameters: SetupPaymentSheetParameters(
                  paymentIntentClientSecret: paymentIntent!['client_secret'],
                  // applePay: const PaymentSheetApplePay(merchantCountryCode: '+92',),
                  // googlePay: const PaymentSheetGooglePay(testEnv: true, currencyCode: "US", merchantCountryCode: "+92"),
                  style: ThemeMode.dark,
                  merchantDisplayName: 'Hassan'))
          .then((value) {});
      setState(() {
        check = true;
      });

      ///now finally display payment sheeet
      displayPaymentSheet();
    } catch (e, s) {
      print('exception:$e$s');
      setState(() {
        check = false;
      });
    }
  }

  displayPaymentSheet() async {
    try {
      await Stripe.instance.presentPaymentSheet().then((value) {
        Navigator.of(context).pushNamed(MyRoutes.PAYMENTSUCCESSFULLY);
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: const [
                    Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    Text("Payment Successfull"),
                  ],
                ),
              ],
            ),
          ),
        );
        // ScaffoldMessenger.of(context).showSnackBar(const SnackBar(content: Text("paid successfully")));
        paymentIntent = null;
        setState(() {
          check = false;
        });
      }).onError((error, stackTrace) {
        print('Error is:--->$error $stackTrace');
        setState(() {
          check = false;
        });
      });
    } on StripeException catch (e) {
      print('Error is:---> $e');
      showDialog(
          context: context,
          builder: (_) => const AlertDialog(
                content: Text("Cancelled "),
              ));
      setState(() {
        check = false;
      });
    } catch (e) {
      print('$e');
      setState(() {
        check = false;
      });
    }
  }

  //  Future<Map<String, dynamic>>
  createPaymentIntent(String amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };

      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization':
              'Bearer sk_test_51LRubcLtkEa5U40QApwIt13tNTcs9x2v95PKmJjoZ57xvfMf1PaPH0hYB556mGLJyhFDniqtEBRQbbDAY4wtmFE500xuKSA0Qb',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      if(response.statusCode == 200) {
        print('Payment Intent Body->>> ${response.body.toString()}');
        return jsonDecode(response.body);
      }
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(String amount) {
    final calculatedAmout = (int.parse(amount)) * 100;
    return calculatedAmout.toString();
  }
}
