import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
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
        appBarTheme: const AppBarTheme(
          // iconTheme: IconThemeData(color: Colors.black),
          // color: Colors.deepPurpleAccent,
          // foregroundColor: Colors.black,
          systemOverlayStyle: SystemUiOverlayStyle( //<-- SEE HERE
            // Status bar color
            statusBarColor: Colors.white,
            statusBarIconBrightness: Brightness.dark,
            statusBarBrightness: Brightness.light,
          ),
        ),
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
            fontWeight: FontWeight.w700,
            fontFamily: 'Cerebri Sans Bold',
          ),
          titleSmall: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontFamily: 'Cerebri Sans Bold',
          ),
          bodyLarge: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w900,
            fontFamily: 'Cerebri Sans Regular',
          ),
          bodyMedium: TextStyle(
            fontSize: 16,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontFamily: 'Cerebri Sans Regular',
          ),
          bodySmall: TextStyle(
            fontSize: 14,
            color: Colors.black,
            fontWeight: FontWeight.w700,
            fontFamily: 'Cerebri Sans Regular',
          ),
          labelLarge: TextStyle(
            fontSize: 16,
            color: Colors.black38,
            fontWeight: FontWeight.w700,
            fontFamily: 'Cerebri Sans Regular',
          ),
          labelMedium: TextStyle(
            fontSize: 14,
            color: Colors.black38,
            fontWeight: FontWeight.w500,
            fontFamily: 'Cerebri Sans Regular',
          ),
          labelSmall: TextStyle(
            fontSize: 12,
            color: Colors.black38,
            fontWeight: FontWeight.w500,
            fontFamily: 'Cerebri Sans Regular',
          ),
          displayLarge: TextStyle(
            fontSize: 16,
            color: Colors.black38,
            fontWeight: FontWeight.normal,
            fontFamily: 'Cerebri Sans Regular',
          ),
          displayMedium: TextStyle(
            fontSize: 14,
            color: Colors.black38,
            fontWeight: FontWeight.normal,
            fontFamily: 'Cerebri Sans Regular',
          ),
          displaySmall: TextStyle(
            fontSize: 12,
            color: Colors.black38,
            fontWeight: FontWeight.normal,
            fontFamily: 'Cerebri Sans Regular',
          ),
        ),
        iconTheme: const IconThemeData(
          color: Colors.black38,
          size: 30,
        ),
      ),
      initialRoute: MyRoutes.HOMETABROUTE,
      routes: {
        MyRoutes.HOMETABROUTE: (ctx) => const MyHomeScreen(),
        MyRoutes.SEARCHROUTE: (ctx) => const SearchScreen(),
      },
    );
  }
}
