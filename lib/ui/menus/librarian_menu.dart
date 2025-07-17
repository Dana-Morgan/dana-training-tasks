import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/ui/menus/manage_user_menu.dart';
import 'package:library_system/ui/menus/manage_book_menu.dart';
import 'package:library_system/models/librarian.dart';

void handleLibrarianMenu(Librarian librarian, Library library) {
  while (true) {
    print('\nLibrarian Menu for ${librarian.displayName}: ');
    print('1. Manage Users');
    print('2. Manage Books');
    print('3. Logout');

    stdout.write('Enter your choice: ');
    String? mainOption = stdin.readLineSync();

    switch (mainOption) {
      case '1':
        handleManageUserMenu(library);
        break;
      case '2':
        handleManageBookMenu(library);
        break;
      case '3':
        print('Logging out...');
        return;
      default:
        print('Invalid option. Try again.');
    }
  }
}
