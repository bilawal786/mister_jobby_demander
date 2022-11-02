import 'package:flutter/material.dart';

import '../../helpers/routes.dart';
import '../../models/jobs_models/job_reservations_model.dart';
import '../../widgets/const_widgets/custom_button.dart';
import '../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';

class ViewRequestScreen extends StatelessWidget {
  final JobReservationsModel? reservation;
  const ViewRequestScreen({Key? key, required this.reservation}) : super(key: key);

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
                reservation!.job.title,
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
              Text(
                "The job was paid on ${reservation!.date}",
                style: const TextStyle(
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
                        "${MyRoutes.IMAGEURL}/${reservation!.jobberProfile.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 40,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: <Widget>[
                      Text(
                        'Client',
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.width / 80,
                      ),
                      Text(
                        '${reservation!.jobberProfile.firstName} ${reservation!.jobberProfile.lastName}',
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
              Row(
                children: <Widget>[
                  Text(
                    "Job details",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  const Spacer(),
                  Text(reservation!.contractNo, style: TextStyle(
                    fontSize: 14,
                    fontFamily: 'Cerebri Sans Bold',
                    color: Colors.green.shade700,
                    fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
              SizedBox(
                height: MediaQuery.of(context).size.width / 20,
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
                  Text(
                    "${reservation!.job.serviceDate} at ${reservation!.job.startTime}",
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
                    "${reservation!.job.duration} h",
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
                    "${reservation!.hourlyRate} €",
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
                    "${reservation!.price} €",
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
                    "Administration tax",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "${((double.parse(reservation!.price) * 10) / 100 )} €",
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
                    "Total Amount",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  const Spacer(),
                  Text(
                    "${(((double.parse(reservation!.price) * 10) / 100 ) +  double.parse(reservation!.price))} €",
                    style: Theme.of(context).textTheme.labelMedium,
                  ),
                ],
              ),
              const Divider(),
              SizedBox(
                height: MediaQuery.of(context).size.width / 10,
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
              const Divider(),
              CustomButton(onPress: ()=> Navigator.of(context).pushNamed(MyRoutes.RATINGSCREENROUTE), buttonName: 'Complete Job',),
            ],
          ),
        ),
      ),
    );
  }
}
