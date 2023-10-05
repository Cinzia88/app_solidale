import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/services.dart';

import 'screens/onboarding/page/onboarding_page.dart';



Future main() async {
  
  await dotenv.load(fileName: ".env.example");
  runApp( MyApp());
  //...runapp
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a blue toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home:  ApiProvider(),
    );
  }
}

class ApiProvider extends StatefulWidget {
  const ApiProvider({super.key});



  @override
  State<ApiProvider> createState() => _ApiProviderState();
}

class _ApiProviderState extends State<ApiProvider> {


@override
  void initState() {
    // TODO: implement initState
    super.initState();
   _getToken();
  }

Future _getToken() async {
 try {
    String XSRFTOKEN = 'eyJpdiI6Ik5KTkZrRnlHbFV4R2xTb0NPdEl6REE9PSIsInZhbHVlIjoiTHhWbFczRE5DQWdGdmlnTDhnTWY5YlRDTnhRQ0VjYU56Z2pGVmhlQndLOVNzWFhrKzhHb3d0NXlKOFRXb1VXOXVmdHRPaHpiYmpMZDE2RWJyU1N2S2RZdGcwSFJNdXM3dFVZRGFaWlE3QUZlNnc4RzVBdlB4TDhHWTRWdU9pRmIiLCJtYWMiOiJlODY3NjI3Nzk3ZmZmZWZmNGQzYzg1YmZmYTgzZDdmNjNmZjQwNzA5OWJkYTg5MDBjNzkwOWY0YTc0YjI3NGFmIiwidGFnIjoiIn0%3D; expires=Wed, 04 Oct 2023 21:04:44 GMT; Max-Age=7200; path=/; samesite=lax,laravel_session=eyJpdiI6ImdGYmxXa2JaWk5CV1pGTDl4TUJ5bGc9PSIsInZhbHVlIjoiOXd2SURieWRreGpvblQ5UGVhWVRuUzRGTWZ3Q0FKWHV0UzNyQjNLREUxWTNuSzhFaU8xaVBpcVZCQTZPeStwd0NHY3BCQlY0SEZBMExkeUEzQnQydDhLcmF3aFhKeTdvMFAyejhReCsyM053YjMzWGt4aWlXbXFobS9BNGVtcGkiLCJtYWMiOiJjMDVmOGIyMGIyMTExMDFjNDc0NWFkMzQ5Y2U2NmNmZmZjZmZlYTFhOGFjNWExYjUwMTFjYjdiNTRhNWI1MzM2IiwidGFnIjoiIn0%3D';
var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/register';
  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(Uri.parse(url),
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json',
   'X-XSRF-TOKEN': XSRFTOKEN,
  },
  body: jsonEncode({
    'name':'Cinzia',
    'email': 'cinziamarraffatestapp@test.it',
    'password': '123456789',
    'password_confirmation': '123456789',
  }));
   
    print('response ${response.body}');
 } catch (e) {
   print('error $e');
 }
  
}

  @override
  Widget build(BuildContext context) {
    return  SafeArea(
      child: Scaffold(
        body: Container(
          child: Text('${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}'),
        ),
      ),
    );
  }
}

