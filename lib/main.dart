import 'package:anf_app/const/color_constants.dart';
import 'package:anf_app/screens/signup/repository/signup_repository.dart';
import 'package:anf_app/screens/splash/page/splash.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'screens/onboarding/page/onboarding_page.dart';
import 'screens/signin/repository/signin_repository.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await dotenv.load(fileName: ".env.example");
  runApp(const MyApp());
  //...runapp
}

double percent = 0.5;

class MyApp extends StatelessWidget {
  const MyApp({super.key});

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
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          useMaterial3: true,
          colorScheme:
              ColorScheme.light(primary: ColorConstants.orangeGradients3),
          // <-- your color
        ),
        localizationsDelegates: [
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        supportedLocales: [
          const Locale('it'),
        ],
        home: const SplashScreen(),
      ),
    );
  }
}
