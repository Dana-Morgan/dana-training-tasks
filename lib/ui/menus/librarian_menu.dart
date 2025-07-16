import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/ui/menus/manage_user_menu.dart';
import 'package:library_system/ui/menus/manage_book_menu.dart';

void handleLibrarianMenu(Library library) {
  while (true) {
    print('\nLibrarian Menu:');
    print('1. Manage Users');
    print('2. Manage Books');
    print('3. Return to Role Selection');

    String? mainOption = stdin.readLineSync();

    switch (mainOption) {
      case '1':
        handleManageUserMenu(library);
        break;
      case '2':
        handleManageBookMenu(library);
        break;
      case '3':
        return;
      default:
        print('Invalid option. Try again.');
    }
  }
}
