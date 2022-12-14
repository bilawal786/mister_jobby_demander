import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter/foundation.dart' show kIsWeb;
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:mister_jobby/providers/auth_provider/forget_password_provider.dart';
import 'package:mister_jobby/providers/categories_provider/search_categories_provider.dart';
import 'package:mister_jobby/providers/coordinates_provider.dart';
import 'package:mister_jobby/providers/jobs_provider/jobs_compleleted_provider.dart';
import 'package:mister_jobby/screens/accounts_screens/manage_accounts/my_transaction_screen.dart';
import 'package:mister_jobby/screens/accounts_screens/manage_accounts/reviews_screen.dart';
import './providers/jobs_provider/job_proposals_provider.dart';
import 'package:mister_jobby/screens/accounts_screens/manage_accounts/insurance.dart';
import 'package:mister_jobby/screens/accounts_screens/manage_accounts/notifications.dart';
import 'package:mister_jobby/screens/accounts_screens/manage_accounts/tax_credit.dart';
import 'package:mister_jobby/screens/accounts_screens/manage_accounts/term_and_conditions.dart';
import 'package:mister_jobby/screens/accounts_screens/manage_accounts/trust_and_security.dart';
import 'package:provider/provider.dart';
import 'package:flutter_stripe/flutter_stripe.dart';
import './helpers/routes.dart';
import './providers/categories_provider/main_categories_provider.dart';
import './providers/auth_provider/register_provider.dart';
import './providers/banner_provider/banner_provider.dart';
import './providers/jobs_provider/jobs_in_progress_provider.dart';
import './providers/preferences_provider/preferences_provider.dart';
import './screens/splash_screen/splash_screen.dart';
import './screens/home_screens/search_screen.dart';
import './providers/accounts_providers/profile_provider.dart';
import './providers/accounts_providers/useful_information_providers/faq_provider.dart';
import './screens/accounts_screens/useful_information/faq_screen.dart';
import './screens/home_screens/notification_display.dart';
import './screens/home_screens/services_sub_categories/sub_categories_screen.dart';
import './screens/home_screens/services_sub_categories/child_categories_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/disassemble_furniture_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/fixing_shelves_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/furniture_repair_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/small_repair_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/hood_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/electrical_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/bulb_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/lamp_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/ac_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/faucet_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/sink_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/mow_lawn_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/hedge_trimming_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/cut_tree_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/clearing_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/weeding_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/maintenance_green_spaces_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/lawn_care_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/terrace_cleaning_screen.dart';
import './screens/home_screens/warranties_screens/helpline_screen.dart';
import './screens/home_screens/warranties_screens/all_profile_verified_screen.dart';
import './screens/home_screens/warranties_screens/cancellation_protection_screen.dart';
import './screens/home_screens/warranties_screens/fair_compensation_screen.dart';
import './screens/home_screens/warranties_screens/insured_services_screen.dart';
import './screens/home_screens/warranties_screens/secure_payments_screen.dart';
import './providers/const_provider/const_provider.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/automation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/carpet_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/coat_wall_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/curtain_rod_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/fence_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/flush_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/furniture_assemble_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/hang_picture_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/hang_tv_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/landscaping_job_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/lining_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/mirror_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/painting_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/parquet_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/shower_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/sink_drain_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/tiles_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/toilet_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/washing_machine_screen.dart';
import './screens/home_screens/services_sub_categories/process_child_category_screens/water_installation_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/gardening_job_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/moving_assistance_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/moving_furniture_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/moving_appliances_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/rid_clutter_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/job_removal_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/furniture_delivery_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/appliance_delivery_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/letters_delivery_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/shopping_delivery_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/home_cleaning_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/ironing_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/car_wash_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/pool_washing_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/window_cleaning_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/cleaning_job_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/dog_sitter_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/keep_cat_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/keep_animals_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/clean_computer_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/computer_courses_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/install_printer_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/other_computer_job_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/home_care_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/medicine_delivery_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/deliver_groceries_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/home_delivery_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/accompaniment_race_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/accompaniment_medical_appointment_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/prepare_meal_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/waiter_waitress_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/sewing_alteration_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/french_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/child_care.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/photography_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/home_chef_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/bartender_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/waiter_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/dj_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/animator_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/flyers_distribution_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/host_hotess_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/administrative_tasks_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/vehicle_maintenance_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/vehicle_repair_screen.dart';
import './screens/home_screens/services_sub_categories/process_sub_categories_screens/troubleshooting_screen.dart';
import './screens/auth_screens/login_screen.dart';
import './screens/auth_screens/register_screen.dart';
import './providers/auth_provider/login_provider.dart';
import './providers/country_provider/country_list_provider.dart';
import './screens/accounts_screens/manage_accounts/personal_information.dart';
import './screens/accounts_screens/products/gift.dart';
import './screens/accounts_screens/manage_accounts/balance_screen.dart';
import './screens/accounts_screens/manage_accounts/my_tickets.dart';
import './screens/accounts_screens/manage_accounts/help_center.dart';
import './screens/accounts_screens/manage_accounts/ticket_scannar_screen.dart';
import './screens/accounts_screens/useful_information/about_us_screen.dart';
import './screens/jobs_screens/jobs_tab_screens/comment_screen.dart';
import './providers/jobs_provider/single_job_comments_provider.dart';
import 'providers/accounts_providers/about_provider/about_provider.dart';
import 'providers/accounts_providers/cesu_ticket_provider/csey_ticket_provider.dart';
import 'providers/accounts_providers/gift_card_provider/gift_card_provider.dart';
import 'providers/accounts_providers/my_balance_provider/my_balance_provider.dart';
import 'providers/accounts_providers/terms_and_condition_provider/terms_and_condition_provider.dart';
import 'providers/accounts_providers/transaction_provider/transaction_provider.dart';
import 'providers/chat_provider.dart';
import 'providers/jobs_provider/cancel_reservation_provider.dart';
import 'providers/jobs_provider/edit_jobs_provider.dart';
import 'providers/jobs_provider/job_reservation_provider.dart';
import 'providers/jobs_provider/rating_reviews_provider.dart';
import 'providers/notification_provider/notification_provider.dart';
import 'screens/accounts_screens/manage_accounts/add_ticket_manually.dart';
import 'screens/accounts_screens/manage_accounts/tax_certificate.dart';
import 'screens/error_screen.dart';
import 'screens/home_screens/services_sub_categories/process_sub_categories_steps/equipment_rental_step.dart';

late final FirebaseMessaging _messaging;
const AndroidNotificationChannel channel = AndroidNotificationChannel(
  'high_importance_channel', // id
  'High Important Notification', // name, title
  // 'This channel is used for important notification', // description
  importance: Importance.high,
  playSound: true,
);
final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    FlutterLocalNotificationsPlugin();

Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp();
  // print('A bg message just showed up : ${message.messageId}');
}

 void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await EasyLocalization.ensureInitialized();
  if(!kIsWeb){
    await Firebase.initializeApp();
    // 2. Instantiate Firebase Messaging
    _messaging = FirebaseMessaging.instance;

    // 3. On iOS, this helps to take the user permissions
    NotificationSettings settings = await _messaging.requestPermission(
      alert: true,
      badge: true,
      provisional: false,
      sound: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      // print('User granted permission');
      // TODO: handle the received notifications
    } else {
      // print('User declined or has not accepted permission');
    }

    FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
        AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
    await FirebaseMessaging.instance
        .setForegroundNotificationPresentationOptions(
      alert: true,
      badge: true,
      sound: true,
    );

    final token = await FirebaseMessaging.instance.getToken();
    debugPrint("firebase token: $token");

    Stripe.publishableKey =
    'pk_test_mhfC6RVLoiK6pNLoINPHyjGO00LXtQiByW';
    await Stripe.instance.applySettings();
  }
  runApp(
    EasyLocalization(
      supportedLocales: const [
        // Locale('en'),
        Locale('fr'),
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
        ChangeNotifierProvider(create: (ctx) => CountryProvider()),
        ChangeNotifierProvider(create: (ctx) => ConstProvider()),
        ChangeNotifierProvider(create: (ctx) => LoginProvider()),
        ChangeNotifierProvider(create: (ctx) => RegisterProvider()),
        ChangeNotifierProvider(create: (ctx) => PreferencesProvider()),
        ChangeNotifierProvider(create: (ctx) => BannerProvider()),
        ChangeNotifierProvider(create: (ctx) => JobsInProgressProvider()),
        ChangeNotifierProvider(create: (ctx) => ProfileProvider()),
        ChangeNotifierProvider(create: (ctx) => FAQProvider()),
        ChangeNotifierProvider(create: (ctx) => JobProposalsProvider()),
        ChangeNotifierProvider(
          create: (ctx) => SingleJobCommentsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => TermsAndConditionProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => AboutProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => EditJobsProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => NotificationProvider(),
        ),
        ChangeNotifierProvider(
          create: (ctx) => JobReservationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => JobsCompletedProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ForgetPasswordProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => RatingProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CoordinateProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CseuTicketProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => MyBalanceProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => GiftCardProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => TransactionProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => SearchCategoriesProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => CancelReservationProvider(),
        ),
        ChangeNotifierProvider(
          create: (context) => ChatProvider(),
        ),
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
            systemOverlayStyle: SystemUiOverlayStyle(
              //<-- SEE HERE
              // Status bar color
              statusBarColor: Colors.transparent,
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
            color: Colors.black,
            size: 25,
          ),
          buttonTheme: ButtonThemeData(
            buttonColor: Theme.of(context).primaryColor,
            textTheme: ButtonTextTheme.normal,
          ),
        ),
        initialRoute: MyRoutes.SPLASHROUTE,
        routes: {
          MyRoutes.SPLASHROUTE: (ctx) => const SplashScreen(),
          // MyRoutes.HOMETABROUTE: (ctx) => const MyHomeBottomTabScreen(),
          MyRoutes.SUBCATEGORYROUTE: (ctx) => const SubCategoriesScreen(),
          MyRoutes.CHILDCATEGORYROUTE: (ctx) => const ChildCategoriesScreen(),
          MyRoutes.ASSEMBLEFURNITUREROUTE: (ctx) =>
              const FurnitureAssembleScreen(),
          MyRoutes.DISASSEMBLEFURNITURESROUTE: (ctx) =>
              const DisassembleFurnitureScreen(),
          MyRoutes.CURTAININSTALLATIONROUTE: (ctx) =>
              const CurtainInstallationScreen(),
          MyRoutes.FIXINGSHELVESROUTE: (ctx) => const FixingShelvesScreen(),
          MyRoutes.HANGTVROUTE: (ctx) => const HangTVScreen(),
          MyRoutes.SHOWERINSTALLATIONROUTE: (ctx) =>
              const ShowerInstallationScreen(),
          MyRoutes.HANGPICTREROUTE: (ctx) => const HangPictureScreen(),
          MyRoutes.MIRRORINSTALLATIONROUTE: (ctx) =>
              const MirrorInstallationScreen(),
          MyRoutes.FURNITUREREPAIRROUTE: (ctx) => const FurnitureRepairScreen(),
          MyRoutes.SMALLREPAIRROUTE: (ctx) => const SmallRepairScreen(),
          MyRoutes.FENCEINSTALLATIONROUTE: (ctx) =>
              const FenceInstallationScreen(),
          MyRoutes.SINKINSTALLATIONROUTE: (ctx) =>
              const SinkInstallationScreen(),
          MyRoutes.HOODINSTALLATIONROUTE: (ctx) =>
              const HoodInstallationScreen(),
          MyRoutes.LANDSCAPINGHOODROUTE: (ctx) => const LandscapingJobScreen(),
          MyRoutes.ELECTRICALINSTALLATIONROUTE: (ctx) =>
              const ElectricalInstallationScreen(),
          MyRoutes.BULBINSTALLATIONROUTE: (ctx) =>
              const BulbInstallationScreen(),
          MyRoutes.LAMPINSTALLATIONROUTE: (ctx) =>
              const LampInstallationScreen(),
          MyRoutes.AUTOMATIONROUTE: (ctx) => const AutomationScreen(),
          MyRoutes.ACINSTALLATIONROUTE: (ctx) => const ACInstallationScreen(),
          MyRoutes.PAINTINGINSTALLATIOROUTE: (ctx) =>
              const PaintingInstallationScreen(),
          MyRoutes.PARQUETINSTALLATIOROUTE: (ctx) =>
              const ParquetInstallationScreen(),
          MyRoutes.TILESINSTALLATIOROUTE: (ctx) =>
              const TilesInstallationScreen(),
          MyRoutes.CARPETINSTALLATIOROUTE: (ctx) =>
              const CarpetInstallationScreen(),
          MyRoutes.COATWALLROUTE: (ctx) => const CoatWallScreen(),
          MyRoutes.LININGINSTALLATIONROUTE: (ctx) =>
              const LiningInstallationScreen(),
          MyRoutes.WATERINSTALLATIONROUTE: (ctx) =>
              const WaterInstallationScreen(),
          MyRoutes.FLUSHINSTALLATIONROUTE: (ctx) =>
              const FlushInstallationScreen(),
          MyRoutes.FAUCETINSTALLATIONROUTE: (ctx) =>
              const FaucetInstallationScreen(),
          MyRoutes.WASHINGMACHINEROUTE: (ctx) => const WashingMachineScreen(),
          MyRoutes.TOILETINSTALLATIONROUTE: (ctx) =>
              const ToiletInstallationScreen(),
          MyRoutes.SINKDRAINROUTE: (ctx) => const SinkDrainScreen(),
          MyRoutes.MOWLAWNROUTE: (ctx) => const MowLawnScreen(),
          MyRoutes.HEDGETRIMMINGROUTE: (ctx) => const HedgeTrimmingScreen(),
          MyRoutes.CUTTREEROUTE: (ctx) => const CutTreeScreen(),
          MyRoutes.CLEARINGROUTE: (ctx) => const ClearingScreen(),
          MyRoutes.WEEDINGROUTE: (ctx) => const WeedingScreen(),
          MyRoutes.MAINTENANCEGREENSPACEROUTE: (ctx) =>
              const MaintenanceGreenSpacesScreen(),
          MyRoutes.LAWNCAREROUTE: (ctx) => const LawnCareScreen(),
          MyRoutes.TERRACECLEANINGROUTE: (ctx) => const TerraceCleaningScreen(),
          MyRoutes.GARDENINGJOBROUTE: (ctx) => const GardeningJobScreen(),
          MyRoutes.MOVINGASSISTANCEROUTE: (ctx) =>
              const MovingAssistanceScreen(),
          MyRoutes.MOVINGFURNITUREROUTE: (ctx) => const MovingFurnitureScreen(),
          MyRoutes.MOVINGAPPLIANCESROUTE: (ctx) =>
              const MovingAppliancesScreen(),
          MyRoutes.RIDCLUTTERROUTE: (ctx) => const RidClutterScreen(),
          MyRoutes.JOBREMOVALROUTE: (ctx) => const JobRemovalScreen(),
          MyRoutes.FURNITUREDELIVERYROUTE: (ctx) =>
              const FurnitureDeliveryScreen(),
          MyRoutes.APPLIANCEDELIVERYROUTE: (ctx) =>
              const ApplianceDeliveryScreen(),
          MyRoutes.LETTERSDELIVERYROUTE: (ctx) => const LettersDeliveryScreen(),
          MyRoutes.RACEDELIVERYROUTE: (ctx) => const ShoppingDeliveryScreen(),
          MyRoutes.HOMECLEANINGROUTE: (ctx) => const HomeCleaningScreen(),
          MyRoutes.IRONINGROUTE: (ctx) => const IroningScreen(),
          MyRoutes.CARWASHROUTE: (ctx) => const CarWashScreen(),
          MyRoutes.POOLWASHINGROUTE: (ctx) => const PoolWashingScreen(),
          MyRoutes.WINDOWCLEANINGROUTE: (ctx) => const WindowCleaningScreen(),
          MyRoutes.CLEANINGJOBROUTE: (ctx) => const CleaningJobScreen(),
          MyRoutes.DOGSITTERROUTE: (ctx) => const DogSitterScreen(),
          MyRoutes.KEEPCATROUTE: (ctx) => const KeepCatScreen(),
          MyRoutes.KEEPANIMALSROUTE: (ctx) => const KeepAnimalsScreen(),
          MyRoutes.CLEANCOMPUTERROUTE: (ctx) => const CleanComputerScreen(),
          MyRoutes.COMPUTERCOURSESROUTE: (ctx) => const ComputerCoursesScreen(),
          MyRoutes.INSTALLPRINTERROUTE: (ctx) => const InstallPrinterScreen(),
          MyRoutes.COMPUTERJOBROUTE: (ctx) => const ComputerJobScreen(),
          MyRoutes.HOMECAREROUTE: (ctx) => const HomeCareScreen(),
          MyRoutes.MEDICINEDELIVERYROUTE: (ctx) =>
              const MedicineDeliveryScreen(),
          MyRoutes.DELIVERGROCERIESROUTE: (ctx) =>
              const DeliverGroceriesScreen(),
          MyRoutes.HOMEDELIVERYROUTE: (ctx) => const HomeDeliveryScreen(),
          MyRoutes.ACCOMPANIMENTRACEROUTE: (ctx) =>
              const AccompanimentRaceScreen(),
          MyRoutes.ACCOMPANIMENTMEDICALAPPOINTMENTROUTE: (ctx) =>
              const AccompanimentMedicalAppointmentScreen(),
          MyRoutes.PREPAREMEALROUTE: (ctx) => const PrepareMealScreen(),
          MyRoutes.WAITERWAITRESSROUTE: (ctx) => const WaiterWaitressScreen(),
          MyRoutes.SEWINGALTERATIONROUTE: (ctx) =>
              const SewingAlterationScreen(),
          MyRoutes.FRENCHROUTE: (ctx) => const FrenchScreen(),
          MyRoutes.PHOTOGRAPHYROUTE: (ctx) => const PhotographyScreen(),
          MyRoutes.HOMECHEFROUTE: (ctx) => const HomeChefScreen(),
          MyRoutes.BARTENDERROUTE: (ctx) => const BartenderScreen(),
          MyRoutes.WAITERROUTE: (ctx) => const WaiterScreen(),
          MyRoutes.DJROUTE: (ctx) => const DJScreen(),
          MyRoutes.ANIMATORROUTE: (ctx) => const AnimatorScreen(),
          MyRoutes.FLYERSDISTRIBUTIONROUTE: (ctx) =>
              const FlyersDistributionScreen(),
          MyRoutes.HOSTHOTESSROUTE: (ctx) => const HostHostessScreen(),
          MyRoutes.ADMINISTRAVTIVETASKROUTE: (ctx) =>
              const AdministrativeTaskScreen(),
          MyRoutes.VEHICLEMAINTENANCEROUTE: (ctx) =>
              const VehicleMaintenanceScreen(),
          MyRoutes.VEHICLEREPAIRROUTE: (ctx) => const VehicleRepairScreen(),
          MyRoutes.TROUBLESHOOTINGROUTE: (ctx) => const TroubleShootingScreen(),
          MyRoutes.SEARCHROUTE: (ctx) => const SearchScreen(),
          MyRoutes.HELPLINEROUTE: (ctx) => const HelpLineScreen(),
          MyRoutes.ALLPROFILEVERIFIEDROUTE: (ctx) =>
              const AllProfileVerifiedScreen(),
          MyRoutes.FAIRCOMPENSATIONROUTE: (ctx) =>
              const FairCompensationScreen(),
          MyRoutes.INSUREDSERVICESROUTE: (ctx) => const InsuredServicesScreen(),
          MyRoutes.CANCELLATIONPROTECTIONROUTE: (ctx) =>
              const CancellationProtectionScreen(),
          MyRoutes.SECUREPAYMENTSROUTE: (ctx) => const SecurePaymentsScreen(),
          MyRoutes.CHILDCAREROUTE: (ctx) => const ChildCareScreen(),
          MyRoutes.LOGINROUTE: (ctx) => const LoginScreen(),
          MyRoutes.REGISTERROUTE: (ctx) => const RegisterScreen(),
          MyRoutes.PERSONALINFORMATIONROUTE: (ctx) =>
              const PersonalInformation(),
          MyRoutes.GIFTROUTE: (ctx) => const GiftScreen(),
          MyRoutes.BALANCEROUTE: (ctx) => const BalanceScreen(),
          MyRoutes.MYTICKETSROUTE: (ctx) => const MyTickets(),
          MyRoutes.HELPCENTERROUTE: (ctx) => const HelpCenter(),
          MyRoutes.TICKETSCANNERROUTE: (ctx) => const TicketScannerScreen(),
          MyRoutes.NOTIFICATIONDISPLAYROUTE: (ctx) =>
              const NotificationDisplay(),
          MyRoutes.FAQSCREENROUTE: (ctx) => const FAQScreen(),
          MyRoutes.TRUSTANDSECURITY: (ctx) => const TrustAndSecurity(),
          MyRoutes.MANAGENOTIFICATIONS: (ctx) => const ManageNotifications(),

          MyRoutes.INSURANCE: (ctx) => const Insurance(),
          MyRoutes.TAXCERTIFICATEROUTE: (ctx) => const TaxCertificatesScreen(),
          MyRoutes.TAXCREDIT: (ctx) => const TaxCredit(),
          MyRoutes.TERMSANDCONDITION: (ctx) => const TermsAndCondition(),
          MyRoutes.ABOUTUSROUTE: (ctx) => const AboutUsScreen(),
          MyRoutes.COMMENTSCREENROUTE: (ctx) => const CommentScreen(),
          MyRoutes.EQUIPMENTRENTALSCREENROUTE: (ctx) =>
              const EquipmentRentalStepScreen(),
          MyRoutes.ADDTICKETMANUALLYROUTE: (ctx) => const AddTicketManually(),
          MyRoutes.MYTRANSACTION: (ctx) => const MyTransactionScreen(),
          MyRoutes.MYREVIEWS: (ctx) => const ReviewsScreen(),
          MyRoutes.ERRORSCREENROUTE: (ctx) => const ErrorScreen(),
        },
      ),
    );
  }
}
