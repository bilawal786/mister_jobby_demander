import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:mister_jobby/helpers/routes.dart';
import 'package:mister_jobby/screens/home_screens/search_screen.dart';

import './screens/home_tabs_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
      ],
      path: 'assets/languages',
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        brightness: Brightness.light,
        colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
        // fontFamily: 'Cerebri Sans Bold',
        textTheme: const TextTheme(
          titleLarge: TextStyle(
            fontSize: 36,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontFamily: 'Cerebri Sans Bold',
          ),
          titleMedium: TextStyle(
            fontSize: 22,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
          titleSmall: TextStyle(
            fontSize: 18,
            color: Colors.black,
            // fontWeight: FontWeight.w300,
          ),
          bodyLarge: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontFamily: 'Cerebri Sans Regular',
          ),
          bodyMedium: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
          bodySmall: TextStyle(
            fontSize: 13,
            color: Colors.black,
            fontWeight: FontWeight.normal,
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black38,
          size: 30,
        ),
      ),

      initialRoute: MyRoutes.HOMETABROUTE,

      routes: {
        MyRoutes.HOMETABROUTE: (ctx)=> const MyHomeScreen(),
        MyRoutes.SEARCHROUTE: (ctx)=> const SearchScreen(),
      },
    );
  }
}

