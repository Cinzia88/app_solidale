



import 'package:shared_preferences/shared_preferences.dart';

class ValueSharedPrefsViewSlide {

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance(); 

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


   Future setProfileComplete(bool value) async{
    final instance = await prefs;

    instance.setBool('profileComplete', value);
  }

   Future<bool> getProfileComplete() async{
    final instance = await prefs;

   final value = instance.getBool('profileComplete');
   return value ?? true;
  }
}