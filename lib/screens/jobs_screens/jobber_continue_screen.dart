import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import 'package:mister_jobby/providers/accounts_providers/my_balance_provider/my_balance_provider.dart';
import 'package:mister_jobby/providers/jobs_provider/job_proposals_provider.dart';
import 'package:provider/provider.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../helpers/routes.dart';
import '../../models/jobs_models/job_proposals_model.dart';
import '../../widgets/const_widgets/custom_button.dart';
import 'payment_success_screen.dart';

class ContinueJobber extends StatefulWidget {
  final JobProposalsModel? proposel;
  const ContinueJobber({Key? key, required this.proposel}) : super(key: key);

  @override
  State<ContinueJobber> createState() => _ContinueJobberState();
}

class _ContinueJobberState extends State<ContinueJobber> {

  var isInit = true;
  Map<String, dynamic>? paymentIntent;
  var check = false;
  var readTerms = false;
  bool? alert;


  @override
  void didChangeDependencies() {
    if(isInit){
      Provider.of<MyBalanceProvider>(context).getMyBalance(context);
    }
    isInit= false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final balanceData = Provider.of<MyBalanceProvider>(context, listen: false);
    final extractData = balanceData.myBalanceModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text(
          "Continue Jobber",
          style: Theme.of(context).textTheme.bodyLarge,
        ).tr(),
        iconTheme: const IconThemeData(
          color: Colors.black,
          size: 25,
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              ListTile(
                onTap: readTerms == true
                    ? () {
                        setState(() {
                          alert = false;
                        });
                        (extractData!.wallet != "") &&
                            (double.parse(extractData.wallet) >
                                (double.parse(widget.proposel!.price) +
                                    ((double.parse(widget.proposel!.price) *
                                            10) /
                                        100)))
                            ? showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    "Pay From Wallet".tr(),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  content: Text(
                                    'Please Confirm'.tr(),
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'Cancel'.tr(),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        balanceData
                                            .payFromWallet(
                                              context,
                                              widget.proposel!.id.toString(),
                                              double.parse(
                                                      widget.proposel!.price) +
                                                  ((double.parse(widget
                                                              .proposel!
                                                              .price) *
                                                          10) /
                                                      100),
                                              ((double.parse(widget
                                                          .proposel!.price) *
                                                      10) /
                                                  100),
                                            )
                                            .then(
                                              (value) => Navigator.of(context)
                                                  .pushReplacement(
                                                MaterialPageRoute(
                                                  builder: (ctx) =>
                                                      PaymentSuccessScreen(
                                                    jobber:
                                                        widget.proposel!.jobber,
                                                  ),
                                                ),
                                              ),
                                            );
                                      },
                                      child: Text(
                                        'OK'.tr(),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                            : showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                  title: Text(
                                    'Insufficient Balance'.tr(),
                                    style:
                                        Theme.of(context).textTheme.bodyMedium,
                                  ),
                                  content: Text(
                                    'Please recharge your account and try again'.tr(),
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: Text(
                                        'OK'.tr(),
                                      ),
                                    ),
                                  ],
                                ),
                              );
                      }
                    : () {
                        setState(() {
                          alert = true;
                        });
                      },
                horizontalTitleGap: 0,
                minVerticalPadding: 0,
                leading: const Icon(FontAwesomeIcons.wallet),
                title: Text(
                  'Pay From Wallet'.tr(),
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
                trailing: Text(
                  extractData!.wallet == "" ? "0€" : "${extractData.wallet}€",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              check == false
                  ? CustomButton(
                      onPress: readTerms == true
                          ? () async {
                              setState(() {
                                check = true;
                                alert = false;
                              });
                              await makePayment();
                            }
                          : () {
                              setState(() {
                                alert = true;
                              });
                            },
                      buttonName: "Pay From Card")
                  : const Center(
                      child: CircularProgressIndicator(),
                    ),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child:  Padding(
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
                            "${MyRoutes.IMAGEURL}${widget.proposel!.jobber.image}",
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
                          "${widget.proposel!.jobber.firstName} ${widget.proposel!.jobber.lastName}",
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
                              "${widget.proposel!.jobber.rating}",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 80,
                            ),
                            Row(
                              children: [
                                Text(
                                  "(${widget.proposel!.jobber.reviews.length}",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 100,
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
                      "${widget.proposel!.price} €",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Container(
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  border: Border.all(color: Colors.black26, width: 0.5),
                  color: Colors.white,
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black26,
                      blurRadius: 3,
                      spreadRadius: 1,
                      offset: Offset(2, 5),
                    ),
                  ],
                ),
                child: Row(
                  children: <Widget>[
                    GestureDetector(
                        onTap: () {
                          Navigator.of(context)
                              .pushNamed(MyRoutes.TERMSANDCONDITION);
                        },
                        child: Text(
                          "Are you Read Terms and Conditions".tr(),
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                    ),
                    const Spacer(),
                    Transform.scale(
                      transformHitTests: false,
                      scale: .7,
                      child: CupertinoSwitch(
                          value: readTerms,
                          onChanged: (value) {
                            setState(() {
                              readTerms = value;
                            });
                          }),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "Summary".tr(),
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
                          "${widget.proposel!.price} €",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Row(
                      children: <Widget>[
                        Text(
                          "Service charge 10%",
                          style: Theme.of(context).textTheme.labelMedium,
                        ).tr(),
                        const Spacer(),
                        Text(
                          "${((double.parse(widget.proposel!.price) * 10) / 100)} €",
                          style: Theme.of(context).textTheme.bodySmall,
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
                    "Total".tr(),
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                  const Spacer(),
                  Text(
                    " ${double.parse(widget.proposel!.price) + ((double.parse(widget.proposel!.price) * 10) / 100)} €",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              const Divider(),
              if (alert == true)
                Text(
                  "Make Sure you read the terms and condition",
                  style: TextStyle(
                    fontSize: 16,
                    color: Theme.of(context).colorScheme.error,
                    fontWeight: FontWeight.normal,
                    fontFamily: 'Cerebri Sans Bold',
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> makePayment() async {
    var amount = double.parse(widget.proposel!.price) +
        ((double.parse(widget.proposel!.price) * 10) / 100);
    try {
      paymentIntent = await createPaymentIntent(amount, 'EUR');
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
        final proposalData =
            Provider.of<JobProposalsProvider>(context, listen: false);

        proposalData.postProposalContract(
            widget.proposel!.id.toString(),
            double.parse(widget.proposel!.price) +
                ((double.parse(widget.proposel!.price) * 10) / 100),
            ((double.parse(widget.proposel!.price) * 10) / 100));
        Navigator.of(context).pushReplacement(
          MaterialPageRoute(
            builder: (ctx) => PaymentSuccessScreen(
              jobber: widget.proposel!.jobber,
            ),
          ),
        );
        showDialog(
          context: context,
          builder: (_) => AlertDialog(
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Icon(
                      Icons.check_circle,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: MediaQuery.of(context).size.width / 20,
                    ),
                    Text(
                      "Payment Successfully",
                      style: Theme.of(context).textTheme.bodyMedium,
                    ),
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
  createPaymentIntent(double amount, String currency) async {
    try {
      Map<String, dynamic> body = {
        'amount': calculateAmount(amount),
        'currency': currency,
        'payment_method_types[]': 'card'
      };
      var response = await http.post(
        Uri.parse('https://api.stripe.com/v1/payment_intents'),
        headers: {
          'Authorization': 'Bearer sk_test_bNs6F2GH5AWstJEQg7KT852l00SdVU7GF0',
          'Content-Type': 'application/x-www-form-urlencoded'
        },
        body: body,
      );
      // ignore: avoid_print
      if (response.statusCode == 200) {
        debugPrint('Payment Intent Body->>> ${response.body.toString()}');
        return jsonDecode(response.body);
      }
    } catch (err) {
      // ignore: avoid_print
      print('err charging user: ${err.toString()}');
    }
  }

  calculateAmount(double amount) {
    final calculatedAmout = (amount * 100).toInt();
    return calculatedAmout.toString();
  }
}
