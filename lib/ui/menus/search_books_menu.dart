import 'dart:io';
import 'package:library_system/services/library_service.dart';

void showSearchBooksMenu(Library library) {
  while (true) {
    print('\nSearch Books Menu:');
    print('1. List All Books');
    print('2. List by Genre');
    print('3. Return to Member Menu');
    stdout.write('Select an option: ');
    String? input = stdin.readLineSync();

    switch (input) {
      case '1':
        print('List All Books selected.');
        break;
      case '2':
        print('List by Genre selected.');
        break;
      case '3':
        print('Returning to Member Menu...');
        return;
      default:
        print('Invalid option. Try again.');
    }
  }
}
