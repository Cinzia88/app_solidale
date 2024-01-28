



import 'package:shared_preferences/shared_preferences.dart';

class ValueSharedPrefsViewSlide {

  final Future<SharedPreferences> prefs = SharedPreferences.getInstance(); 



 Future setProfiloIncompletoUtenteTaxi(bool value) async{
    final instance = await prefs;

    instance.setBool('profiloCompletoUtenteTaxi', value);
  }

   Future<bool> getProfiloIncompletoUtenteTaxi() async{
    final instance = await prefs;

   final value = instance.getBool('profiloCompletoUtenteTaxi');
   return value ?? false;
  }

  Future<bool> removeProfiloIncompletoUtenteTaxi() async{
    final instance = await prefs;

   final value = instance.remove('profiloCompletoUtenteTaxi');
   return value;
  }


Future setProfiloIncompletoUtenteAccOnc(bool value) async{
    final instance = await prefs;

    instance.setBool('profiloCompletoUtenteAccOnc', value);
  }

   Future<bool> getProfiloIncompletoUtenteAccOnc() async{
    final instance = await prefs;

   final value = instance.getBool('profiloCompletoUtenteAccOnc');
   return value ?? false;
  }
Future<bool> removeProfiloIncompletoUtenteAccOnc() async{
    final instance = await prefs;

   final value = instance.remove('profiloCompletoUtenteAccOnc');
   return value;
  }


Future setProfiloIncompletoUtenteBanco(bool value) async{
    final instance = await prefs;

    instance.setBool('profiloCompletoUtenteBanco', value);
  }

   Future<bool> getProfiloIncompletoUtenteBanco() async{
    final instance = await prefs;

   final value = instance.getBool('profiloCompletoUtenteBanco');
   return value ?? false;
  }

  Future<bool> removeProfiloIncompletoUtenteBanco() async{
    final instance = await prefs;

   final value = instance.remove('profiloCompletoUtenteBanco');
   return value;
  }


Future setProfiloIncompletoUtenteComponenti(bool value) async{
    final instance = await prefs;

    instance.setBool('profiloCompletoUtenteComponenti', value);
  }

   Future<bool> getProfiloIncompletoUtenteComponenti() async{
    final instance = await prefs;

   final value = instance.getBool('profiloCompletoUtenteComponenti');
   return value ?? false;
  }

  Future<bool> removeProfiloIncompletoUtenteComponenti() async{
    final instance = await prefs;

   final value = instance.remove('profiloCompletoUtenteComponenti');
   return value;
  }

Future setProfiloIncompletoUtenteDisabili(bool value) async{
    final instance = await prefs;

    instance.setBool('profiloCompletoUtenteDisabili', value);
  }

   Future<bool> getProfiloIncompletoUtenteDisabili() async{
    final instance = await prefs;

   final value = instance.getBool('profiloCompletoUtenteDisabili');
   return value ?? false;
  }
 Future<bool> removeProfiloIncompletoUtenteDisabili() async{
    final instance = await prefs;

   final value = instance.remove('profiloCompletoUtenteDisabili');
   return value;
  }
  Future setProfiloIncompletoUtenteFiles(bool value) async{
    final instance = await prefs;

    instance.setBool('profiloCompletoUtenteFiles', value);
  }
 Future<bool> removeFilesBanco() async{
    final instance = await prefs;

   final value = instance.remove('profiloCompletoUtenteFiles');
   return value;
  }
   Future<bool> getProfiloIncompletoUtenteFiles() async{
    final instance = await prefs;

   final value = instance.getBool('profiloCompletoUtenteFiles');
   return value ?? false;
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