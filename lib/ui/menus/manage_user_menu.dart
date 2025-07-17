import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/models/user.dart';
import 'package:library_system/models/librarian.dart';
import 'package:library_system/models/member.dart';
import 'package:library_system/ui/actions/user_addition.dart';

void handleManageUserMenu(Library library) {
  while (true) {
    print('\nUser Management:');
    print('1. List all users');
    print('2. List members');
    print('3. List librarians');
    print('4. Find a user by name');
    print('5. Add a user');
    print('6. Return to Librarian Menu');

    String? option = stdin.readLineSync();

    switch (option) {
      case '1':
        print('Listing all users:');
        for (var user in library.listUsers()) {
          print(user);
        }
        break;
      case '2':
        print('Listing members:');
        for (var member in library.listMembers()) {
          print(member);
        }
        break;
      case '3':
        print('Listing librarians:');
        for (var librarian in library.listLibrarians()) {
          print(librarian);
        }
        break;
      case '4':
        stdout.write('Enter user name to find: ');
        String? name = stdin.readLineSync();
        if (name != null && name.isNotEmpty) {
          User? user = library.findUserByName(name);
          if (user != null) {
            if (user is Librarian) {
              print('Found Librarian: ${user.displayName}, Position: ${user.position}, Phone: ${user.phoneNumber}, Hire Date: ${user.hireDate}');
            } else if (user is Member) {
              print('Found Member: ${user.displayName}, Phone: ${user.phoneNumber}, Max Borrow Limit: ${user.maxBorrowLimit}');
            } else {
              print('Found User: ${user.displayName}, Phone: ${user.phoneNumber}');
            }
          } else {
            print('User not found.');
          }
        } else {
          print('Invalid name input.');
        }
        break;
      case '5':
        handleUserAddition(library);
        break;
      case '6':
        return; 
      default:
        print('Invalid option. Try again.');
    }
  }
}
