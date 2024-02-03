import 'package:shared_preferences/shared_preferences.dart';

class ValueSharedPrefsViewSlide {
  final Future<SharedPreferences> prefs = SharedPreferences.getInstance();

  Future setResponse(int value) async {
    final instance = await prefs;

    instance.setInt('statusCode', value);
  }

  Future<int> getResponse() async {
    final instance = await prefs;

    final value = instance.getInt('statusCode');
    return value!;
  }
 
  Future setIdTaxiSolidale(String value) async {
    final instance = await prefs;

    instance.setString('idTaxiSolidale', value);
  }

  Future<String> getIdTaxiSolidale() async {
    final instance = await prefs;

    final value = instance.getString('idTaxiSolidale');
    return value ?? '';
  }

  Future setuserId(String value) async {
    final instance = await prefs;

    instance.setString('userId', value);
  }

  Future<String> getuserId() async {
    final instance = await prefs;

    final value = instance.getString('userId');
    return value ?? '';
  }

  Future removeuserId() async {
    final instance = await prefs;

    instance.remove('userId');
  }

  Future setValueViewSlide(bool value) async {
    final instance = await prefs;

    instance.setBool('viewSlide', value);
  }

  Future<bool> getValueViewSlide() async {
    final instance = await prefs;

    final value = instance.getBool('viewSlide');
    return value ?? true;
  }

  Future removeValueViewSlide() async {
    final instance = await prefs;

    instance.remove('viewSlide');
  }

  Future setCreate(bool value) async {
    final instance = await prefs;

    instance.setBool('createRequest', value);
  }

  Future<bool> getCreateReq() async {
    final instance = await prefs;

    final value = instance.getBool('createRequest');
    return value ?? true;
  }
}
