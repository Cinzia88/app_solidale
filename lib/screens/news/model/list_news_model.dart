class ListNewsModel {
 final String id;
 final String titolo;
 final String? immagine;
 final String testo;
 final String slug;
 

  ListNewsModel({
    required this.id,
    required this.titolo,
     this.immagine,
    required this.testo,
    required this.slug,
  });

  factory ListNewsModel.fromJson(Map<String, dynamic> json) {
    return ListNewsModel(
    id: json["id"].toString(),
    titolo: json['titolo'],
    immagine: json['immagine'] ?? '',
    testo: json["testo"],
    slug: json["slug"],
    );
  }
}