



import 'package:shared_preferences/shared_preferences.dart';

class ValueSharedPrefsViewSlide {

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance(); 

  Future setValueViewSlide(bool value) async{
    final instance = await prefs;

    instance.setBool('viewSlide', value);
  }

   Future getValueViewSlide() async{
    final instance = await prefs;

    instance.getBool('viewSlide');
  }
}