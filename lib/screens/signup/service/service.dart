
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

import 'package:image_picker/image_picker.dart';

class Service {
  Future addImage(Map<String, String> body, List<XFile?> filepath) async {
    try {
      var url = '${dotenv.env['NEXT_PUBLIC_BACKEND_URL']!}/api/upload-documents';
      Map<String, String> headers = {
        'Accept': 'application/json',
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer IZNUzFnTD4MeAHqKhPSrQenCu5eMMfNiAMKsuKue30331031'
      };

      List<http.MultipartFile> newList = [];
      http.MultipartRequest? request;
      
      for (int i = 0; i < filepath.length; i++) {
        var multipartFile =
            await http.MultipartFile.fromPath('image[]', filepath[i]!.path);

        newList.add(multipartFile);

        request = http.MultipartRequest('POST', Uri.parse(url))
          ..fields.addAll(body)
          ..headers.addAll(headers)
          ..files.addAll(newList);
      }
      http.Response response =
          await http.Response.fromStream(await request!.send());
      print('sendimage success ${request.files.length}');
      print('sendimage successbody ${(json.decode(response.body))}');
      return response;
    } catch (e) {
      print('sendimage error $e');
    }
  }


 Future registerUser( String email, String password, String passwordConfirmation) async {
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
    'email': email,
    'password': password,
    'password_confirmation': passwordConfirmation,
  }));
   
    print('response ${response.body}');
    } catch (e) {
      print('sendimage error $e');
    }
  }

  

}
  

