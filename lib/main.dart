import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:jiosaavn_vip/colors.dart';
import 'package:jiosaavn_vip/firebase_options.dart';
import 'package:jiosaavn_vip/ui/home_screen.dart';
import 'controllers/current_song_controller.dart';
import 'notification_controller.dart';

// final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
//     FlutterLocalNotificationsPlugin();
// final navKey = GlobalKey<NavigatorState>();
void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // const intializationSettingsAndroid =
  //     AndroidInitializationSettings('jio_saavn');
  // // final DarwinInitializationSettings initializationSettingsIOS =
  // //     DarwinInitializationSettings(
  // //   requestAlertPermission: true,
  // //   requestBadgePermission: true,
  // //   requestSoundPermission: true,
  // //   onDidReceiveLocalNotification: ((
  // //     int id,
  // //     String? title,
  // //     String? body,
  // //     String? payload,
  // //   ) async {}),
  // // );
  // InitializationSettings initializationSettings = const InitializationSettings(
  //   android: intializationSettingsAndroid,
  //   //  iOS: initializationSettingsIOS,
  // );
  // await flutterLocalNotificationsPlugin.initialize(
  //   initializationSettings,
  //   onDidReceiveNotificationResponse: (details) async {
  //     // ignore: avoid_print
  //     print(details.payload);
  //   },
  // );
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'vip',
        channelName: 'mr_vipul_21',
        channelDescription: 'mr',
        channelGroupKey: 'basic_channel_group',
      ),
    ],
    channelGroups: [
      NotificationChannelGroup(
        channelGroupKey: 'basic_channel_group',
        channelGroupName: 'basic_channel',
      ),
    ],
  );
  bool isAllowedSendNotication =
      await AwesomeNotifications().isNotificationAllowed();
  if (!isAllowedSendNotication) {
    AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    AwesomeNotifications().setListeners(
      onActionReceivedMethod: NotificationController.onActionReceivedMethod,
      onDismissActionReceivedMethod:
          NotificationController.onDismissActionReceivedMethod,
      onNotificationCreatedMethod:
          NotificationController.onNotificationCreatedMethod,
      onNotificationDisplayedMethod:
          NotificationController.onNotificationDisplayedMethod,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    // ignore: unused_local_variable
    var c = Get.put(CurrentSongController());
    return GetMaterialApp(
      title: 'JioSaavn UI',
      // navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      // routes: {
      //   '/notification_screen': (p0) {
      //     return NotificationScreen();
      //   },
      //   '/notifiction_screen': (p0) {
      //     return NotificationScreen();
      //   },
      //   '/notifiation_screen': (p0) {
      //     return NotificationScreen();
      //   },
      // },
      theme: ThemeData.light(useMaterial3: true).copyWith(
          scaffoldBackgroundColor: const Color.fromARGB(255, 241, 238, 238),
          appBarTheme: const AppBarTheme(
            elevation: 0,
            scrolledUnderElevation: 0,
            backgroundColor: Color.fromARGB(255, 241, 238, 238),
          ),
          bottomSheetTheme: const BottomSheetThemeData(
            backgroundColor: whiteColor,
          )),
      home: const HomeScreen(),
    );
  }
}
