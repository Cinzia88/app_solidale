library my_prj.globals;
import 'package:app_solidale/screens/home/model/get_user_model.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/taxi_solidale/bloc_edit_disabili/model/edit_disabili_model.dart';



dynamic tokenValue;
String? userId;
String? typeRichiesta;
bool? viewSlide;
UserData? userData;
String? serviceOffroAiutoID;
String? serviceTaxiSolidaleID;
String? serviceAccOncID;
String? serviceBancoAlimID;
bool service2Completed = false;
bool service3Completed = false;
bool service4Completed = false;
List<RequestData> listRequestData = [];
RequestData? editRequest;
DisabiliData? dataDisabili;



int? statusCode;

bool richiestaCreataTaxiSolidale = false;
String? richiestaIdTaxiSolidale;

bool richiestaCreataAccOnc = false;
String? richiestaIdAccOnc;

bool richiestaCreataBancoAlim = false;
String? richiestaIdBamcoAlim;

