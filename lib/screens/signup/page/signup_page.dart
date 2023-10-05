import 'dart:convert';

import 'package:anf_app/const/text_constants.dart';
import 'package:anf_app/screens/signup/widget/custom_button.dart';
import 'package:anf_app/screens/signup/widget/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import '../widget/already_account.dart';

class SignUpPage extends StatefulWidget {
  SignUpPage({Key? key}) : super(key: key);

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

      @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getToken();
  }

Future _getToken() async {
  String XSRFTOKEN = 'eyJpdiI6Ik5KTkZrRnlHbFV4R2xTb0NPdEl6REE9PSIsInZhbHVlIjoiTHhWbFczRE5DQWdGdmlnTDhnTWY5YlRDTnhRQ0VjYU56Z2pGVmhlQndLOVNzWFhrKzhHb3d0NXlKOFRXb1VXOXVmdHRPaHpiYmpMZDE2RWJyU1N2S2RZdGcwSFJNdXM3dFVZRGFaWlE3QUZlNnc4RzVBdlB4TDhHWTRWdU9pRmIiLCJtYWMiOiJlODY3NjI3Nzk3ZmZmZWZmNGQzYzg1YmZmYTgzZDdmNjNmZjQwNzA5OWJkYTg5MDBjNzkwOWY0YTc0YjI3NGFmIiwidGFnIjoiIn0%3D; expires=Wed, 04 Oct 2023 21:04:44 GMT; Max-Age=7200; path=/; samesite=lax,laravel_session=eyJpdiI6ImdGYmxXa2JaWk5CV1pGTDl4TUJ5bGc9PSIsInZhbHVlIjoiOXd2SURieWRreGpvblQ5UGVhWVRuUzRGTWZ3Q0FKWHV0UzNyQjNLREUxWTNuSzhFaU8xaVBpcVZCQTZPeStwd0NHY3BCQlY0SEZBMExkeUEzQnQydDhLcmF3aFhKeTdvMFAyejhReCsyM053YjMzWGt4aWlXbXFobS9BNGVtcGkiLCJtYWMiOiJjMDVmOGIyMGIyMTExMDFjNDc0NWFkMzQ5Y2U2NmNmZmZjZmZlYTFhOGFjNWExYjUwMTFjYjdiNTRhNWI1MzM2IiwidGFnIjoiIn0%3D';
var url = 'http://192.168.120.204:8000/api/register';
print('sent email');
  // Await the http get response, then decode the json-formatted response.
  var response = await http.post(Uri.parse(url),
  headers: {
    'Accept': 'application/json',
    'Content-type': 'application/json',   //'Authorization': 'Bearer y2UjSd7TIWEnF5aW0U48FCaqMrBzevz3u7fPAL6v2ad47d1c',
  },
  body: jsonEncode({
    'name': 'Cinzia',
    'email': 'cinzia@test.it',
    'password': 'marraffa88',
    'password_confirmation': 'marraffa88'
  }));
   
    print('response ${response.body}');
  
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange.shade50,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 40.0),
          child: Column(children: [
            Text('Crea Account'),
            SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextField(
                    title: TextConstants.username,
                    placeholder: TextConstants.userNamePlaceholder,
                    controller: _nameController,
                    textInputAction: TextInputAction.next,
                    errorText: TextConstants.usernameErrorText,
                    obscureText: false,
                    isError: false,
                  ),
                  CustomTextField(
                    title: TextConstants.email,
                    placeholder: TextConstants.emailPlaceholder,
                    controller: _emailController,
                    textInputAction: TextInputAction.next,
                    errorText: TextConstants.emailErrorText,
                    obscureText: false,
                    isError: false,
                  ),
                  CustomTextField(
                    title: TextConstants.password,
                    placeholder: TextConstants.passwordPlaceholder,
                    controller: _passwordController,
                    textInputAction: TextInputAction.next,
                    errorText: TextConstants.passwordErrorText,
                    obscureText: false,
                    isError: false,
                  ),
                  CustomTextField(
                    title: TextConstants.confirmPassword,
                    placeholder: TextConstants.confirmPasswordPlaceholder,
                    controller: _confirmPasswordController,
                    textInputAction: TextInputAction.next,
                    errorText: TextConstants.confirmPasswordErrorText,
                    obscureText: false,
                    isError: false,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  CommonStyleButton(
                    title: TextConstants.signUp,
                    onTap: () {
                         _getToken();
      
                      /*FocusScope.of(context).unfocus();
                bloc.add(SignUpTappedEvent()); */
                    },
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 40,
            ),
            CreateHaveAccountText(context),
          ]),
        ),
      ),
    );
  }
}
