import 'package:flutter/material.dart';

import '../../helpers/routes.dart';
import '../../widgets/const_widgets/custom_button.dart';
import '../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class ViewRequestScreen extends StatelessWidget {
  const ViewRequestScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        iconTheme: Theme.of(context).iconTheme,
        title: Text(
          "View Request",
          style: Theme.of(context).textTheme.titleSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Interior painting",
                style: Theme.of(context).textTheme.titleMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width / 4.8,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4.8,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4.8,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4.8,
                    height: 5,
                    decoration: const BoxDecoration(
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              const Text(
                "The job was paid on 09/29/2022",
                style: TextStyle(
                  fontSize: 12,
                  color: Colors.green,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cerebri Sans Bold',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
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
                        "https://www.erc.com.pk/wp-content/uploads/person4.jpg",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Client',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 80,
                      ),
                      Text(
                        'Name',
                        style: Theme.of(context).textTheme.bodyMedium,
                      ),
                    ],
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Expanded(
                    child: OutlineSelectedButton(
                      onTap: () {},
                      textTitle: "Message",
                      border: true,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Expanded(
                    child: OutlineSelectedButton(
                      onTap: () {},
                      textTitle: "Call",
                      border: true,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              Text(
                "Job details",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.date_range,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Date",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Expanded(
                    flex: 3,
                    child: Text(
                      "Thursday, September 29, 2022 from 7:00 p.m. to 8:00 p.m.",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.watch_later_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Initial duration",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "1h",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet_outlined,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Remuneration",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "9 €",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Icon(
                    Icons.account_balance_wallet,
                    color: Theme.of(context).primaryColor,
                    size: 16,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    "Hourly rate",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "9 €",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text(
                "See the job",
                style: TextStyle(
                  fontSize: 12,
                  color: Theme.of(context).primaryColor,
                  fontWeight: FontWeight.w700,
                  fontFamily: 'Cerebri Sans Bold',
                ),
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              Text(
                "Payment Details",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Text("Initial duration", style: Theme.of(context).textTheme.bodySmall,),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("9 €", style: Theme.of(context).textTheme.bodySmall,),
                      Text("9€ x 1h", style: Theme.of(context).textTheme.labelSmall,),
                    ],
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Text("Overtime", style: Theme.of(context).textTheme.bodySmall,),
                  const Spacer(),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Text("0 €", style: Theme.of(context).textTheme.bodySmall,),
                      Text("9€ x 0h", style: Theme.of(context).textTheme.labelSmall,),
                    ],
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Text("Service charge", style: Theme.of(context).textTheme.bodySmall,),
                  const Spacer(),
                  Text("-0.45 €", style: Theme.of(context).textTheme.labelMedium,),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Text("Final remuneration", style: Theme.of(context).textTheme.bodySmall,),
                  const Spacer(),
                  Text("8,55 €", style: Theme.of(context).textTheme.labelMedium,),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
              ),
              Text(
                "Evaluation",
                style: Theme.of(context).textTheme.bodyMedium,
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Row(
                children: <Widget>[
                  Text("29 Sept 2022", style: Theme.of(context).textTheme.labelMedium,),
                  const Spacer(),
                  for(int i =0 ; i< 5; i++)
                    const Icon(Icons.star, color: Colors.amber,size: 14,),
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              Text("thanks for your advice", style: Theme.of(context).textTheme.bodySmall,),
              SizedBox(
                height: MediaQuery.of(context).size.width / 40,
              ),
              CustomButton(onPress: ()=> Navigator.of(context).pushNamed(MyRoutes.RATINGSCREENROUTE), buttonName: 'Give Review',),
            ],
          ),
        ),
      ),
    );
  }
}
