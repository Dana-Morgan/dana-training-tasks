import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/models/genre.dart';
import 'package:library_system/utils/genre_extensions.dart';

void listBooksByGenreAction(Library library) {
  print('Choose genre to list books:');
  for (int index = 0; index < Genre.values.length; index++) {
    var genre = Genre.values[index];
    print('${index + 1}. ${genre.normalizeGenreInput()}');
  }

  String? input = stdin.readLineSync();
  int? choice = int.tryParse(input ?? '');
  if (choice == null || choice < 1 || choice > Genre.values.length) {
    print('Invalid genre selection.');
    return;
  }

  Genre selectedGenre = Genre.values[choice - 1];
  List<String> booksByGenre = library.listBooksByGenre(selectedGenre);
  print('Books in genre ${selectedGenre.normalizeGenreInput()}:');
  for (var bookInfo in booksByGenre) {
    print(bookInfo);
  }
}
