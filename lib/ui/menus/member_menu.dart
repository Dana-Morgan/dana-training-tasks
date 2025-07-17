import 'dart:io';
import 'package:library_system/models/member.dart';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/ui/actions/borrow_book.dart';
import 'package:library_system/ui/actions/return_book.dart';
import 'package:library_system/ui/actions/view_borrowed_books.dart';
import 'package:library_system/ui/menus/search_books_menu.dart';

void handleMemberMenu(Member member, Library library) {
  while (true) {
    print('\n Member Menu for ${member.displayName}: ');
    print('1. Borrow Book');
    print('2. Return Book');
    print('3. View Borrowed Books');
    print('4. Search Books');
    print('5. Logout');

    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        handleBorrowBook(member, library);
        break;
      case '2':
        handleReturnBook(member);
        break;
      case '3':
        handleViewBorrowedBooks(member);
        break;
      case '4':
        showSearchBooksMenu(library);
        break;
      case '5':
        print('Logging out...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
