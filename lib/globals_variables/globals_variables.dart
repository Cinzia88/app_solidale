library my_prj.globals;
import 'package:app_solidale/screens/home/model/get_user_model.dart';
import 'package:app_solidale/screens/servizi/bloc_edit_service/model/model_request.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/carica_documenti/edit_docs/model/edit_docs_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/banco_alimentare/parenti/edit_parents/model/edit_parents_model.dart';
import 'package:app_solidale/screens/servizi/chiedo_aiuto/bloc_disabili/bloc_edit/model/model_disabili.dart';



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
List<ParentsData> listParentsData = [];

List<DocsData> listDocsData = [];
Map<String, dynamic> pdf = {};


bool? profiloIncompletoTaxi;
bool? profiloIncompletoAccOnc;
bool? profiloIncompletoBancoAlim;
bool? componentiIncompleti;
bool? disabiliIncompleti;
bool? filesIncompleti;

bool? destinazioneTaxi;
bool? filesTaxiIncompleti;



int? statusCode;

bool richiestaCreataTaxiSolidale = false;
String? richiestaIdTaxiSolidale;

bool richiestaCreataAccOnc = false;
String? richiestaIdAccOnc;

bool richiestaCreataBancoAlim = false;
String? richiestaIdBamcoAlim;

