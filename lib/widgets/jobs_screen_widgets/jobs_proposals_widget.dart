import 'package:flutter/material.dart';
import 'package:mister_jobby/widgets/const_widgets/custom_button.dart';
import 'package:mister_jobby/widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class JobsProposalsWidget extends StatelessWidget {
  const JobsProposalsWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: const EdgeInsets.all(0.0),
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      itemCount: 1,
      itemBuilder: (ctx, index) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: <Widget>[
            Row(
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
                      child: Image.network("https://pixlr.com/images/index/remove-bg.webp", fit: BoxFit.cover,)),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width / 40,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "Name Here",
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
                          width: MediaQuery.of(context).size.width /
                              80,
                        ),
                        Text(
                          "5",
                          style:
                          Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width /
                              80,
                        ),
                        Text(
                          "(views)",
                          style:
                          Theme.of(context).textTheme.bodySmall,
                        ),
                      ],
                    ),
                  ],
                ),
                const Spacer(),
                Text(
                  "285 €",
                  style: Theme.of(context).textTheme.bodyMedium,
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                children: <Widget>[
                  Row(
                    children: <Widget>[
                      const Icon(Icons.stars, size: 20, color: Colors.black54,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 40,
                      ),
                      Text("experience here", style: Theme.of(context).textTheme.bodySmall,),
                    ],
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  Row(
                    children: <Widget>[
                      const Icon(Icons.business_center_sharp, size: 20, color: Colors.black54,),
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 40,
                      ),
                      Expanded(
                        child: Text(
                          "experience here"
                          , style: Theme.of(context).textTheme.bodySmall,
                        textAlign: TextAlign.justify,),
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
            Text("\"Client Reviews\" ", style: Theme.of(context).textTheme.labelMedium,),
            Text("Client Name", style: Theme.of(context).textTheme.displaySmall,),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            CustomButton(onPress: (){}, buttonName: "Continue"),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            OutlineSelectedButton(onTap: (){}, textTitle: "See_Profile", border: true, width: double.infinity,),
            SizedBox(
              height: MediaQuery.of(context).size.width / 40,
            ),
            const Divider(
              color: Colors.black12,
              thickness: 10,
            ),
          ],
        ),
      ),
    );
  }
}
