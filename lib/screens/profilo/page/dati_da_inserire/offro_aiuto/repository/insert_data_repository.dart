import 'dart:convert';
import 'package:app_solidale/screens/profilo/page/profile_page.dart';
import 'package:app_solidale/screens/tabs/page/page_tabs.dart';
import 'package:app_solidale/secure_storage/shared_prefs.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:app_solidale/globals_variables/globals_variables.dart'
    as globals;

class InsertDataOffroAiutoRepository {
  ValueSharedPrefsViewSlide valueSharedPrefsViewSlide =
      ValueSharedPrefsViewSlide();

  Future dataFormRepository(
    BuildContext context,
    String richiesta,
    String nome,
    String cognome,
    String email,
    String telefono,
    String tipoAiuto,
    String associazione,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/user-app';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body: jsonEncode({
            'tipo_richiesta': richiesta,
            'nome': nome,
            'cognome': cognome,
            'email': email,
            'telefono': telefono,
            'tipo_aiuto': tipoAiuto,
            'associazione': associazione,
          }));
print('associazione $associazione');
      if (response.statusCode == 200) {
        print('signin ${jsonDecode(response.body)}');

        // ignore: use_build_context_synchronously
        bool profiloCompleto = true;
        await valueSharedPrefsViewSlide.setProfileComplete(profiloCompleto);
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => ProfilePage()));
        print('response ${response.body}');
      } else {
        print('erroresponse ${response.body}');
      }
    } catch (e) {
      print('sendimage error $e');
    }
  }
}
