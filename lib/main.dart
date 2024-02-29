import 'dart:async';
import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/forget_password/repository/forget_password_repository.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:app_solidale/screens/menu/area_personale/cambio_password/repository/change_password_repository.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/page.dart';
import 'package:app_solidale/screens/menu/messages/banco_message/repository/message_repository.dart';
import 'package:app_solidale/screens/news/repository/news_repository.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/repository/read_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/bloc_edit_docs/bloc/read_docs_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/repo/edit_docs_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/repository/send_docs_repository.dart';
import 'package:app_solidale/screens/servizi/bloc_send_service/repository/send_data_type_service_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/repo/edit_parents_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/repository/send_parents_data_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/bloc/edit_disabili_bloc.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/repo/edit_disabili_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_send/repo/send_disabili_repo.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/repository/send_data_taxi_repository.dart';
import 'dart:io' show Platform;

import 'package:app_solidale/screens/splash/page/splash.dart';
import 'package:app_solidale/secure_storage/secure_storage.dart';
import 'package:app_solidale/service/flutter_local_notification.dart';
import 'package:device_preview/device_preview.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/signin/repository/signin_repository.dart';
import 'screens/signup/repository/signup_repository.dart';

final navigatorKey = GlobalKey<NavigatorState>();

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // If you're going to use other Firebase services in the background, such as Firestore,
  // make sure you call `initializeApp` before using other Firebase services.
}

/// Create a [AndroidNotificationChannel] for heads up notifications
late AndroidNotificationChannel channel;

bool isFlutterLocalNotificationsInitialized = false;

/// Initialize the [FlutterLocalNotificationsPlugin] package.
FlutterLocalNotificationsPlugin? flutterLocalNotificationsPlugin;

Future<void> setupFlutterNotifications() async {
  if (isFlutterLocalNotificationsInitialized) {
    return;
  }
  channel = const AndroidNotificationChannel(
    'high_importance_channel', // id
    'High Importance Notifications', // title
    description:
        'This channel is used for important notifications.', // description
    importance: Importance.high,
    showBadge: true,
  );

  flutterLocalNotificationsPlugin = FlutterLocalNotificationsPlugin();
  // initialise the plugin. app_icon needs to be a added as a drawable resource to the Android head project

  /// Create an Android Notification Channel.
  ///
  /// We use this channel in the `AndroidManifest.xml` file to override the
  /// default FCM channel to enable heads up notifications.

  if (Platform.isAndroid) {
    await flutterLocalNotificationsPlugin
        ?.resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);
  }
  if (Platform.isIOS) {
    await flutterLocalNotificationsPlugin
        ?.resolvePlatformSpecificImplementation<
            IOSFlutterLocalNotificationsPlugin>()
        ?.requestPermissions(
          alert: true,
          badge: true,
          sound: true,
        );
  }

  /// Update the iOS foreground notification presentation options to allow
  /// heads up notifications.
  await FirebaseMessaging.instance.setForegroundNotificationPresentationOptions(
    alert: true,
    badge: true,
    sound: true,
  );
  isFlutterLocalNotificationsInitialized = true;
}

void showFlutterNotification(RemoteMessage message) {
  RemoteNotification? notification = message.notification;
  AndroidNotification? android = message.notification?.android;
  print('remote message ${message.notification!.body}');

  if (notification != null && !kIsWeb) {
    print('remote notification ${notification.body}');

    showDialog(
      context: navigatorKey.currentContext!,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return WillPopScope(
          onWillPop: () async => false,
          child: AlertDialog(
            title: Text(
              notification.title!,
              style: Theme.of(context).textTheme.titleMedium,
            ),
            content: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    notification.body!,
                  ),
                ],
              ),
            ),
            actions: [
              notification.body == 'Nuovo Messaggio'
                  ? TextButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => MessagesPage()));
                      },
                      child: Text(
                        'Messaggi',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    )
                  : TextButton(
                      onPressed: () => Navigator.of(context).pop(),
                      child: Text(
                        'Chiudi',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                    ),
            ],
          ),
        );
      },
    );
  }
}

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // Set the background messaging handler early on, as a named top-level function
  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  FlutterLocalNotifications().init();
  if (!kIsWeb) {
    await setupFlutterNotifications();
  }
  await dotenv.load(fileName: ".env.example");
  // await secureStorage.deleteSecureData('token');
  runApp(MyApp());
}

Timer? timer;
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return MultiBlocProvider(
      providers: [
        BlocProvider<ReadDocsBloc>(
            create: (_) => ReadDocsBloc(
                editDocsRepository: context.read<EditDocsRepository>(),
                context: context)
              ..add(FetchDocsEvent())),
        BlocProvider<ReadDisabiliBloc>(
            create: (_) => ReadDisabiliBloc(
                editDataDisabiliRepository:
                    context.read<EditDataDisabiliRepository>(),
                context: context)
              ..add(FetchDisabiliEvent()))
      ],
      child: MultiRepositoryProvider(
        providers: [
          RepositoryProvider<SignupRepository>(
            create: (context) => SignupRepository(),
          ),
          RepositoryProvider<SignInRepository>(
            create: (context) => SignInRepository(),
          ),
          RepositoryProvider<ReadDataUserRepository>(
            create: (context) => ReadDataUserRepository(),
          ),
          RepositoryProvider<ChangePasswordRepository>(
            create: (context) => ChangePasswordRepository(),
          ),
          RepositoryProvider<ForgetPasswordRepository>(
            create: (context) => ForgetPasswordRepository(),
          ),
          RepositoryProvider<SendDataParentsRepository>(
            create: (context) => SendDataParentsRepository(),
          ),
          RepositoryProvider<EditDataParentsRepository>(
            create: (context) => EditDataParentsRepository(),
          ),
          RepositoryProvider<SendDisabiliDataRepository>(
            create: (context) => SendDisabiliDataRepository(),
          ),
          RepositoryProvider<EditDataDisabiliRepository>(
            create: (context) => EditDataDisabiliRepository(),
          ),
          RepositoryProvider<SendDocsRepository>(
            create: (context) => SendDocsRepository(),
          ),
          RepositoryProvider<EditDocsRepository>(
            create: (context) => EditDocsRepository(),
          ),
          RepositoryProvider<SendDataTypeServiceRepository>(
            create: (context) => SendDataTypeServiceRepository(),
          ),
          RepositoryProvider<EditDataTypeServiceRepository>(
            create: (context) => EditDataTypeServiceRepository(),
          ),
          RepositoryProvider<NewsRepository>(
            create: (context) => NewsRepository(),
          ),
          RepositoryProvider<MessageRepository>(
            create: (context) => MessageRepository(),
          ),
        ],
        child: MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            unselectedWidgetColor: Colors.red, // <-- your color

            colorScheme: ColorScheme.fromSwatch().copyWith(
              background: Colors.white,
              primary: Colors.white,
            ),
            switchTheme: SwitchThemeData(
                trackOutlineColor:
                    MaterialStateProperty.all(ColorConstants.orangeGradients3)),
            textSelectionTheme: const TextSelectionThemeData(
              cursorColor: ColorConstants.orangeGradients3,
              selectionHandleColor: ColorConstants.orangeGradients3,
            ),
            elevatedButtonTheme: ElevatedButtonThemeData(
              style: ElevatedButton.styleFrom(
                backgroundColor: ColorConstants.secondaryColor,
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
            textTheme: TextTheme(
              titleSmall: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 2.5 * blockSizeVertical,
                color: ColorConstants.titleText,
              ),
              titleMedium: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 2 * blockSizeVertical,
                color: ColorConstants.titleText,
              ),
            ),
            checkboxTheme: CheckboxThemeData(
              side: AlwaysActiveBorderSide(),
              checkColor:
                  MaterialStateProperty.all(ColorConstants.orangeGradients3),
            ),
            radioTheme: RadioThemeData(
                fillColor:
                    MaterialStatePropertyAll(ColorConstants.orangeGradients3)),
            floatingActionButtonTheme: FloatingActionButtonThemeData(
              backgroundColor: ColorConstants.secondaryColor,
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)),
            ),
            dividerTheme: const DividerThemeData(color: Colors.transparent),
          ),
          localizationsDelegates: const [
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('it'),
          ],
          scaffoldMessengerKey: messengerKey,
          navigatorKey: navigatorKey,
          home: SplashScreen(),
        ),
      ),
    );
  }
}

class AlwaysActiveBorderSide extends MaterialStateBorderSide {
  @override
  BorderSide? resolve(_) => const BorderSide(color: Colors.black);
}
