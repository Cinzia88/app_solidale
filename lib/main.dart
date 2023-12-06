import 'dart:async';
import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/forget_password/repository/forget_password_repository.dart';
import 'package:app_solidale/screens/home/repository/get_user_repo.dart';
import 'package:app_solidale/screens/menu/area_personale/cambio_password/repository/change_password_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/repository/send_docs_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/repository/send_parents_data_repository.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/repository/send_data_disabili_repository.dart';
import 'package:app_solidale/screens/servizi/page_service/repository/send_phone_repository.dart';

import 'package:app_solidale/screens/splash/page/splash.dart';
import 'package:app_solidale/secure_storage/secure_storage.dart';
import 'package:flutter/cupertino.dart';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:one_context/one_context.dart';

import 'screens/signin/repository/signin_repository.dart';
import 'screens/signup/repository/signup_repository.dart';

final SecureStorage secureStorage = SecureStorage();
Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env.example");
  // await secureStorage.deleteSecureData('token');
  OnePlatform.app = () => MyApp();

  //...runapp
}

Timer? timer;
final messengerKey = GlobalKey<ScaffoldMessengerState>();

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    OneContext().key = GlobalKey<NavigatorState>();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //final screenWidth = MediaQuery.of(context).size.width;
    final mediaQueryData = MediaQuery.of(context);
    final screenHeight = mediaQueryData.size.height;
    //final blockSizeHorizontal = screenWidth / 100;
    final blockSizeVertical = screenHeight / 100;
    return MultiRepositoryProvider(
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
        RepositoryProvider<SendDisabiliDataRepository>(
          create: (context) => SendDisabiliDataRepository(),
        ),
        RepositoryProvider<SendDocsRepository>(
          create: (context) => SendDocsRepository(),
        ),
        RepositoryProvider<SendPhoneRepository>(
          create: (context) => SendPhoneRepository(),
        ),
      ],
      child: OneNotification(builder: (_, __) {
        return MaterialApp(
          title: 'Flutter Demo',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            useMaterial3: true,
            colorScheme: ColorScheme.fromSwatch()
                .copyWith(background: Colors.white, primary: Colors.white),
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
          builder: OneContext().builder,
          navigatorKey: OneContext().key,
          home: SplashScreen(),
        );
      }),
    );
  }
}
