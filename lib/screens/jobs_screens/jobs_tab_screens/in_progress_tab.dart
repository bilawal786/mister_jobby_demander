import 'package:flutter/material.dart';

import '../../../widgets/const_widgets/custom_button.dart';

class InProgressTab extends StatelessWidget {
  const InProgressTab({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
        //   SingleChildScrollView(
        //   child: Container(
        //     padding: const EdgeInsets.all(40.0),
        //     margin: const EdgeInsets.all(10.0),
        //     child: Column(
        //       children: [
        //         const SizedBox(
        //           height: 100,
        //         ),
        //         Icon(
        //           Icons.find_in_page_rounded,
        //           size: 150,
        //           color: Theme.of(context).primaryColor,
        //         ),
        //         Text(
        //           "Jobs_TapBar_Page1_Title",
        //           style: Theme.of(context).textTheme.titleSmall,
        //         ).tr(),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.height / 40,
        //         ),
        //         Text(
        //           "Jobs_TabBar_Page1_Description",
        //           style: Theme.of(context).textTheme.labelLarge,
        //           textAlign: TextAlign.center,
        //         ).tr(),
        //         SizedBox(
        //           height: MediaQuery.of(context).size.height / 40,
        //         ),
        //         CustomButton(
        //           onPress: () {},
        //           buttonName: "I_need_a_favor",
        //           elevation: 8,
        //         ),
        //       ],
        //     ),
        //   ),
        // );

        Container(
          padding: const EdgeInsets.all(10.0),
          margin: const EdgeInsets.all(5.0),
          child: ListView.builder(
            padding: const EdgeInsets.all(0.0),
            shrinkWrap: false,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: 2,
            itemBuilder: (ctx, index) => Container(
              margin: const EdgeInsets.all(5.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.width / 2.8,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.0),
                      color: Colors.black12,
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        'assets/images/appLogo.png',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  Text(
                    'Job Title Here',
                    style: Theme.of(context).textTheme.titleSmall,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 80,
                  ),
                  Text(
                    'Job subTitle Here',
                    style: Theme.of(context).textTheme.labelSmall,
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  Container(
                    padding: const EdgeInsets.all(10.0),
                    decoration: BoxDecoration(
                      color: Colors.blueGrey.shade100,
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          children: <Widget>[
                            Icon(
                              Icons.notifications_outlined,
                              size: 15,
                              color: Theme.of(context).primaryColor,
                            ),
                            SizedBox(
                              width: MediaQuery.of(context).size.width / 40,
                            ),
                            Text(
                              "You have received 1 offer",
                              style: TextStyle(
                                fontFamily: 'Cerebri Sans Bold',
                                color: Theme.of(context).primaryColor,
                                fontSize: 12,
                              ),
                            )
                          ],
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.width / 40,
                        ),
                        SizedBox(
                          height: 60,
                          child: ListView.builder(
                            itemCount: 8,
                            shrinkWrap: false,
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (ctx, index) => Container(
                              margin:const EdgeInsets.only(left: 5),
                              height: 60,
                              width: 60,
                              decoration:const BoxDecoration(
                                color: Colors.white,
                                 shape: BoxShape.circle,
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(100.0),
                                child: Image.asset(
                                  'assets/images/appLogo.png',
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  CustomButton(onPress: () {}, buttonName: "Jobs"),
                  SizedBox(
                    height: MediaQuery.of(context).size.width / 40,
                  ),
                  const Divider(),
                ],
              ),
            ),
          ),
        );
  }
}
