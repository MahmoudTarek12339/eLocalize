class BookModel {
  int? id;
  String title;
  String author;
  String description;
  int field;

  BookModel(this.title, this.author, this.description, this.field,{this.id});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'title': title,
      'author': author,
      'description': description,
      'field': field,
    };

    return map;
  }
}
