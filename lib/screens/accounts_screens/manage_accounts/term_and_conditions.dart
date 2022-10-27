import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../providers/accounts_providers/about_provider/about_provider.dart';
import '../../../providers/accounts_providers/terms_and_condition_provider/terms_and_condition_provider.dart';

class TermsAndCondition extends StatefulWidget {
  const TermsAndCondition({Key? key}) : super(key: key);

  @override
  State<TermsAndCondition> createState() => _TermsAndConditionState();
}

class _TermsAndConditionState extends State<TermsAndCondition> {
  @override
  Widget build(BuildContext context) {
    final copyrightData = Provider.of<AboutProvider>(context);
    final extractCopyRight = copyrightData.about;
    final termsAndConditionData = Provider.of<TermsAndConditionProvider>(context);
    final extractTermsAndCondition = termsAndConditionData.termsAndCondition;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text("Terms and conditions", style: Theme.of(context).textTheme.titleMedium,),

        iconTheme: const IconThemeData(
            color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Text(
                    extractTermsAndCondition!.terms,
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Center(child: Image.asset("assets/images/appLogo.png", scale: 4)),
                    Center(
                      child: Text(
                        extractCopyRight!.copyright,
                        textAlign: TextAlign.justify,
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Container(
                        margin: const EdgeInsets.all(10),
                        child: Text(
                          extractCopyRight.condition,
                          style: Theme.of(context).textTheme.bodySmall,
                        )),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.height * .08,
                          decoration: BoxDecoration(
                            color: Colors.blue.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child:const Icon(Icons.facebook),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.height * .08,
                          decoration: BoxDecoration(
                            color: Colors.red.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.facebook),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.height * .08,
                          decoration: BoxDecoration(
                            color: Colors.pink.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.facebook),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * .08,
                          width: MediaQuery.of(context).size.height * .08,
                          decoration: BoxDecoration(
                            color: Colors.green.shade50,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: const Icon(Icons.facebook),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.width / 40,
                    ),
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
