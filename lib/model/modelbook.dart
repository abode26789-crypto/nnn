class BookModel {
  String? image;
  String? title;
  String? author;

  BookModel({this.image, this.title, this.author});

  factory BookModel.fromJson(Map<String, dynamic> json) {
    return BookModel(
      image: _readString(json, const [
        'image',
        'image_url',
        'cover',
      ])?.replaceAll(r'\', '/'),
      title: _readString(json, const [
        'title',
        'book_title',
        'name',
        'NameBooktext',
      ]),
      author: _readString(json, const [
        'author',
        'author_name',
        'writer',
        'authortext',
      ]),
    );
  }

  static String? _readString(Map<String, dynamic> json, List<String> keys) {
    for (final key in keys) {
      final value = json[key];
      if (value != null && value.toString().trim().isNotEmpty) {
        return value.toString();
      }
    }
    return null;
  }

  Map<String, dynamic> toJson() {
    return {'image': image, 'title': title, 'author': author};
  }
}
