import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
// import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:jiosaavn_vip/colors.dart';
import 'package:mysql1/mysql1.dart';
import 'package:on_audio_query/on_audio_query.dart';
import 'authenticatiion/screens/splash_screen.dart';
import 'controllers/current_song_controller.dart';
import 'notification_controller.dart';

//Use SnackBAr for bottom Music

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
  // await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // await FirebaseApi().initNotifications();
  await AwesomeNotifications().initialize(
    null,
    [
      NotificationChannel(
        channelKey: 'vip',
        channelName: 'mr_vipul_21',
        channelDescription: 'mr',
        channelGroupKey: 'basic_channel_group',
        groupKey: 'vip',
        groupSort: GroupSort.Asc,
        importance: NotificationImportance.Max,
        channelShowBadge: true,
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
    await AwesomeNotifications().requestPermissionToSendNotifications();
  }
  runApp(const ProviderScope(child: MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

final OnAudioQuery audioQuery = OnAudioQuery();

class _MyAppState extends State<MyApp> {
  bool _hasPermission = false;
  @override
  void initState() {
    checkAndRequestPermissions();
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
    Get.put(CurrentSongController());
  }

  checkAndRequestPermissions({bool retry = false}) async {
    // The param 'retryRequest' is false, by default.
    _hasPermission = await audioQuery.checkAndRequest(
      retryRequest: retry,
    );

    // Only call update the UI if application has all required permissions.
    _hasPermission ? setState(() {}) : null;
  }

  var conn = SqlConnection();
  getData() async {
    await conn.connectDb().then((connection) async {
      try {
        String sql = 'select * from students;';
        await connection.query(sql).then((value) {
          print('DATA $value');
        });
      } on Exception catch (e) {
        print(e.toString());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'JioSaavn UI',
      // navigatorKey: navKey,
      debugShowCheckedModeBanner: false,
      scrollBehavior: const ScrollBehavior().copyWith(overscroll: false),
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
        ),
      ),
      home: const SplashScreen(),
      // home: Scaffold(
      //   body: Center(
      //     child: TextButton(
      //       onPressed: () async {
      //         await getData();
      //       },
      //       child: Text('SQL'),
      //     ),
      //   ),
      // ),
      // home: const RiverPodPlayerScreen(),
    );
  }
}

class SqlConnection {
  Future<MySqlConnection> connectDb() async {
    var conectionSettings = ConnectionSettings(
      host: 'localhost',
      port: 3306,
      db: 'myDb',
      user: 'root',
      password: 'root',
    );
    return await MySqlConnection.connect(conectionSettings);
  }
}
