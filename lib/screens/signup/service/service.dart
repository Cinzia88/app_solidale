
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


 
}
  

