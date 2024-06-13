class Word {
  int? id;
  String turkish;
  String english;
  bool favorite;
  final String? image;

  Word({
    this.id,
    required this.turkish,
    required this.english,
    this.favorite = false,
    this.image,
  });

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      "turkish": turkish,
      "english": english,
      "favorite": favorite ? 1 : 0,
      "image": image,
    };
    if (id != null) {
      map["id"] = id;
    }
    return map;
  }

  Word.fromMap(Map<String, dynamic> map)
      : id = map["id"],
        turkish = map["turkish"],
        english = map["english"],
        favorite = map["favorite"] == 1,
        image = map["image"];
}
