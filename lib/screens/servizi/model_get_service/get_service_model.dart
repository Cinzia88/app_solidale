
import 'package:equatable/equatable.dart';
class DataServiceModel {
  final List<GetServiceModel> dataService;
  DataServiceModel({
    required this.dataService,
  });
 
factory DataServiceModel.fromJson(Map<String, dynamic> data) => DataServiceModel(
      dataService: List<GetServiceModel>.from(data['dataService'].map((x) => GetServiceModel.fromJson(x))),
      );

 
}
class GetServiceModel {
  final int id;
  final String tipoServizio;
  GetServiceModel({
    required this.id,
    required this.tipoServizio,
  });
 
factory GetServiceModel.fromJson(Map<String, dynamic> data) => GetServiceModel(
      id: data['id'],
      tipoServizio: data['tipo_di_servizio']
      );

 
}
