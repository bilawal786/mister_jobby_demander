import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:mister_jobby/providers/const_provider/mujeeb_const_provider.dart';



// import 'package:mister_jobby/providers/const_provider/mujeeb_const_provider.dart';

import 'package:provider/provider.dart';
import './helpers/routes.dart';
import './providers/categories_provider/main_categories_provider.dart';
import './screens/splash_screen/splash_screen.dart';
import './screens/home_screens/search_screen.dart';
import './screens/home_screens/home_tabs_screen.dart';
import './screens/home_screens/services_sub_categories/sub_categories_screen.dart';
import './screens/home_screens/services_sub_categories/child_categories_screen.dart';
import './screens/home_screens/services_sub_categories/disassemble_furniture_screen.dart';
import './screens/home_screens/services_sub_categories/curtain_rod_installation_screen.dart';
import './screens/home_screens/services_sub_categories/fixing_shelves_screen.dart';
import './screens/home_screens/services_sub_categories/hang_tv_screen.dart';
import './screens/home_screens/services_sub_categories/shower_installation_screen.dart';
import './screens/home_screens/services_sub_categories/hang_picture_screen.dart';
import './screens/home_screens/services_sub_categories/mirror_installation_screen.dart';
import './screens/home_screens/services_sub_categories/furniture_repair_screen.dart';
import './screens/home_screens/services_sub_categories/small_repair_screen.dart';
import './screens/home_screens/services_sub_categories/fence_installation_screen.dart';
import './screens/home_screens/services_sub_categories/hood_installation_screen.dart';
import './screens/home_screens/services_sub_categories/landscaping_job_screen.dart';
import './screens/home_screens/services_sub_categories/electrical_installation_screen.dart';
import './screens/home_screens/services_sub_categories/bulb_installation_screen.dart';
import './screens/home_screens/services_sub_categories/lamp_installation_screen.dart';
import './screens/home_screens/services_sub_categories/automation_screen.dart';
import './screens/home_screens/services_sub_categories/ac_installation_screen.dart';
import './screens/home_screens/services_sub_categories/painting_installation_screen.dart';
import './screens/home_screens/services_sub_categories/parquet_installation_screen.dart';
import './screens/home_screens/services_sub_categories/tiles_installation_screen.dart';
import './screens/home_screens/services_sub_categories/carpet_installation_screen.dart';
import './screens/home_screens/services_sub_categories/coat_wall_screen.dart';
import './screens/home_screens/services_sub_categories/lining_installation_screen.dart';
import './screens/home_screens/services_sub_categories/water_installation_screen.dart';
import './screens/home_screens/services_sub_categories/flush_installation_screen.dart';
import './screens/home_screens/services_sub_categories/faucet_installation_screen.dart';
import './screens/home_screens/services_sub_categories/sink_installation_screen.dart';
import './screens/home_screens/services_sub_categories/washing_machine_screen.dart';
import './screens/home_screens/services_sub_categories/toilet_installation_screen.dart';
import './screens/home_screens/services_sub_categories/sink_drain_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/mow_lawn_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/hedge_trimming_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/cut_tree_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/clearing_screen.dart';
import './screens/home_screens/warranties_screens/helpline_screen.dart';
import './screens/home_screens/warranties_screens/all_profile_verified_screen.dart';
import './screens/home_screens/warranties_screens/cancellation_protection_screen.dart';
import './screens/home_screens/warranties_screens/fair_compensation_screen.dart';
import './screens/home_screens/warranties_screens/insured_services_screen.dart';
import './screens/home_screens/warranties_screens/secure_payments_screen.dart';
import './screens/home_screens/services_sub_categories/furniture_assemble_screen.dart';
import './providers/const_provider/const_provider.dart';


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
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (ctx) => MainCategoriesProvider()),
        ChangeNotifierProvider(create: (ctx) => ConstProvider()),
        ChangeNotifierProvider(create: (ctx) => MujeebConstProvider()),
      ],
      child: MaterialApp(
        localizationsDelegates: context.localizationDelegates,
        supportedLocales: context.supportedLocales,
        locale: context.locale,
        debugShowCheckedModeBanner: false,
        title: 'Mister Jobby',
        theme: ThemeData(
          brightness: Brightness.light,
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.blue),
          scaffoldBackgroundColor: Colors.white,
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
              fontWeight: FontWeight.normal,
              fontFamily: 'Cerebri Sans Bold',
            ),
            bodyMedium: TextStyle(
              fontSize: 16,
              color: Colors.black,
              fontWeight: FontWeight.normal,
              fontFamily: 'Cerebri Sans Bold',
            ),
            bodySmall: TextStyle(
              fontSize: 14,
              color: Colors.black,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.8,
              fontFamily: 'Cerebri Sans Regular',
            ),
            labelLarge: TextStyle(
              fontSize: 16,
              color: Colors.black54,
              fontWeight: FontWeight.w700,
              fontFamily: 'Cerebri Sans Regular',
            ),
            labelMedium: TextStyle(
              fontSize: 14,
              color: Colors.black38,
              fontWeight: FontWeight.w700,
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
          buttonTheme: ButtonThemeData(
            buttonColor: Theme.of(context).primaryColor,
            textTheme: ButtonTextTheme.normal,
          ),
        ),
        initialRoute: MyRoutes.SPLASHROUTE,
        routes: {
          MyRoutes.SPLASHROUTE: (ctx) => const SplashScreen(),
          MyRoutes.HOMETABROUTE: (ctx) => const MyHomeBottomTabScreen(),
          MyRoutes.SUBCATEGORYROUTE: (ctx) => const SubCategoriesScreen(),
          MyRoutes.CHILDCATEGORYROUTE: (ctx) => const ChildCategoriesScreen(),
          MyRoutes.ASSEMBLEFURNITUREROUTE: (ctx) => const FurnitureAssembleScreen(),
          MyRoutes.DISASSEMBLEFURNITURESROUTE: (ctx) => const DisassembleFurnitureScreen(),
          MyRoutes.CURTAININSTALLATIONROUTE: (ctx) => const CurtainInstallationScreen(),
          MyRoutes.FIXINGSHELVESROUTE: (ctx) => const FixingShelvesScreen(),
          MyRoutes.HANGTVROUTE: (ctx) => const HangTVScreen(),
          MyRoutes.SHOWERINSTALLATIONROUTE: (ctx) => const ShowerInstallationScreen(),
          MyRoutes.HANGPICTREROUTE: (ctx) => const HangPictureScreen(),
          MyRoutes.MIRRORINSTALLATIONROUTE: (ctx) => const MirrorInstallationScreen(),
          MyRoutes.FURNITUREREPAIRROUTE: (ctx) => const FurnitureRepairScreen(),
          MyRoutes.SMALLREPAIRROUTE: (ctx) => const SmallRepairScreen(),
          MyRoutes.FENCEINSTALLATIONROUTE: (ctx) => const FenceInstallationScreen(),
          MyRoutes.SINKINSTALLATIONROUTE: (ctx) => const SinkInstallationScreen(),
          MyRoutes.HOODINSTALLATIONROUTE: (ctx) => const HoodInstallationScreen(),
          MyRoutes.LANDSCAPINGHOODROUTE: (ctx) => const LandscapingJobScreen(),
          MyRoutes.ELECTRICALINSTALLATIONROUTE: (ctx) => const ElectricalInstallationScreen(),
          MyRoutes.BULBINSTALLATIONROUTE: (ctx) => const BulbInstallationScreen(),
          MyRoutes.LAMPINSTALLATIONROUTE: (ctx) => const LampInstallationScreen(),
          MyRoutes.AUTOMATIONROUTE: (ctx) => const AutomationScreen(),
          MyRoutes.ACINSTALLATIONROUTE: (ctx) => const ACInstallationScreen(),
          MyRoutes.PAINTINGINSTALLATIOROUTE: (ctx) => PaintingInstallationScreen(),
          MyRoutes.PARQUETINSTALLATIOROUTE: (ctx) => ParquetInstallationScreen(),
          MyRoutes.TILESINSTALLATIOROUTE: (ctx) => TilesInstallationScreen(),
          MyRoutes.CARPETINSTALLATIOROUTE: (ctx) => CarpetInstallationScreen(),
          MyRoutes.COATWALLROUTE: (ctx) => CoatWallScreen(),
          MyRoutes.LININGINSTALLATIONROUTE: (ctx) => LiningInstallationScreen(),
          MyRoutes.WATERINSTALLATIONROUTE: (ctx) => WaterInstallationScreen(),
          MyRoutes.FLUSHINSTALLATIONROUTE: (ctx) => FlushInstallationScreen(),
          MyRoutes.FAUCETINSTALLATIONROUTE: (ctx) =>FaucetInstallationScreen(),
          MyRoutes.WASHINGMACHINEROUTE: (ctx) =>WashingMachineScreen(),
          MyRoutes.TOILETINSTALLATIONROUTE: (ctx) => ToiletInstallationScreen(),
          MyRoutes.SINKDRAINROUTE: (ctx) => SinkDrainScreen(),
          MyRoutes.MOWLAWNROUTE: (ctx) => MowLawnScreen(),
          MyRoutes.HEDGETRIMMINGROUTE: (ctx) => HedgeTrimmingScreen(),
          MyRoutes.CUTTREEROUTE: (ctx) => CutTreeScreen(),
          MyRoutes.CLEARINGROUTE: (ctx) => ClearingScreen(),
          MyRoutes.SEARCHROUTE: (ctx) => const SearchScreen(),
          MyRoutes.HELPLINEROUTE: (ctx) => const HelpLineScreen(),
          MyRoutes.ALLPROFILEVERIFIEDROUTE: (ctx) => const AllProfileVerifiedScreen(),
          MyRoutes.FAIRCOMPENSATIONROUTE: (ctx) => const FairCompensationScreen(),
          MyRoutes.INSUREDSERVICESROUTE: (ctx) => const InsuredServicesScreen(),
          MyRoutes.CANCELLATIONPROTECTIONROUTE: (ctx) => const CancellationProtectionScreen(),
          MyRoutes.SECUREPAYMENTSROUTE: (ctx) => const SecurePaymentsScreen(),
        },
      ),
    );
  }
}
