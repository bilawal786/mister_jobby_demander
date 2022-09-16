import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/accounts_providers/useful_information_providers/faq_provider.dart';
import 'package:provider/provider.dart';

class FAQScreen extends StatefulWidget {
  const FAQScreen({Key? key}) : super(key: key);

  @override
  State<FAQScreen> createState() => _FAQScreenState();
}

class _FAQScreenState extends State<FAQScreen> {
  List<int> expansion = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            children: [
              Card(
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  title: Text(
                    "Email Support",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                  leading: Container(
                    padding: const EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 0,
                          blurRadius: 1,
                          offset:
                              const Offset(1, 2), // changes position of shadow
                        ),
                      ],
                      color: Colors.amber,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.email_outlined,
                      size: 20,
                    ),
                  ),
                  trailing: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                  ),
                ),
              ),
              const Divider(thickness: 1),
              Consumer<FAQProvider>(
                builder: (index, faqData, child) => ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: 10,
                  itemBuilder: (ctx, index) => GestureDetector(
                    onTap: () {
                      faqData.expansionFunction(index);
                    },
                    child: Container(
                      margin: const EdgeInsets.only(
                        top: 10,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.2),
                            spreadRadius: 0,
                            blurRadius: 1,
                            offset: const Offset(
                                1, 2), // changes position of shadow
                          ),
                        ],
                      ),
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            color: faqData.expansion.contains(index)
                                ? Colors.grey.shade200
                                : Colors.white,
                            child: Row(
                              children: [
                                Text(
                                  "Is this build with Flutter",
                                  style: Theme.of(context).textTheme.titleSmall,
                                ),
                                const Spacer(),
                                faqData.expansion.contains(index)
                                    ? const Icon(
                                        Icons.remove,
                                        size: 20,
                                      )
                                    : const Icon(
                                        Icons.add,
                                        size: 20,
                                      )
                              ],
                            ),
                          ),
                          faqData.expansion.contains(index)
                              ? Container(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(
                                    "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.",
                                    style:
                                        Theme.of(context).textTheme.labelMedium,
                                  ),
                                )
                              : const SizedBox(),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
