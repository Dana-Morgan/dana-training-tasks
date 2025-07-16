import 'dart:io';
import 'search_books_menu.dart';

void handleMemberMenu() {
  while (true) {
    print('\nMember Menu:');
    print('1. Borrow Book');
    print('2. Return Book');
    print('3. View Borrowed Books');
    print('4. Search Books');
    print('5. Return to Role Selection');

    stdout.write('Enter your choice: ');
    String? choice = stdin.readLineSync();

    switch (choice) {
      case '1':
        print('Borrow Book selected.');
        break;
      case '2':
        print('Return Book selected.');
        break;
      case '3':
        print('View Borrowed Books selected.');
        break;
      case '4':
        showSearchBooksMenu();
        break;
      case '5':
        print('Returning to Role Selection...');
        return;
      default:
        print('Invalid choice. Please try again.');
    }
  }
}
