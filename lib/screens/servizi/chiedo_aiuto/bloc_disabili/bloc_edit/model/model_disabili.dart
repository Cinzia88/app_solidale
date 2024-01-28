import 'package:equatable/equatable.dart';

class DisabiliData extends Equatable {
  final String id;
  final String numeroDisabili;
  final String disabile;

  const DisabiliData({
    required this.id,
    required this.numeroDisabili,
    required this.disabile,
  });

  factory DisabiliData.fromJson(Map<String, dynamic> json) {
    return DisabiliData(
      id: json["id"].toString(),
      numeroDisabili: json["numero_disabili"].toString(),
      disabile: json["disabile"].toString(),
    );
  }

  @override
  List<Object?> get props => [
        id,
        numeroDisabili,
        disabile,
      ];
}