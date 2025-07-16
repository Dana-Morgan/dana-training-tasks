import '../models/genre.dart';

extension GenreStringNormalizer on Genre {
  String normalizeGenreInput() {
    final genreString = this.toString().split('.').last;  
    return genreString
        .replaceAll(RegExp(r'[_\-]'), ' ') 
        .split(' ')                      
        .where((w) => w.trim().isNotEmpty) 
        .map((word) =>
            word[0].toUpperCase() + word.substring(1).toLowerCase())
        .join(' ');
  }
}
