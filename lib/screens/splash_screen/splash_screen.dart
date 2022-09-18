import 'package:flutter/material.dart';
import 'package:mister_jobby/providers/accounts_providers/profile_provider.dart';
import 'package:mister_jobby/providers/accounts_providers/useful_information_providers/faq_provider.dart';
import 'package:provider/provider.dart';

import '../../helpers/routes.dart';
import '../../providers/banner_provider/banner_provider.dart';
import '../../providers/categories_provider/main_categories_provider.dart';
import '../../providers/country_provider/country_list_provider.dart';
import '../../providers/preferences_provider/preferences_provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var _isInit = true;
  var loading = true;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (_isInit) {
      Provider.of<PreferencesProvider>(context, listen: false).checkToken();
      Provider.of<MainCategoriesProvider>(context).getMainCategories().then(
            (value) => Navigator.of(context)
                .pushReplacementNamed(MyRoutes.HOMETABROUTE),
          );
      Provider.of<CountryProvider>(context).getCountries();
      Provider.of<ProfileProvider>(context, listen: false).getProfile();
      Provider.of<BannerProvider>(context).getBanner();
      Provider.of<FAQProvider>(context).getFAQ();
    }
    _isInit = false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Center(
          child: Image.asset("assets/images/appLogo.png"),
        ));
  }
}
