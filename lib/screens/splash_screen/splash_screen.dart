import 'package:flutter/material.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:provider/provider.dart';

import '../../providers/categories_provider/main_categories_provider.dart';

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
      Provider.of<MainCategoriesProvider>(context).getMainCategories().then(
            (value) => Navigator.of(context)
                .pushReplacementNamed(MyRoutes.HOMETABROUTE),
          );
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
