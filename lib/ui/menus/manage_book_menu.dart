import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/ui/actions/add_new_book.dart';
import '../actions/list_books_by_genre.dart';
import '../actions/search_books_by_name.dart';

void handleManageBookMenu(Library library) {
  while (true) {
    print('\nBook Management:');
    print('1. List all books');
    print('2. List available books');
    print('3. List books by genre');
    print('4. Search books by name');
    print('5. Add a new book');
    print('6. Return to Librarian Menu');

    String? option = stdin.readLineSync();

    switch (option) {
      case '1':
        print('Listing all books with quantities:');
        var allBooks = library.listAllBooksWithStock();
        for (var book in allBooks) {
          print(book);
        }
        break;
      case '2':
        print('Listing available books:');
        var availableBooks = library.listAvailableBooksWithWarning(
          showCriticalWarnings: true,
        );
        for (var book in availableBooks) {
          print(book);
        }
        break;
      case '3':
        listBooksByGenreAction(library);
        break;
      case '4':
        searchBooksByNameAction(library);
        break;
      case '5':
        addNewBookAction(library);
        break;
      case '6':
        return;
      default:
        print('Invalid option. Try again.');
    }
  }
}
