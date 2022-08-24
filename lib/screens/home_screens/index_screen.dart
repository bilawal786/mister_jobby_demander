import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';

import '../../widgets/home_screen_widgets/services_grid.dart';
import '../../widgets/home_screen_widgets/popular_services_listview.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Text(
                "Services_title",
                style: Theme.of(context).textTheme.bodyLarge,
              ).tr(),
              const ServicesGrid(),
              Text(
                "Popular_Services",
                style: Theme.of(context).textTheme.bodyLarge,
              ).tr(),
              const PopularServicesListView(),
              Text(
                "Warranties",
                style: Theme.of(context).textTheme.bodyLarge,
              ).tr(),
            ],
          ),
        ),
      ),
    );
  }
}
