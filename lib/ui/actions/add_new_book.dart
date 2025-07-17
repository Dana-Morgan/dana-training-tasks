import 'dart:io';
import 'package:library_system/models/book.dart';
import 'package:library_system/models/genre.dart';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/utils/genre_extensions.dart';

void addNewBookAction(Library library) {
  stdout.write('Enter book title: ');
  String? title = stdin.readLineSync();

  stdout.write('Enter author name: ');
  String? author = stdin.readLineSync();

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

  stdout.write('Enter stock quantity: ');
  String? stockInput = stdin.readLineSync();
  int? stock = int.tryParse(stockInput ?? '');

  if (title != null && author != null && stock != null) {
    Book newBook = Book(
      title: title.trim(),
      author: author.trim(),
      genre: selectedGenre,
      stock: stock,
    );

    library.addBook(newBook);
    print('Book added successfully.');
  } else {
    print('Invalid input. Please try again.');
  }
}
