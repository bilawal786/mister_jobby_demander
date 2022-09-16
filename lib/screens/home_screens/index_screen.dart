import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:provider/provider.dart';

import '../../helpers/routes.dart';
import '../../providers/preferences_provider/preferences_provider.dart';
import '../../widgets/home_screen_widgets/services_grid.dart';
import '../../widgets/home_screen_widgets/popular_services_listview.dart';
import '../../widgets/const_widgets/search_button.dart';
import '../../widgets/home_screen_widgets/warranties_list_tiles.dart';
import '../../providers/banner_provider/banner_provider.dart';

class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  State<IndexScreen> createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {
  var isInit = true;

  @override
  void didChangeDependencies() {
    if (isInit) {
      Provider.of<PreferencesProvider>(context, listen: false).checkToken();
    }
    isInit = false;
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    final prefData = Provider.of<PreferencesProvider>(context, listen: false);
    final bannerData = Provider.of<BannerProvider>(context, listen: false);
    final extractedBanner = bannerData.myBanner;
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
              actions: [
                IconButton(
                  onPressed: () {
                    navigator.pushNamed(MyRoutes.NOTIFICATIONDISPLAYROUTE);
                  },
                  icon: Icon(
                    Icons.notifications_none_outlined,
                     color: Theme.of(context).iconTheme.color,
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width/40,),
              ],
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
                      child: const SearchButton(),
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
                  prefData.token == 'null'
                      ? const SizedBox()
                      : extractedBanner != null
                          ? CarouselSlider.builder(
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
                              itemCount: extractedBanner.length,
                              itemBuilder: (context, index, realIndex) =>
                                  ClipRRect(
                                borderRadius: BorderRadius.circular(10.0),
                                child: FadeInImage(
                                  placeholder: const AssetImage(
                                      "assets/images/loading.gif"),
                                  image: NetworkImage(
                                    "${MyRoutes.IMAGEURL}/${extractedBanner[index].sliderImage}",
                                  ),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            )
                          : const Center(
                              child: CircularProgressIndicator(),
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
                    onPressed: () {
                      navigator.pushNamed(MyRoutes.ALLPROFILEVERIFIEDROUTE);
                    },
                    title: "Verify_Profiles",
                    leadingIcon: Icons.safety_check,
                    subTitle: "Verify_Profiles_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {
                      navigator.pushNamed(MyRoutes.FAIRCOMPENSATIONROUTE);
                    },
                    title: "Fair_Compensation",
                    leadingIcon: Icons.thumb_up_alt,
                    subTitle: "Fair_Compensation_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {
                      navigator.pushNamed(MyRoutes.INSUREDSERVICESROUTE);
                    },
                    title: "Insured_Services",
                    leadingIcon: Icons.work,
                    subTitle: "Insured_Services_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {
                      navigator.pushNamed(MyRoutes.CANCELLATIONPROTECTIONROUTE);
                    },
                    title: "Cancellation_Protection",
                    leadingIcon: Icons.phone_outlined,
                    subTitle: "Cancellation_Protection_Subtitle",
                    trailingIcon: Icons.arrow_forward_ios_outlined,
                  ),
                  WarrantiesListTiles(
                    onPressed: () {
                      navigator.pushNamed(MyRoutes.SECUREPAYMENTSROUTE);
                    },
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
