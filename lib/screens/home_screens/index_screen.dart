import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mister_jobby/widgets/home_screen_widgets/warranties_list_tiles.dart';

import '../../helpers/routes.dart';
import '../../widgets/home_screen_widgets/services_grid.dart';
import '../../widgets/home_screen_widgets/popular_services_listview.dart';

class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var navigator = Navigator.of(context);
    return DefaultTabController(
      length: 1,
      child: Scaffold(
        body: NestedScrollView(
          floatHeaderSlivers: true,
          headerSliverBuilder: (context, innerBoxIsScrolled) => [
            SliverAppBar(
              expandedHeight: 110,
              pinned: true,
              floating: true,
              snap: true,
              title: Container(
                  // color: Colors.red,
                  margin: EdgeInsets.only(
                      top: MediaQuery.of(context).size.width / 30),
                  child: Text(
                    "Home_AppBar_Title",
                    style: Theme.of(context).textTheme.titleLarge,
                  ).tr()),
              backgroundColor: Colors.white,
              bottom: TabBar(
                // padding: const EdgeInsets.all(5.0),
                indicatorColor: Colors.white,
                tabs: [
                  Tab(
                    child: GestureDetector(
                      onTap: () => navigator.pushNamed(
                        MyRoutes.SEARCHROUTE,
                      ),
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        decoration: BoxDecoration(
                          color: Colors.black12,
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        child: Row(
                          children: <Widget>[
                            Icon(
                              Icons.search,
                              color: Theme.of(context).iconTheme.color,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              "Search_Hint_Text",
                              style: Theme.of(context).textTheme.labelLarge,
                            ).tr(),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
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
                  WarrantiesListTiles(
                    onPressed: () {},
                    title: "Helpline",
                    leadingIcon: Icons.phone_outlined,
                    subTitle: "Helpline_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {},
                    title: "Verify_Profiles",
                    leadingIcon: Icons.safety_check,
                    subTitle: "Verify_Profiles_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {},
                    title: "Fair_Compensation",
                    leadingIcon: Icons.thumb_up_alt,
                    subTitle: "Fair_Compensation_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {},
                    title: "Insured_Services",
                    leadingIcon: Icons.work,
                    subTitle: "Insured_Services_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {},
                    title: "Cancellation_Protection",
                    leadingIcon: Icons.phone_outlined,
                    subTitle: "Cancellation_Protection_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {},
                    title: "Secure_Payments",
                    leadingIcon: Icons.security_outlined,
                    subTitle: "Secure_Payments_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
