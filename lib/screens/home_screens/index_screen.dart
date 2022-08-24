import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mister_jobby/widgets/home_screen_widgets/warranties_list_tiles.dart';
import 'package:carousel_slider/carousel_slider.dart';

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
              elevation: 0,
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
              centerTitle: false,
              backgroundColor: Colors.white,
              bottom: TabBar(
                // padding: const EdgeInsets.symmetric(vertical: 10.0),
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
                    style: Theme.of(context).textTheme.titleSmall,
                  ).tr(),
                  const ServicesGrid(),
                  Text(
                    "Popular_Services",
                    style: Theme.of(context).textTheme.titleSmall,
                  ).tr(),
                  const PopularServicesListView(),
                  CarouselSlider.builder(
                    options: CarouselOptions(
                      height: MediaQuery.of(context).size.width / 2,
                      aspectRatio: 16 / 9,
                      viewportFraction: 1,
                      initialPage: 0,
                      enableInfiniteScroll: true,
                      reverse: false,
                      autoPlay: true,
                      autoPlayInterval: const Duration(seconds: 5),
                      autoPlayAnimationDuration:
                          const Duration(milliseconds: 800),
                      autoPlayCurve: Curves.fastOutSlowIn,
                      enlargeCenterPage: true,
                      scrollDirection: Axis.horizontal,
                    ),
                    itemCount: 2,
                    itemBuilder: (context, index, realIndex) => ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: const FadeInImage(
                        placeholder: AssetImage("assets/images/loading.gif"),
                        image: NetworkImage(
                          "https://s3-us-west-2.amazonaws.com/prd-rteditorial/wp-content/uploads/2020/07/31142105/700StopMotion.jpg",
                        ),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    "Warranties",
                    style: Theme.of(context).textTheme.bodyLarge,
                  ).tr(),
                  const SizedBox(
                    height: 15,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {
                      navigator.pushNamed(MyRoutes.HELPLINEROUTE);
                    },
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
