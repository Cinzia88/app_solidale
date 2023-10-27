import 'dart:convert';
import 'package:anf_app/screens/tabs/page/page_tabs.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:anf_app/globals_token/globals_token.dart' as globals;

class InsertDataRepository {
  Future dataFormRepository(
    BuildContext context,
    String nome,
    String cognome,
    String email,
    String telefono,
    String indirizzo,
    String numeroComponenti,
    String etaComponenti,
    bool presenzaDisabilita,
  ) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/profile-user';
      // Await the http get response, then decode the json-formatted response.
      var response = await http.post(Uri.parse(url),
          headers: {
            'Accept': 'application/json',
            'Content-type': 'application/json',
            'Authorization': 'Bearer ${globals.tokenValue}'
          },
          body: jsonEncode({
            'nome': nome,
            'cognome': cognome,
            'email': email,
            'telefono': telefono,
            'indirizzo': indirizzo,
            'numero_componenti': numeroComponenti,
            'eta_componenti': etaComponenti,
            'presenza_disabilita': presenzaDisabilita,
          }));

      if (response.statusCode == 200) {
        print('signin ${jsonDecode(response.body)}');

        // ignore: use_build_context_synchronously

        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (_) => TabsPage()));
        print('response ${response.body}');
      } else {
        print('erroresponse ${response.body}');
      }
    } catch (e) {
      print('sendimage error $e');
    }
  }
}
