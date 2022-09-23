import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:mister_jobby/widgets/const_widgets/custom_button.dart';

class ContinueJobber extends StatelessWidget {
  const ContinueJobber({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        title: Text("Edit Job", style: Theme.of(context).textTheme.bodyLarge,),
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
                            width:
                            MediaQuery.of(context).size.width / 80,
                          ),
                          Text(
                            "5",
                            style:
                            Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            width:
                            MediaQuery.of(context).size.width / 80,
                          ),
                          Row(
                            children: [
                              Text(
                                "(5",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall,
                              ),
                              SizedBox(
                                width:
                                MediaQuery.of(context).size.width /
                                    100,
                              ),
                              Text(
                                "Views)",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall,
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
            Text("Summary", style: Theme.of(context).textTheme.bodyLarge,),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      Text("Jobber Remuneration", style: Theme.of(context).textTheme.labelMedium,).tr(),
                      const Spacer(),
                      Text("171 ", style: Theme.of(context).textTheme.labelMedium,),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width /40,
                  ),
                  Row(
                    children: <Widget>[
                      Text("Service charge", style: Theme.of(context).textTheme.labelMedium,).tr(),
                      const Spacer(),
                      Text("35 ", style: Theme.of(context).textTheme.labelMedium,),
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
                Text("Total", style: Theme.of(context).textTheme.bodyLarge,),
                const Spacer(),
                Text("206 ", style: Theme.of(context).textTheme.bodyLarge,),
              ],
            ),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            const Divider(),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            CustomButton(onPress: (){}, buttonName: "To Book"),
          ],
        ),
      ),
    );
  }
}
