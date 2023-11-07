import 'dart:async';

import 'package:app_solidale/const/color_constants.dart';
import 'package:app_solidale/screens/forget_password/repository/forget_password_repository.dart';
import 'package:app_solidale/screens/profilo/page/cambio_password/repository/change_password_repository.dart';
import 'package:app_solidale/screens/profilo/page/dati_da_inserire/repository/insert_data_repository.dart';
import 'package:app_solidale/screens/reset_password/page/reset_password_page.dart';
import 'package:app_solidale/screens/reset_password/repository/reset_password_repository.dart';

import 'package:app_solidale/screens/splash/page/splash.dart';
import 'package:app_solidale/secure_storage/secure_storage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';

import 'screens/signin/page/signin_page.dart';
import 'screens/signin/repository/signin_repository.dart';
import 'screens/signup/repository/signup_repository.dart';
import 'screens/tabs/repository/read_data_user.dart';
import 'globals_variables/globals_variables.dart' as globals;

bool initialURILinkHandled = false;

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
print('token ${globals.tokenValue}');
  await dotenv.load(fileName: ".env.example");
                 SecureStorage().deleteSecureData('token');

  runApp(MyApp());
  

  //...runapp
}

Timer? timer;


class MyApp extends StatelessWidget {
  MyApp({super.key});

  /// The route configuration.
  final GoRouter _router = GoRouter(
    routes: <RouteBase>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return const SplashScreen();
        },
        routes: <RouteBase>[
          GoRoute(
            path: 'accedi',
            builder: (BuildContext context, GoRouterState state) {
              return SignInPage();
            },
          ),
           GoRoute(
            path: 'reset-password',
            builder: (BuildContext context, GoRouterState state) {
              return const ResetPasswordPage();
            },
          ),
        ],
      ),
    ],
  );
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
         RepositoryProvider<ResetPasswordRepository>(
          create: (context) => ResetPasswordRepository(),
        ),
         RepositoryProvider<ForgetPasswordRepository>(
          create: (context) => ForgetPasswordRepository(),
        ),
      ],
      child: MaterialApp.router(
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
        routerConfig: _router,
      ),
    );
  }
}
