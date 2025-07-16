import 'genre.dart'; 

class Book {
  String _title;
  String _author;
  Genre genre;
  int stock;

  Book({
    required String title,
    required String author,
    required this.genre,
    this.stock = 0,
  })  : _title = _formatText(title),
        _author = _formatText(author);

  String get title => _title;
  String get author => _author;

  static String _formatText(String input) {
    if (input.isEmpty) return input;
    return input[0].toUpperCase() + input.substring(1).toLowerCase();
  }

  bool get isAvailable => stock > 0;

  void addStock(int count) {
    if (count > 0) {
      stock += count;
    }
  }

  void removeStock(int count) {
    if (count > 0 && stock >= count) {
      stock -= count;
    }
  }
  @override
  String toString() {
    return 'Title: $title, Author: $author, Genre: ${genre.toString().split('.').last}, Stock: $stock';
  }

}
