import 'dart:async';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/forget_password/repository/forget_password_repository.dart';
import 'package:app_solidale/screens/profilo/page/cambio_password/repository/change_password_repository.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/chiedo_aiuto/repository/insert_data_repository.dart';

import 'package:app_solidale/screens/splash/page/splash.dart';
import 'package:app_solidale/secure_storage/secure_storage.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:one_context/one_context.dart';

import 'screens/signin/repository/signin_repository.dart';
import 'screens/signup/repository/signup_repository.dart';
import 'screens/tabs/repository/read_data_user.dart';
import 'globals_variables/globals_variables.dart' as globals;

bool initialURILinkHandled = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await dotenv.load(fileName: ".env.example");

   OnePlatform.app = () => MyApp();

  //...runapp
}

Timer? timer;

class MyApp extends StatelessWidget {
  MyApp({super.key}) {
    OneContext().key = GlobalKey<NavigatorState>();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
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
        RepositoryProvider<InsertDataRepository>(
          create: (context) => InsertDataRepository(),
        ),
        RepositoryProvider<ChangePasswordRepository>(
          create: (context) => ChangePasswordRepository(),
        ),
        RepositoryProvider<ForgetPasswordRepository>(
          create: (context) => ForgetPasswordRepository(),
        ),
      ],
      child: OneNotification(
        builder: (_, __) {
          return MaterialApp(
            title: 'Flutter Demo',
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              useMaterial3: true,
              colorScheme:
                  const ColorScheme.light(primary: ColorConstants.orangeGradients3),
              // <-- your color
            ),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
              GlobalCupertinoLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('it'),
            ],
            builder: OneContext().builder,
            navigatorKey: OneContext().key,
            home: SplashScreen(),
          );
        }
      ),
    );
  }
}
