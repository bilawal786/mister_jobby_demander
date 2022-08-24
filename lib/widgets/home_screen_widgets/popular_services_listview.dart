import 'package:flutter/material.dart';

import '../home_screen_widgets/popular_services_list_item.dart';

class PopularServicesListView extends StatelessWidget {
  const PopularServicesListView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.width / 2.5,
      child: ListView.builder(
        itemCount: 8,
        scrollDirection: Axis.horizontal,
        shrinkWrap: true,
        itemBuilder: (ctx, index) => const PopularServicesListItems(),
      ),
    );
  }
}
