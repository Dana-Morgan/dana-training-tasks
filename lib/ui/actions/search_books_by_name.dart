import 'dart:io';
import 'package:library_system/services/library_service.dart';

void searchBooksByNameAction(Library library) {
  print('Enter book name to search:');
  String? nameInput = stdin.readLineSync();

  if (nameInput == null || nameInput.trim().isEmpty) {
    print('Invalid book name input.');
    return;
  }

  List<String> searchResults = library.searchBooksByTitle(nameInput.trim());
  print('Search results for "$nameInput":');
  for (var bookInfo in searchResults) {
    print(bookInfo);
  }
}
