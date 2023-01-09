import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../helpers/routes.dart';
import '../../models/jobs_models/job_proposals_model.dart';
import '../../widgets/const_widgets/custom_button.dart';
import '../../widgets/home_screen_widgets/service_sub_categories/process_const_widgets/outline_selected_button.dart';
import '../home_screens/home_tabs_screen.dart';
import '../messages_screens/chat_screen.dart';

class PaymentSuccessScreen extends StatelessWidget {
  final Jobber? jobber;
  const PaymentSuccessScreen({Key? key, required this.jobber})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async{
        Navigator.of(context).pushAndRemoveUntil(
            MaterialPageRoute(
              builder: (ctx) => MyHomeBottomTabScreen(
                pageIndex: 1,
              ),
            ),
                (route) => false);
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          iconTheme: const IconThemeData(
            color: Colors.black,
            size: 25,
          ),
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 2,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 4,
                    height: MediaQuery.of(context).size.width / 4,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.black12,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.network(
                        "${MyRoutes.IMAGEURL}${jobber!.image}",
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 25,
                  ),
                  Text(
                    "Reservation made!",
                    style: Theme.of(context).textTheme.titleMedium,
                  ).tr(),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 1.2,
                    child: Text(
                      "User has been notified of your reservation. You can now get in touch via private messaging or by phone.",
                      style: Theme.of(context).textTheme.bodySmall,
                      textAlign: TextAlign.center,
                    ).tr(),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 2,
                  ),
                  CustomButton(
                    onPress: () {
                      Navigator.of(context).push(
                      MaterialPageRoute(
                          builder: (ctx) => ChatScreen(jobberId: jobber!.jobberId.toString(),
                            jobberName: "${jobber!.firstName} ${jobber!.lastName}",
                            jobberImgUrl: jobber!.image,
                            jobberToken: "${jobber!.deviceToken}",
                          ),),);
                    },
                    buttonName: 'Discuss in private',
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  OutlineSelectedButton(
                    onTap: () {
                      Navigator.of(context).pushAndRemoveUntil(
                          MaterialPageRoute(
                            builder: (ctx) => MyHomeBottomTabScreen(
                              pageIndex: 1,
                            ),
                          ),
                          (route) => false);
                    },
                    textTitle: 'Jobs Screen',
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
