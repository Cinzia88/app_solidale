



import 'package:shared_preferences/shared_preferences.dart';

class ValueSharedPrefsViewSlide {

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance(); 

Future setRequest1Complete(bool value) async{
    final instance = await prefs;

    instance.setBool('request1', value);
  }

   Future<bool> getRequest1Complete() async{
    final instance = await prefs;

   final value = instance.getBool('request1');
   return value ?? true;
  }


   Future setRequest2Complete(bool value) async{
    final instance = await prefs;

    instance.setBool('request2', value);
  }

   Future<bool> getRequest2Complete() async{
    final instance = await prefs;

   final value = instance.getBool('request2');
   return value ?? true;
  }

   Future setRequest3Complete(bool value) async{
    final instance = await prefs;

    instance.setBool('request3', value);
  }

   Future<bool> getRequest3Complete() async{
    final instance = await prefs;

   final value = instance.getBool('request3');
   return value ?? true;
  }

  Future setRequest4Complete(bool value) async{
    final instance = await prefs;

    instance.setBool('request4', value);
  }

   Future<bool> getRequest4Complete() async{
    final instance = await prefs;

   final value = instance.getBool('request4');
   return value ?? true;
  }

 Future setIdTaxiSolidale(String value) async{
    final instance = await prefs;

    instance.setString('idTaxiSolidale', value);
  }

   Future<String> getIdTaxiSolidale() async{
    final instance = await prefs;

   final value = instance.getString('idTaxiSolidale');
   return value ?? '';
  }
  

  Future setuserId(String value) async{
    final instance = await prefs;

    instance.setString('userId', value);
  }

   Future<String> getuserId() async{
    final instance = await prefs;

   final value = instance.getString('userId');
   return value ?? '';
  }

  Future removeuserId() async{
    final instance = await prefs;

    instance.remove('userId');
  }

  Future setValueViewSlide(bool value) async{
    final instance = await prefs;

    instance.setBool('viewSlide', value);
  }

   Future<bool> getValueViewSlide() async{
    final instance = await prefs;

   final value = instance.getBool('viewSlide');
   return value ?? true;
  }

  Future removeValueViewSlide() async{
    final instance = await prefs;

    instance.remove('viewSlide');
  }


    Future setCreate(bool value) async{
    final instance = await prefs;

    instance.setBool('createRequest', value);
  }

   Future<bool> getCreateReq() async{
    final instance = await prefs;

   final value = instance.getBool('createRequest');
   return value ?? true;
  }
}