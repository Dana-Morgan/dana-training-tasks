import 'dart:io';
import 'package:library_system/services/library_service.dart';
import 'package:library_system/models/premium_member.dart';
import 'package:library_system/models/regular_member.dart';
import 'package:library_system/models/librarian.dart';
import 'package:library_system/ui/menus/librarian_menu.dart';
import 'package:library_system/ui/menus/member_menu.dart';

void main() {
  final library = Library();

  library.addUser(RegularMember(name: 'dana555morgan', phoneNumber: '8512512'));
  library.addUser(RegularMember(name: 'dana555Morgan', phoneNumber: '855512'));
  library.addUser(PremiumMember(name: 'suzan55', phoneNumber: '48523154'));
  library.addUser(Librarian(
    name: 'John Doe',
    phoneNumber: '1234567890',
    employeeId: 'EMP001',
    hireDate: DateTime.now(),
    position: 'Senior Librarian',
  ));

  runLibrarySystem(library);
}

void runLibrarySystem(Library library) {
  while (true) {
    print('\nWelcome to the Library System');
    print('Please select your role:');
    print('1. Librarian');
    print('2. Member');
    print('3. Exit');

    String? roleInput = stdin.readLineSync();

    if (roleInput == null || roleInput == '3') {
      print('Exiting...');
      break;
    }

    switch (roleInput) {
      case '1':
        handleLibrarianMenu(library);
        break;
      case '2':
      print('Member Menu is not implemented yet.');
       handleMemberMenu(); 
        break;
      default:
        print('Invalid role selected.');
    }
  }
}
