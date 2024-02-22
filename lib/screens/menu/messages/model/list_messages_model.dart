class ListMessageModel {
 final String id;
 final String titolo;
 final String? immagine;
 final String testo;
 final String slug;
 

  ListMessageModel({
    required this.id,
    required this.titolo,
     this.immagine,
    required this.testo,
    required this.slug,
  });

  factory ListMessageModel.fromJson(Map<String, dynamic> json) {
    return ListMessageModel(
    id: json["id"].toString(),
    titolo: json['titolo'],
    immagine: json['immagine'] ?? '',
    testo: json["testo"],
    slug: json["slug"],
    );
  }
}