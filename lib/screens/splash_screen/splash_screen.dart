import 'package:flutter/material.dart';
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
      Provider.of<BannerProvider>(context).getBanner();
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
